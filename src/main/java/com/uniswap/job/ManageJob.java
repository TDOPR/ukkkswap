package com.uniswap.job;

import com.uniswap.common.TaskRedisCheckKey;

import com.uniswap.manager.EventManager;
import com.uniswap.manager.TradeManager;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;


import java.time.Duration;

@Slf4j
@Component
public class ManageJob {
    @Autowired
    private StringRedisTemplate redisTemplate;

    @Autowired
    private TradeManager tradeManager;

    @Autowired
    private EventManager eventManager;

    @Scheduled(fixedDelay = 3000)
    public void analyzeEvent() {
        try {
            boolean bool = redisTemplate.opsForValue().setIfAbsent(TaskRedisCheckKey.ANALYZE_EVENT_ETH, "", Duration.ofSeconds(30));
            if (bool) {
                eventManager.analyzeEvent();
            } else {
                log.error(log.getName() + "同步事务失败，上一任务正在运行!");
            }
        } catch (Exception e) {
            log.error("同步事务失败,失败信息【{}】", e);
            e.printStackTrace();
        } finally {
            redisTemplate.delete(TaskRedisCheckKey.ANALYZE_EVENT_ETH);
        }
    }

    @Scheduled(fixedDelay = 3000)
    public void analyzeBscEvent() {
        try {
            boolean bool = redisTemplate.opsForValue().setIfAbsent(TaskRedisCheckKey.ANALYZE_EVENT_BSC, "", Duration.ofSeconds(30));
            if (bool) {
                eventManager.analyzeBscEvent();
            } else {
                log.error(log.getName() + "同步事务失败，上一任务正在运行!");
            }
        } catch (Exception e) {
            log.error("同步事务失败,失败信息【{}】", e);
            e.printStackTrace();
        } finally {
            redisTemplate.delete(TaskRedisCheckKey.ANALYZE_EVENT_BSC);
        }
    }

    @Scheduled(fixedDelay = 3000)
    public void depositWithdrawEth() {
        try {
            boolean bool = redisTemplate.opsForValue().setIfAbsent(TaskRedisCheckKey.DEPOSIT_WITHDRAW_ETH, "", Duration.ofSeconds(30));
            if (bool) {
                eventManager.depositWithdrawEth();
            } else {
                log.error(log.getName() + "同步事务失败，上一任务正在运行!");
            }
        } catch (Exception e) {
            log.error("同步事务失败,失败信息【{}】", e);
            e.printStackTrace();
        } finally {
            redisTemplate.delete(TaskRedisCheckKey.DEPOSIT_WITHDRAW_ETH);
        }
    }

    @Scheduled(fixedDelay = 3000)
    public void depositWithdrawBsc() {
        try {
            boolean bool = redisTemplate.opsForValue().setIfAbsent(TaskRedisCheckKey.DEPOSIT_WITHDRAW_BSC, "", Duration.ofSeconds(30));
            if (bool) {
                eventManager.depositWithdrawBsc();
            } else {
                log.error(log.getName() + "同步事务失败，上一任务正在运行!");
            }
        } catch (Exception e) {
            log.error("同步事务失败,失败信息【{}】", e);
            e.printStackTrace();
        } finally {
            redisTemplate.delete(TaskRedisCheckKey.DEPOSIT_WITHDRAW_BSC);
        }
    }

}
