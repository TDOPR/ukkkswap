package com.uniswap.manager;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.uniswap.config.TokenConfig;
import com.uniswap.entity.*;
import com.uniswap.enums.ChainTypeEnum;
import com.uniswap.mapper.CoinConfigDao;
import com.uniswap.service.*;
import com.uniswap.utils.Help;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.web3j.contracts.token.ERC20BasicInterface;
import org.web3j.protocol.core.methods.request.EthFilter;
import org.web3j.protocol.core.methods.response.EthBlock;
import org.web3j.protocol.core.methods.response.Log;
import picocli.CommandLine;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Slf4j
@Service("eventManager")
public class EventManager {

    @Resource
    private CoinConfigDao coinConfigDao;

    @Resource
    private ERC20WalletHandleService erc20WalletHandleService;
    
    @Resource
    private ERC20BSCWalletHandleService erc20BSCWalletHandleService;
    @Resource
    private CoinConfigService coinConfigService;

    @Resource
    private EvmEventService evmEventService;
    
    @Resource
    private EvmEventBscService evmEventBscService;

    @Resource
    private TradeManager tradeManager;
    
    @Resource
    private DepositsWithdrawEvmEventService depositsWithdrawEvmEventService;
    
    @Resource
    private DepositsWithdrawEvmEventBscService depositsWithdrawEvmEventBscService;
    
    @Resource
    private TokenConfig tokenConfig;

    public void analyzeEvent() throws Exception {
        CoinConfigEntity scanDataConfig = coinConfigDao.getScanDataConfig(tokenConfig.getChainIdEth());
        if (scanDataConfig == null) {
            return;
        }
        BigInteger currentBlock = erc20WalletHandleService.queryBlockLast();
        BigInteger oldBlock = scanDataConfig.getBlockNo();
        oldBlock = oldBlock.add(BigInteger.ONE);
        if (currentBlock.subtract(oldBlock).compareTo(new BigInteger("5000")) > -1) {
            currentBlock = oldBlock.add(new BigInteger("4999"));
        }
        log.info(log.getName() + ".scanDataJob currentBlock:{}, oldBlock:{}", currentBlock, oldBlock);
        executeOneBlock(oldBlock, currentBlock);
        coinConfigDao.updateActionSeqById(scanDataConfig.getId(), currentBlock);
    }
    
    public void analyzeBscEvent() throws Exception {
        CoinConfigEntity scanDataConfig = coinConfigDao.getBscScanDataConfig(tokenConfig.getChainIdBsc());
        if (scanDataConfig == null) {
            return;
        }
        BigInteger currentBlock = erc20BSCWalletHandleService.queryBlockLast();
        BigInteger oldBlock = scanDataConfig.getBlockNo();
        oldBlock = oldBlock.add(BigInteger.ONE);
        if (currentBlock.subtract(oldBlock).compareTo(new BigInteger("5000")) > -1) {
            currentBlock = oldBlock.add(new BigInteger("4999"));
        }
        log.info(log.getName() + ".scanDataJob currentBlock:{}, oldBlock:{}", currentBlock, oldBlock);
        executeBscOneBlock(oldBlock, currentBlock);
        coinConfigDao.updateActionSeqById(scanDataConfig.getId(), currentBlock);
    }
    
    public void depositWithdrawEth() throws Exception{
        CoinConfigEntity scanDataConfig = coinConfigDao.getEthDepositScanDataConfig(tokenConfig.getChainIdEth());
        if (scanDataConfig == null) {
            return;
        }
        BigInteger currentBlock = erc20WalletHandleService.queryBlockLast();
        BigInteger oldBlock = scanDataConfig.getBlockNo();
        oldBlock = oldBlock.add(BigInteger.ONE);
        if (currentBlock.subtract(oldBlock).compareTo(new BigInteger("5000")) > -1) {
            currentBlock = oldBlock.add(new BigInteger("4999"));
        }
        log.info(log.getName() + ".scanDataJob currentBlock:{}, oldBlock:{}", currentBlock, oldBlock);
        scanEthBlock(oldBlock, currentBlock);
        coinConfigDao.updateActionSeqById(scanDataConfig.getId(), currentBlock);
    }
    
    public void depositWithdrawBsc() throws Exception{
        CoinConfigEntity scanDataConfig = coinConfigDao.getBscDepositScanDataConfig(tokenConfig.getChainIdBsc());
        if (scanDataConfig == null) {
            return;
        }
        BigInteger currentBlock = erc20BSCWalletHandleService.queryBlockLast();
        BigInteger oldBlock = scanDataConfig.getBlockNo();
        oldBlock = oldBlock.add(BigInteger.ONE);
        if (currentBlock.subtract(oldBlock).compareTo(new BigInteger("5000")) > -1) {
            currentBlock = oldBlock.add(new BigInteger("4999"));
        }
        log.info(log.getName() + ".scanDataJob currentBlock:{}, oldBlock:{}", currentBlock, oldBlock);
        scanBscBlock(oldBlock, currentBlock);
        coinConfigDao.updateActionSeqById(scanDataConfig.getId(), currentBlock);
    }
    
    private void scanEthBlock(BigInteger oldBlock, BigInteger toBlock) throws Exception{
        QueryWrapper<CoinConfigEntity> coinConfigEntityQueryWrapper = new QueryWrapper<>();
        coinConfigEntityQueryWrapper.eq("coin", "DEPOSIT");
        coinConfigEntityQueryWrapper.eq("chain_id", tokenConfig.getChainIdEth());
        CoinConfigEntity eventConfig = coinConfigService.getOne(coinConfigEntityQueryWrapper);
        String eventContract = eventConfig.getContract();
    
        String depositsCreated = erc20WalletHandleService.createDepositsEvent();
        String withdrawCreated = erc20WalletHandleService.createWithdrawEvent();
    
        EthFilter ethFilter = erc20WalletHandleService.createFilter(oldBlock, toBlock, eventContract);
        ethFilter.addOptionalTopics(depositsCreated,withdrawCreated);
        List<Log> logsList = erc20WalletHandleService.getLogByFilter(ethFilter);
        if (Help.isNull(logsList)) {
            return;
        }
        List<DepositsWithdrawEvmEventEntity> evmEventEntityArrayList = new ArrayList<>();
        for (Log logsLog : logsList) {
            String txHash = logsLog.getTransactionHash();
            if (depositsWithdrawEvmEventService.getEventExistByTxHash(txHash)) {
                continue;
            }
            ArrayList topics = (ArrayList) logsLog.getTopics();
            String eventName = topics.get(0).toString();
            String data = logsLog.getData();
            String decodeEventName = "";
        
            if (eventName.equalsIgnoreCase(depositsCreated)) {
                String userAddress = "0x" + topics.get(1).toString().substring(2).replace("000000000000000000000000", "");
                String tokenAddress = "0x" + topics.get(2).toString().substring(2).replace("000000000000000000000000", "");
                String amount = (new BigInteger(topics.get(3).toString().substring(2),16)).toString();
                BigInteger decimals = new BigInteger(data.substring(2, 66).replaceAll("^(0+)", ""), 16);
                String symbolHex = data.substring(194, 256);
                String symbol = Help.fromHexStringToString(symbolHex).toUpperCase();
                decodeEventName = "Deposit";
                String blockHash = logsLog.getBlockHash();
                EthBlock.Block ethBlock = erc20WalletHandleService.getBlockByHash(blockHash);
                Date date = new Date(ethBlock.getTimestamp().intValue() * 1000L);
                tradeManager.creatEthDepositWithdrawEvent(userAddress, tokenAddress, amount, decimals, symbol, date, decodeEventName);
            
                DepositsWithdrawEvmEventEntity ethScanDataEntity = DepositsWithdrawEvmEventEntity.builder()
                        .txHash(txHash)
                        .blockNum(new BigInteger(logsLog.getBlockNumber().toString(10)))
                        .createTime(date).build();
                evmEventEntityArrayList.add(ethScanDataEntity);
            } else if (eventName.equalsIgnoreCase(withdrawCreated)) {
                String userAddress = "0x" + topics.get(1).toString().substring(2).replace("000000000000000000000000", "");
                String tokenAddress = "0x" + topics.get(2).toString().substring(2).replace("000000000000000000000000", "");
                String amount = (new BigInteger(topics.get(3).toString().substring(2),16)).toString();
                BigInteger decimals = new BigInteger(data.substring(2, 66).replaceAll("^(0+)", ""), 16);
                String symbolHex = data.substring(194, 256);
                String symbol = Help.fromHexStringToString(symbolHex).toUpperCase();
                decodeEventName = "Withdraw";
                String blockHash = logsLog.getBlockHash();
                EthBlock.Block ethBlock = erc20WalletHandleService.getBlockByHash(blockHash);
                Date date = new Date(ethBlock.getTimestamp().intValue() * 1000L);
                tradeManager.creatEthDepositWithdrawEvent(userAddress, tokenAddress, amount, decimals, symbol, date, decodeEventName);
    
                DepositsWithdrawEvmEventEntity ethScanDataEntity = DepositsWithdrawEvmEventEntity.builder()
                        .txHash(txHash)
                        .blockNum(new BigInteger(logsLog.getBlockNumber().toString(10)))
                        .createTime(date).build();
                evmEventEntityArrayList.add(ethScanDataEntity);
            }
        }
        if (Help.isNotNull(evmEventEntityArrayList)) {
            depositsWithdrawEvmEventService.saveBatch(evmEventEntityArrayList);
        }
    }
    
    private void scanBscBlock(BigInteger oldBlock, BigInteger toBlock) throws Exception{
        QueryWrapper<CoinConfigEntity> coinConfigEntityQueryWrapper = new QueryWrapper<>();
        coinConfigEntityQueryWrapper.eq("coin", "DEPOSIT");
        coinConfigEntityQueryWrapper.eq("chain_id", tokenConfig.getChainIdBsc());
        CoinConfigEntity eventConfig = coinConfigService.getOne(coinConfigEntityQueryWrapper);
        String eventContract = eventConfig.getContract();
        
        String depositsCreated = erc20BSCWalletHandleService.createDepositsEvent();
        String withdrawCreated = erc20BSCWalletHandleService.createWithdrawEvent();
        
        EthFilter ethFilter = erc20BSCWalletHandleService.createFilter(oldBlock, toBlock, eventContract);
        ethFilter.addOptionalTopics(depositsCreated,withdrawCreated);
        List<Log> logsList = erc20BSCWalletHandleService.getLogByFilter(ethFilter);
        if (Help.isNull(logsList)) {
            return;
        }
        List<DepositsWithdrawEvmEventBscEntity> evmEventEntityArrayList = new ArrayList<>();
        for (Log logsLog : logsList) {
            String txHash = logsLog.getTransactionHash();
            if (depositsWithdrawEvmEventBscService.getEventExistByTxHash(txHash)) {
                continue;
            }
            ArrayList topics = (ArrayList) logsLog.getTopics();
            String eventName = topics.get(0).toString();
            String data = logsLog.getData();
            String decodeEventName = "";
            
            if (eventName.equalsIgnoreCase(depositsCreated)) {
                String userAddress = "0x" + topics.get(1).toString().substring(2).replace("000000000000000000000000", "");
                String tokenAddress = "0x" + topics.get(2).toString().substring(2).replace("000000000000000000000000", "");
                String amount = (new BigInteger(topics.get(3).toString().substring(2),16)).toString();
                BigInteger decimals = new BigInteger(data.substring(2, 66).replaceAll("^(0+)", ""), 16);
                String symbolHex = data.substring(194, 256);
                String symbol = Help.fromHexStringToString(symbolHex).toUpperCase();
                decodeEventName = "Deposit";
                String blockHash = logsLog.getBlockHash();
                EthBlock.Block ethBlock = erc20BSCWalletHandleService.getBlockByHash(blockHash);
                Date date = new Date(ethBlock.getTimestamp().intValue() * 1000L);
                tradeManager.creatEthDepositWithdrawEvent(userAddress, tokenAddress, amount, decimals, symbol, date, decodeEventName);
                
                DepositsWithdrawEvmEventBscEntity bscScanDataEntity = DepositsWithdrawEvmEventBscEntity.builder()
                        .txHash(txHash)
                        .blockNum(new BigInteger(logsLog.getBlockNumber().toString(10)))
                        .createTime(date).build();
                evmEventEntityArrayList.add(bscScanDataEntity);
            } else if (eventName.equalsIgnoreCase(withdrawCreated)) {
                String userAddress = "0x" + topics.get(1).toString().substring(2).replace("000000000000000000000000", "");
                String tokenAddress = "0x" + topics.get(2).toString().substring(2).replace("000000000000000000000000", "");
                String amount = (new BigInteger(topics.get(3).toString().substring(2),16)).toString();
                BigInteger decimals = new BigInteger(data.substring(2, 66).replaceAll("^(0+)", ""), 16);
                String symbolHex = data.substring(194, 256);
                String symbol = Help.fromHexStringToString(symbolHex).toUpperCase();
                decodeEventName = "Withdraw";
                String blockHash = logsLog.getBlockHash();
                EthBlock.Block bscBlock = erc20BSCWalletHandleService.getBlockByHash(blockHash);
                Date date = new Date(bscBlock.getTimestamp().intValue() * 1000L);
                tradeManager.creatBscDepositWithdrawEvent(userAddress, tokenAddress, amount, decimals, symbol, date, decodeEventName);
                
                DepositsWithdrawEvmEventBscEntity bscScanDataEntity = DepositsWithdrawEvmEventBscEntity.builder()
                        .txHash(txHash)
                        .blockNum(new BigInteger(logsLog.getBlockNumber().toString(10)))
                        .createTime(date).build();
                evmEventEntityArrayList.add(bscScanDataEntity);
            }
        }
        if (Help.isNotNull(evmEventEntityArrayList)) {
            depositsWithdrawEvmEventBscService.saveBatch(evmEventEntityArrayList);
        }
    }

    private void executeOneBlock(BigInteger oldBlock, BigInteger toBlock) throws Exception {
        QueryWrapper<CoinConfigEntity> coinConfigEntityQueryWrapper = new QueryWrapper<>();
        coinConfigEntityQueryWrapper.eq("coin", "EVENT");
        coinConfigEntityQueryWrapper.eq("chain_id", tokenConfig.getChainIdEth());
        CoinConfigEntity eventConfig = coinConfigService.getOne(coinConfigEntityQueryWrapper);
        String eventContract = eventConfig.getContract();

        String pairCreated = erc20WalletHandleService.createPairCreatedEvent();

        EthFilter ethFilter = erc20WalletHandleService.createFilter(oldBlock, toBlock, eventContract);
        ethFilter.addOptionalTopics(pairCreated);
        List<Log> logsList = erc20WalletHandleService.getLogByFilter(ethFilter);
        if (Help.isNull(logsList)) {
            return;
        }
        List<EvmEventEntity> evmEventEntityArrayList = new ArrayList<>();
        for (Log logsLog : logsList) {
            String txHash = logsLog.getTransactionHash();
            if (evmEventService.getEventExistByTxHash(txHash)) {
                continue;
            }
            ArrayList topics = (ArrayList) logsLog.getTopics();
            String eventName = topics.get(0).toString();
            String data = logsLog.getData();

            if (eventName.equalsIgnoreCase(pairCreated)) {
                String token0 = "0x" + topics.get(1).toString().substring(2).replace("000000000000000000000000", "");
                String token1 = "0x" + topics.get(2).toString().substring(2).replace("000000000000000000000000", "");
                String pair = "0x" + data.substring(2, 66).replace("000000000000000000000000", "");
                BigInteger pairLength = new BigInteger(data.substring(67, 130).replaceAll("^(0+)", ""), 16);
                tradeManager.creatPair(token0, token1, pair, pairLength, tokenConfig.getChainIdEth());

                String blockHash = logsLog.getBlockHash();
                EthBlock.Block ethBlock = erc20WalletHandleService.getBlockByHash(blockHash);
                Date date = new Date(ethBlock.getTimestamp().intValue() * 1000L);

                EvmEventEntity ethScanDataEntity = EvmEventEntity.builder()
                        .txHash(txHash)
                        .blockNum(new BigInteger(logsLog.getBlockNumber().toString(10)))
                        .createTime(date)
                        .chainId(tokenConfig.getChainIdEth())
                        .build();
                evmEventEntityArrayList.add(ethScanDataEntity);
            }
        }
        if (Help.isNotNull(evmEventEntityArrayList)) {
            evmEventService.saveBatch(evmEventEntityArrayList);
        }
    }
    
    private void executeBscOneBlock(BigInteger oldBlock, BigInteger toBlock) throws Exception {
        QueryWrapper<CoinConfigEntity> coinConfigEntityQueryWrapper = new QueryWrapper<>();
        coinConfigEntityQueryWrapper.eq("coin", "EVENT");
        coinConfigEntityQueryWrapper.eq("chain_id", tokenConfig.getChainIdBsc());
        CoinConfigEntity eventConfig = coinConfigService.getOne(coinConfigEntityQueryWrapper);
        String eventContract = eventConfig.getContract();
        
        String pairCreated = erc20BSCWalletHandleService.createPairCreatedEvent();
        
        EthFilter ethFilter = erc20BSCWalletHandleService.createFilter(oldBlock, toBlock, eventContract);
        ethFilter.addOptionalTopics(pairCreated);
        List<Log> logsList = erc20BSCWalletHandleService.getLogByFilter(ethFilter);
        if (Help.isNull(logsList)) {
            return;
        }
        List<EvmEventBscEntity> evmEventEntityBscArrayList = new ArrayList<>();
        for (Log logsLog : logsList) {
            String txHash = logsLog.getTransactionHash();
            if (evmEventBscService.getEventExistByTxHash(txHash)) {
                continue;
            }
            ArrayList topics = (ArrayList) logsLog.getTopics();
            String eventName = topics.get(0).toString();
            String data = logsLog.getData();
            
            if (eventName.equalsIgnoreCase(pairCreated)) {
                String token0 = "0x" + topics.get(1).toString().substring(2).replace("000000000000000000000000", "");
                String token1 = "0x" + topics.get(2).toString().substring(2).replace("000000000000000000000000", "");
                String pair = "0x" + data.substring(2, 66).replace("000000000000000000000000", "");
                BigInteger pairLength = new BigInteger(data.substring(67, 130).replaceAll("^(0+)", ""), 16);
                tradeManager.creatBscPair(token0, token1, pair, pairLength, tokenConfig.getChainIdBsc());
                
                String blockHash = logsLog.getBlockHash();
                EthBlock.Block bscBlock = erc20BSCWalletHandleService.getBlockByHash(blockHash);
                Date date = new Date(bscBlock.getTimestamp().intValue() * 1000L);
                
                EvmEventBscEntity bscScanDataEntity = EvmEventBscEntity.builder()
                        .txHash(txHash)
                        .blockNum(new BigInteger(logsLog.getBlockNumber().toString(10)))
                        .createTime(date)
                        .chainId(tokenConfig.getChainIdBsc())
                        .build();
                evmEventEntityBscArrayList.add(bscScanDataEntity);
            }
        }
        if (Help.isNotNull(evmEventEntityBscArrayList)) {
            evmEventBscService.saveBatch(evmEventEntityBscArrayList);
        }
    }
}
