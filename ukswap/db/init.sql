CREATE
DATABASE IF NOT EXISTS ukswap;
use
ukswap;


/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 100424
 Source Host           : localhost:3306
 Source Schema         : swappair

 Target Server Type    : MySQL
 Target Server Version : 100424
 File Encoding         : 65001

 Date: 30/06/2023 18:11:25
*/

SET NAMES utf8mb4;
SET
FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for deposit_withdraw_evm_event
-- ----------------------------
DROP TABLE IF EXISTS `deposit_withdraw_evm_event`;
CREATE TABLE `deposit_withdraw_evm_event`
(
    `id`          int(11) NOT NULL AUTO_INCREMENT,
    `block_num`   bigint(20) NULL DEFAULT NULL,
    `tx_hash`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `event_name`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `chain_id`    int(11) NULL DEFAULT NULL,
    `create_time` datetime(0) NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

SET
FOREIGN_KEY_CHECKS = 1;

/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 100424
 Source Host           : localhost:3306
 Source Schema         : swappair

 Target Server Type    : MySQL
 Target Server Version : 100424
 File Encoding         : 65001

 Date: 30/06/2023 18:13:11
*/

SET NAMES utf8mb4;
SET
FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for deposit_withdraw_evm_event_bsc
-- ----------------------------
DROP TABLE IF EXISTS `deposit_withdraw_evm_event_bsc`;
CREATE TABLE `deposit_withdraw_evm_event_bsc`
(
    `id`          int(11) NOT NULL AUTO_INCREMENT,
    `block_num`   bigint(20) NULL DEFAULT NULL,
    `tx_hash`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `event_name`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `chain_id`    int(11) NULL DEFAULT NULL,
    `create_time` datetime(0) NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

SET
FOREIGN_KEY_CHECKS = 1;

/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 100424
 Source Host           : localhost:3306
 Source Schema         : swappair

 Target Server Type    : MySQL
 Target Server Version : 100424
 File Encoding         : 65001

 Date: 30/06/2023 18:14:29
*/

SET NAMES utf8mb4;
SET
FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for deposit_withdraw_info
-- ----------------------------
DROP TABLE IF EXISTS `deposit_withdraw_info`;
CREATE TABLE `deposit_withdraw_info`
(
    `id`            int(11) NOT NULL AUTO_INCREMENT,
    `user_address`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `token_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `amount`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `date`          datetime(0) NULL DEFAULT NULL,
    `event_name`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `chain_id`      int(11) NULL DEFAULT NULL,
    `creat_time`    datetime(0) NULL DEFAULT NULL,
    `decimals`      int(11) NULL DEFAULT NULL,
    `symbol`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

SET
FOREIGN_KEY_CHECKS = 1;

/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 100424
 Source Host           : localhost:3306
 Source Schema         : swappair

 Target Server Type    : MySQL
 Target Server Version : 100424
 File Encoding         : 65001

 Date: 30/06/2023 18:15:04
*/

SET NAMES utf8mb4;
SET
FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for deposit_withdraw_info_bsc
-- ----------------------------
DROP TABLE IF EXISTS `deposit_withdraw_info_bsc`;
CREATE TABLE `deposit_withdraw_info_bsc`
(
    `id`            int(11) NOT NULL AUTO_INCREMENT,
    `user_address`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `token_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `amount`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `date`          datetime(0) NULL DEFAULT NULL,
    `event_name`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `chain_id`      int(11) NULL DEFAULT NULL,
    `creat_time`    datetime(0) NULL DEFAULT NULL,
    `decimals`      int(11) NULL DEFAULT NULL,
    `symbol`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

SET
FOREIGN_KEY_CHECKS = 1;

/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 100424
 Source Host           : localhost:3306
 Source Schema         : swappair

 Target Server Type    : MySQL
 Target Server Version : 100424
 File Encoding         : 65001

 Date: 04/07/2023 11:27:48
*/

SET NAMES utf8mb4;
SET
FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for eth_token_coin_config
-- ----------------------------
DROP TABLE IF EXISTS `eth_token_coin_config`;
CREATE TABLE `eth_token_coin_config`
(
    `id`              int(11) NOT NULL AUTO_INCREMENT,
    `coin`            varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `coin_id`         int(11) NULL DEFAULT NULL,
    `coin_type`       varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `contract`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `token`           varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `round`           int(11) NULL DEFAULT NULL COMMENT '小数位数',
    `main_address`    varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主钱包地址',
    `password`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `collect_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归集钱包地址',
    `account_name`    varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `block_no`        bigint(11) NULL DEFAULT NULL,
    `chain_id`        int(11) NULL DEFAULT NULL COMMENT '链ID：1 ETH, 56 BSC',
    `valid`           varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否可用：E可用，D不可用',
    `remark`          varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
    `create_time`     datetime(0) NULL DEFAULT NULL,
    `update_time`     datetime(0) NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eth_token_coin_config
-- ----------------------------
INSERT INTO `eth_token_coin_config`
VALUES (1, 'EVENT', NULL, 'EVENT', '0xcA143Ce32Fe78f1f7019d7d551a6402fC5350c73', NULL, NULL, NULL, NULL, NULL, NULL,
        13414737, 56, 'E', NULL, NULL, '2023-07-04 11:26:54');
INSERT INTO `eth_token_coin_config`
VALUES (2, 'EVENT', NULL, 'EVENT', '0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f', NULL, NULL, NULL, NULL, NULL, NULL,
        11195851, 1, 'E', NULL, NULL, '2023-07-04 11:27:05');
INSERT INTO `eth_token_coin_config`
VALUES (3, 'DEPOSIT', NULL, 'DEPOSIT', '0xa52767585F6dF00dCc64763CD101FC5cc76Bee6d', NULL, NULL, NULL, NULL, NULL, NULL,
        14435851, 1, 'E', NULL, NULL, '2023-07-04 11:27:47');
INSERT INTO `eth_token_coin_config`
VALUES (4, 'DEPOSIT', NULL, 'DEPOSIT', '0x42B069e8Fdde7bF5F7709c0B7E6197B951CCF837', NULL, NULL, NULL, NULL, NULL, NULL,
        29657702, 56, 'E', NULL, NULL, '2023-07-04 11:27:46');

SET
FOREIGN_KEY_CHECKS = 1;


/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 100424
 Source Host           : localhost:3306
 Source Schema         : swappair

 Target Server Type    : MySQL
 Target Server Version : 100424
 File Encoding         : 65001

 Date: 30/06/2023 18:17:28
*/

SET NAMES utf8mb4;
SET
FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for evm_event
-- ----------------------------
DROP TABLE IF EXISTS `evm_event`;
CREATE TABLE `evm_event`
(
    `id`          int(11) NOT NULL AUTO_INCREMENT,
    `block_num`   bigint(20) NULL DEFAULT NULL,
    `tx_hash`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `event_name`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `chain_id`    int(11) NULL DEFAULT NULL,
    `create_time` datetime(0) NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

SET
FOREIGN_KEY_CHECKS = 1;

/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 100424
 Source Host           : localhost:3306
 Source Schema         : swappair

 Target Server Type    : MySQL
 Target Server Version : 100424
 File Encoding         : 65001

 Date: 30/06/2023 18:17:58
*/

SET NAMES utf8mb4;
SET
FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for evm_event_bsc
-- ----------------------------
DROP TABLE IF EXISTS `evm_event_bsc`;
CREATE TABLE `evm_event_bsc`
(
    `id`          int(11) NOT NULL AUTO_INCREMENT,
    `block_num`   bigint(20) NULL DEFAULT NULL,
    `tx_hash`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `event_name`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `chain_id`    int(11) NULL DEFAULT NULL,
    `create_time` datetime(0) NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

SET
FOREIGN_KEY_CHECKS = 1;

/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 100424
 Source Host           : localhost:3306
 Source Schema         : swappair

 Target Server Type    : MySQL
 Target Server Version : 100424
 File Encoding         : 65001

 Date: 30/06/2023 18:18:28
*/

SET NAMES utf8mb4;
SET
FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for pancake_swap_pair_info
-- ----------------------------
DROP TABLE IF EXISTS `pancake_swap_pair_info`;
CREATE TABLE `pancake_swap_pair_info`
(
    `id`          int(11) NOT NULL AUTO_INCREMENT,
    `token0`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `token1`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `pair`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `pair_length` bigint(20) NULL DEFAULT NULL,
    `chain_id`    int(11) NOT NULL COMMENT '1 代表 ETH链  56 代表 BSC链',
    `create_time` datetime(0) NULL DEFAULT NULL,
    PRIMARY KEY (`id`, `chain_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

SET
FOREIGN_KEY_CHECKS = 1;

/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 100424
 Source Host           : localhost:3306
 Source Schema         : swappair

 Target Server Type    : MySQL
 Target Server Version : 100424
 File Encoding         : 65001

 Date: 30/06/2023 18:18:58
*/

SET NAMES utf8mb4;
SET
FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for pancake_swap_pair_info_bsc
-- ----------------------------
DROP TABLE IF EXISTS `pancake_swap_pair_info_bsc`;
CREATE TABLE `pancake_swap_pair_info_bsc`
(
    `id`          int(11) NOT NULL AUTO_INCREMENT,
    `token0`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `token1`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `pair`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `pair_length` bigint(20) NULL DEFAULT NULL,
    `chain_id`    int(11) NULL DEFAULT NULL,
    `create_time` datetime(0) NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

SET
FOREIGN_KEY_CHECKS = 1;

/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 100424
 Source Host           : localhost:3306
 Source Schema         : swappair

 Target Server Type    : MySQL
 Target Server Version : 100424
 File Encoding         : 65001

 Date: 30/06/2023 18:19:53
*/

SET NAMES utf8mb4;
SET
FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for token
-- ----------------------------
DROP TABLE IF EXISTS `token`;
CREATE TABLE `token`
(
    `id`       int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `symbol`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `address`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `logo_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
    `chain_Id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
    `decimals` bigint(20) NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 343 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of token
-- ----------------------------
INSERT INTO `token`
VALUES (1, 'Dai Stablecoin', 'DAI', '0x6B175474E89094C44Da98b954EedeAC495271d0F',
        'https://raw.githubusercontent.com/trustwallet/assets/master/blockchains/ethereum/assets/0x6B175474E89094C44Da98b954EedeAC495271d0F/logo.png',
        '1', 18);
INSERT INTO `token`
VALUES (2, '0x Protocol Token', 'ZRX', '0xE41d2489571d322189246DaFA5ebDe1F4699F498',
        'https://raw.githubusercontent.com/trustwallet/assets/master/blockchains/ethereum/assets/0xE41d2489571d322189246DaFA5ebDe1F4699F498/logo.png',
        '1', 18);
INSERT INTO `token`
VALUES (3, 'Curve DAO Token', 'CRV', '0xD533a949740bb3306d119CC777fa900bA034cd52',
        'https://raw.githubusercontent.com/trustwallet/assets/master/blockchains/ethereum/assets/0xD533a949740bb3306d119CC777fa900bA034cd52/logo.png',
        '1', 18);
INSERT INTO `token`
VALUES (4, 'Uniswap', 'UNI', '0x1f9840a85d5aF5bf1D1762F925BDADdC4201F984',
        'ipfs://QmXttGpZrECX5qCyXbBQiqgQNytVGeZW5Anewvh2jc4psg', '1', 18);
INSERT INTO `token`
VALUES (5, 'Tether USD', 'USDT', '0xdAC17F958D2ee523a2206206994597C13D831ec7',
        'https://raw.githubusercontent.com/trustwallet/assets/master/blockchains/ethereum/assets/0xdAC17F958D2ee523a2206206994597C13D831ec7/logo.png',
        '1', 6);
INSERT INTO `token`
VALUES (6, 'USDCoin', 'USDC', '0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48',
        'https://raw.githubusercontent.com/trustwallet/assets/master/blockchains/ethereum/assets/0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48/logo.png',
        '1', 6);
INSERT INTO `token`
VALUES (7, 'Orchid', 'OXT', '0x4575f41308EC1483f3d399aa9a2826d74Da13Deb',
        'https://raw.githubusercontent.com/trustwallet/assets/master/blockchains/ethereum/assets/0x4575f41308EC1483f3d399aa9a2826d74Da13Deb/logo.png',
        '1', 18);
INSERT INTO `token`
VALUES (8, 'Maker', 'MKR', '0x9f8F72aA9304c8B593d555F12eF6589cC3A579A2',
        'https://raw.githubusercontent.com/trustwallet/assets/master/blockchains/ethereum/assets/0x9f8F72aA9304c8B593d555F12eF6589cC3A579A2/logo.png',
        '1', 18);
INSERT INTO `token`
VALUES (9, 'ChainLink Token', 'LINK', '0x514910771AF9Ca656af840dff83E8264EcF986CA',
        'https://raw.githubusercontent.com/trustwallet/assets/master/blockchains/ethereum/assets/0x514910771AF9Ca656af840dff83E8264EcF986CA/logo.png',
        '1', 18);
INSERT INTO `token`
VALUES (10, 'Reputation Augur v1', 'REP', '0x1985365e9f78359a9B6AD760e32412f4a445E862',
        'https://raw.githubusercontent.com/trustwallet/assets/master/blockchains/ethereum/assets/0x1985365e9f78359a9B6AD760e32412f4a445E862/logo.png',
        '1', 18);
INSERT INTO `token`
VALUES (11, 'Reputation Augur v2', 'REPv2', '0x221657776846890989a759BA2973e427DfF5C9bB',
        'https://raw.githubusercontent.com/trustwallet/assets/master/blockchains/ethereum/assets/0x221657776846890989a759BA2973e427DfF5C9bB/logo.png',
        '1', 18);
INSERT INTO `token`
VALUES (12, 'Kyber Network Crystal', 'KNC', '0xdd974D5C2e2928deA5F71b9825b8b646686BD200',
        'https://raw.githubusercontent.com/trustwallet/assets/master/blockchains/ethereum/assets/0xdd974D5C2e2928deA5F71b9825b8b646686BD200/logo.png',
        '1', 18);
INSERT INTO `token`
VALUES (13, 'Compound', 'COMP', '0xc00e94Cb662C3520282E6f5717214004A7f26888',
        'https://raw.githubusercontent.com/trustwallet/assets/master/blockchains/ethereum/assets/0xc00e94Cb662C3520282E6f5717214004A7f26888/logo.png',
        '1', 18);
INSERT INTO `token`
VALUES (14, 'Band Protocol', 'BAND', '0xBA11D00c5f74255f56a5E366F4F77f5A186d7f55',
        'https://assets.coingecko.com/coins/images/9545/thumb/band-protocol.png?1568730326', '1', 18);
INSERT INTO `token`
VALUES (15, 'Numeraire', 'NMR', '0x1776e1F26f98b1A5dF9cD347953a26dd3Cb46671',
        'https://raw.githubusercontent.com/trustwallet/assets/master/blockchains/ethereum/assets/0x1776e1F26f98b1A5dF9cD347953a26dd3Cb46671/logo.png',
        '1', 18);
INSERT INTO `token`
VALUES (16, 'UMA Voting Token v1', 'UMA', '0x04Fa0d235C4abf4BcF4787aF4CF447DE572eF828',
        'https://raw.githubusercontent.com/trustwallet/assets/master/blockchains/ethereum/assets/0x04Fa0d235C4abf4BcF4787aF4CF447DE572eF828/logo.png',
        '1', 18);
INSERT INTO `token`
VALUES (17, 'LoopringCoin V2', 'LRC', '0xBBbbCA6A901c926F240b89EacB641d8Aec7AEafD',
        'https://raw.githubusercontent.com/trustwallet/assets/master/blockchains/ethereum/assets/0xBBbbCA6A901c926F240b89EacB641d8Aec7AEafD/logo.png',
        '1', 18);
INSERT INTO `token`
VALUES (18, 'yearn finance', 'YFI', '0x0bc529c00C6401aEF6D220BE8C6Ea1667F6Ad93e',
        'https://assets.coingecko.com/coins/images/11849/thumb/yfi-192x192.png?1598325330', '1', 18);
INSERT INTO `token`
VALUES (19, 'Republic Token', 'REN', '0x408e41876cCCDC0F92210600ef50372656052a38',
        'https://raw.githubusercontent.com/trustwallet/assets/master/blockchains/ethereum/assets/0x408e41876cCCDC0F92210600ef50372656052a38/logo.png',
        '1', 18);
INSERT INTO `token`
VALUES (20, 'Wrapped BTC', 'WBTC', '0x2260FAC5E5542a773Aa44fBCfeDf7C193bc2C599',
        'https://raw.githubusercontent.com/trustwallet/assets/master/blockchains/ethereum/assets/0x2260FAC5E5542a773Aa44fBCfeDf7C193bc2C599/logo.png',
        '1', 8);
INSERT INTO `token`
VALUES (21, 'Balancer', 'BAL', '0xba100000625a3754423978a60c9317c58a424e3D',
        'https://raw.githubusercontent.com/trustwallet/assets/master/blockchains/ethereum/assets/0xba100000625a3754423978a60c9317c58a424e3D/logo.png',
        '1', 18);
INSERT INTO `token`
VALUES (22, 'NuCypher', 'NU', '0x4fE83213D56308330EC302a8BD641f1d0113A4Cc',
        'https://assets.coingecko.com/coins/images/3318/thumb/photo1198982838879365035.jpg?1547037916', '1', 18);
INSERT INTO `token`
VALUES (23, 'Aave', 'AAVE', '0x7Fc66500c84A76Ad7e9c93437bFc5Ac33E2DDaE9',
        'https://assets.coingecko.com/coins/images/12645/thumb/AAVE.png?1601374110', '1', 18);
INSERT INTO `token`
VALUES (24, 'The Graph', 'GRT', '0xc944E90C64B2c07662A292be6244BDf05Cda44a7',
        'https://assets.coingecko.com/coins/images/13397/thumb/Graph_Token.png?1608145566', '1', 18);
INSERT INTO `token`
VALUES (25, 'Bancor Network Token', 'BNT', '0x1F573D6Fb3F13d689FF844B4cE37794d79a7FF1C',
        'https://raw.githubusercontent.com/trustwallet/assets/master/blockchains/ethereum/assets/0x1F573D6Fb3F13d689FF844B4cE37794d79a7FF1C/logo.png',
        '1', 18);
INSERT INTO `token`
VALUES (26, 'Synthetix Network Token', 'SNX', '0xC011a73ee8576Fb46F5E1c5751cA3B9Fe0af2a6F',
        'https://raw.githubusercontent.com/trustwallet/assets/master/blockchains/ethereum/assets/0xC011a73ee8576Fb46F5E1c5751cA3B9Fe0af2a6F/logo.png',
        '1', 18);
INSERT INTO `token`
VALUES (27, 'Decentraland', 'MANA', '0x0F5D2fB29fb7d3CFeE444a200298f468908cC942',
        'https://assets.coingecko.com/coins/images/878/thumb/decentraland-mana.png?1550108745', '1', 18);
INSERT INTO `token`
VALUES (28, 'Loom Network', 'LOOM', '0xA4e8C3Ec456107eA67d3075bF9e3DF3A75823DB0',
        'https://raw.githubusercontent.com/trustwallet/assets/master/blockchains/ethereum/assets/0xA4e8C3Ec456107eA67d3075bF9e3DF3A75823DB0/logo.png',
        '1', 18);
INSERT INTO `token`
VALUES (29, 'Civic', 'CVC', '0x41e5560054824eA6B0732E656E3Ad64E20e94E45',
        'https://assets.coingecko.com/coins/images/788/thumb/civic.png?1547034556', '1', 8);
INSERT INTO `token`
VALUES (30, 'district0x', 'DNT', '0x0AbdAce70D3790235af448C88547603b945604ea',
        'https://assets.coingecko.com/coins/images/849/thumb/district0x.png?1547223762', '1', 18);
INSERT INTO `token`
VALUES (31, 'Storj Token', 'STORJ', '0xB64ef51C888972c908CFacf59B47C1AfBC0Ab8aC',
        'https://raw.githubusercontent.com/trustwallet/assets/master/blockchains/ethereum/assets/0xB64ef51C888972c908CFacf59B47C1AfBC0Ab8aC/logo.png',
        '1', 8);
INSERT INTO `token`
VALUES (32, 'Amp', 'AMP', '0xfF20817765cB7f73d4bde2e66e067E58D11095C2',
        'https://assets.coingecko.com/coins/images/12409/thumb/amp-200x200.png?1599625397', '1', 18);
INSERT INTO `token`
VALUES (33, 'Gnosis Token', 'GNO', '0x6810e776880C02933D47DB1b9fc05908e5386b96',
        'https://raw.githubusercontent.com/trustwallet/assets/master/blockchains/ethereum/assets/0x6810e776880C02933D47DB1b9fc05908e5386b96/logo.png',
        '1', 18);
INSERT INTO `token`
VALUES (34, 'Aragon', 'ANT', '0xa117000000f279D81A1D3cc75430fAA017FA5A2e',
        'https://assets.coingecko.com/coins/images/681/thumb/JelZ58cv_400x400.png?1601449653', '1', 18);
INSERT INTO `token`
VALUES (35, 'Keep Network', 'KEEP', '0x85Eee30c52B0b379b046Fb0F85F4f3Dc3009aFEC',
        'https://assets.coingecko.com/coins/images/3373/thumb/IuNzUb5b_400x400.jpg?1589526336', '1', 18);
INSERT INTO `token`
VALUES (36, 'tBTC', 'tBTC', '0x18084fbA666a33d37592fA2633fD49a74DD93a88',
        'https://raw.githubusercontent.com/uniswap/assets/master/blockchains/ethereum/assets/0x18084fbA666a33d37592fA2633fD49a74DD93a88/logo.png',
        '1', 18);
INSERT INTO `token`
VALUES (37, 'Melon', 'MLN', '0xec67005c4E498Ec7f55E092bd1d35cbC47C91892',
        'https://assets.coingecko.com/coins/images/605/thumb/melon.png?1547034295', '1', 18);
INSERT INTO `token`
VALUES (38, 'Ethereum Name Service', 'ENS', '0xC18360217D8F7Ab5e7c516566761Ea12Ce7F9D72',
        'https://assets.coingecko.com/coins/images/19785/thumb/acatxTm8_400x400.jpg?1635850140', '1', 18);
INSERT INTO `token`
VALUES (39, 'Synth sUSD', 'sUSD', '0x57Ab1ec28D129707052df4dF418D58a2D46d5f51',
        'https://assets.coingecko.com/coins/images/5013/thumb/sUSD.png?1616150765', '1', 18);
INSERT INTO `token`
VALUES (40, 'Polygon', 'MATIC', '0x7D1AfA7B718fb893dB30A3aBc0Cfc608AaCfeBB0',
        'https://assets.coingecko.com/coins/images/4713/thumb/matic-token-icon.png?1624446912', '1', 18);
INSERT INTO `token`
VALUES (41, 'ApeCoin', 'APE', '0x4d224452801ACEd8B2F0aebE155379bb5D594381',
        'https://assets.coingecko.com/coins/images/24383/small/apecoin.jpg?1647476455', '1', 18);
INSERT INTO `token`
VALUES (42, '1inch', '1INCH', '0x111111111117dC0aa78b770fA6A738034120C302',
        'https://assets.coingecko.com/coins/images/13469/thumb/1inch-token.png?1608803028', '1', 18);
INSERT INTO `token`
VALUES (43, 'Aergo', 'AERGO', '0x91Af0fBB28ABA7E31403Cb457106Ce79397FD4E6',
        'https://assets.coingecko.com/coins/images/4490/thumb/aergo.png?1647696770', '1', 18);
INSERT INTO `token`
VALUES (44, 'AIOZ Network', 'AIOZ', '0x626E8036dEB333b408Be468F951bdB42433cBF18',
        'https://assets.coingecko.com/coins/images/14631/thumb/aioz_logo.png?1617413126', '1', 18);
INSERT INTO `token`
VALUES (45, 'Alchemix', 'ALCX', '0xdBdb4d16EdA451D0503b854CF79D55697F90c8DF',
        'https://assets.coingecko.com/coins/images/14113/thumb/Alchemix.png?1614409874', '1', 18);
INSERT INTO `token`
VALUES (46, 'Artverse Token', 'AVT', '0x845576c64f9754CF09d87e45B720E82F3EeF522C',
        'https://assets.coingecko.com/coins/images/19727/thumb/ewnektoB_400x400.png?1635767094', '1', 18);
INSERT INTO `token`
VALUES (47, 'Adventure Gold', 'AGLD', '0x32353A6C91143bfd6C7d363B546e62a9A2489A20',
        'https://assets.coingecko.com/coins/images/18125/thumb/lpgblc4h_400x400.jpg?1630570955', '1', 18);
INSERT INTO `token`
VALUES (48, 'BarnBridge', 'BOND', '0x0391D2021f89DC339F60Fff84546EA23E337750f',
        'https://assets.coingecko.com/coins/images/12811/thumb/barnbridge.jpg?1602728853', '1', 18);
INSERT INTO `token`
VALUES (49, 'Ampleforth Governance Token', 'FORTH', '0x77FbA179C79De5B7653F68b5039Af940AdA60ce0',
        'https://assets.coingecko.com/coins/images/14917/thumb/photo_2021-04-22_00.00.03.jpeg?1619020835', '1', 18);
INSERT INTO `token`
VALUES (50, 'Ankr', 'ANKR', '0x8290333ceF9e6D528dD5618Fb97a76f268f3EDD4',
        'https://assets.coingecko.com/coins/images/4324/thumb/U85xTl2.png?1608111978', '1', 18);
INSERT INTO `token`
VALUES (51, 'API3', 'API3', '0x0b38210ea11411557c13457D4dA7dC6ea731B88a',
        'https://assets.coingecko.com/coins/images/13256/thumb/api3.jpg?1606751424', '1', 18);
INSERT INTO `token`
VALUES (52, 'ARPA Chain', 'ARPA', '0xBA50933C268F567BDC86E1aC131BE072C6B0b71a',
        'https://assets.coingecko.com/coins/images/8506/thumb/9u0a23XY_400x400.jpg?1559027357', '1', 18);
INSERT INTO `token`
VALUES (53, 'Assemble Protocol', 'ASM', '0x2565ae0385659badCada1031DB704442E1b69982',
        'https://assets.coingecko.com/coins/images/11605/thumb/gpvrlkSq_400x400_%281%29.jpg?1591775789', '1', 18);
INSERT INTO `token`
VALUES (54, 'Clover Finance', 'CLV', '0x80C62FE4487E1351b47Ba49809EBD60ED085bf52',
        'https://assets.coingecko.com/coins/images/15278/thumb/clover.png?1645084454', '1', 18);
INSERT INTO `token`
VALUES (55, 'Cryptex Finance', 'CTX', '0x321C2fE4446C7c963dc41Dd58879AF648838f98D',
        'https://assets.coingecko.com/coins/images/14932/thumb/glossy_icon_-_C200px.png?1619073171', '1', 18);
INSERT INTO `token`
VALUES (56, 'Axie Infinity', 'AXS', '0xBB0E17EF65F82Ab018d8EDd776e8DD940327B28b',
        'https://assets.coingecko.com/coins/images/13029/thumb/axie_infinity_logo.png?1604471082', '1', 18);
INSERT INTO `token`
VALUES (57, 'Badger DAO', 'BADGER', '0x3472A5A71965499acd81997a54BBA8D852C6E53d',
        'https://assets.coingecko.com/coins/images/13287/thumb/badger_dao_logo.jpg?1607054976', '1', 18);
INSERT INTO `token`
VALUES (58, 'Cronos', 'CRO', '0xA0b73E1Ff0B80914AB6fe0444E65848C4C34450b',
        'https://assets.coingecko.com/coins/images/7310/thumb/oCw2s3GI_400x400.jpeg?1645172042', '1', 8);
INSERT INTO `token`
VALUES (59, 'Basic Attention Token', 'BAT', '0x0D8775F648430679A709E98d2b0Cb6250d2887EF',
        'https://assets.coingecko.com/coins/images/677/thumb/basic-attention-token.png?1547034427', '1', 18);
INSERT INTO `token`
VALUES (60, 'Biconomy', 'BICO', '0xF17e65822b568B3903685a7c9F496CF7656Cc6C2',
        'https://assets.coingecko.com/coins/images/21061/thumb/biconomy_logo.jpg?1638269749', '1', 18);
INSERT INTO `token`
VALUES (61, 'Gitcoin', 'GTC', '0xDe30da39c46104798bB5aA3fe8B9e0e1F348163F',
        'https://assets.coingecko.com/coins/images/15810/thumb/gitcoin.png?1621992929', '1', 18);
INSERT INTO `token`
VALUES (62, 'Immutable X', 'IMX', '0xF57e7e7C23978C3cAEC3C3548E3D615c346e79fF',
        'https://assets.coingecko.com/coins/images/17233/thumb/imx.png?1636691817', '1', 18);
INSERT INTO `token`
VALUES (63, 'Bluzelle', 'BLZ', '0x5732046A883704404F284Ce41FfADd5b007FD668',
        'https://assets.coingecko.com/coins/images/2848/thumb/ColorIcon_3x.png?1622516510', '1', 18);
INSERT INTO `token`
VALUES (64, 'Mask Network', 'MASK', '0x69af81e73A73B40adF4f3d4223Cd9b1ECE623074',
        'https://assets.coingecko.com/coins/images/14051/thumb/Mask_Network.jpg?1614050316', '1', 18);
INSERT INTO `token`
VALUES (65, 'Bounce', 'AUCTION', '0xA9B1Eb5908CfC3cdf91F9B8B3a74108598009096',
        'https://assets.coingecko.com/coins/images/13860/thumb/1_KtgpRIJzuwfHe0Rl0avP_g.jpeg?1612412025', '1', 18);
INSERT INTO `token`
VALUES (66, 'Braintrust', 'BTRST', '0x799ebfABE77a6E34311eeEe9825190B9ECe32824',
        'https://assets.coingecko.com/coins/images/18100/thumb/braintrust.PNG?1630475394', '1', 18);
INSERT INTO `token`
VALUES (67, 'PlayDapp', 'PLA', '0x3a4f40631a4f906c2BaD353Ed06De7A5D3fCb430',
        'https://assets.coingecko.com/coins/images/14316/thumb/54023228.png?1615366911', '1', 18);
INSERT INTO `token`
VALUES (68, 'Cartesi', 'CTSI', '0x491604c0FDF08347Dd1fa4Ee062a822A5DD06B5D',
        'https://assets.coingecko.com/coins/images/11038/thumb/cartesi.png?1592288021', '1', 18);
INSERT INTO `token`
VALUES (69, 'Pluton', 'PLU', '0xD8912C10681D8B21Fd3742244f44658dBA12264E',
        'https://assets.coingecko.com/coins/images/1241/thumb/pluton.png?1548331624', '1', 18);
INSERT INTO `token`
VALUES (70, 'Chiliz', 'CHZ', '0x3506424F91fD33084466F402d5D97f05F8e3b4AF',
        'https://assets.coingecko.com/coins/images/8834/thumb/Chiliz.png?1561970540', '1', 18);
INSERT INTO `token`
VALUES (71, 'PolySwarm', 'NCT', '0x9E46A38F5DaaBe8683E10793b06749EEF7D733d1',
        'https://assets.coingecko.com/coins/images/2843/thumb/ImcYCVfX_400x400.jpg?1628519767', '1', 18);
INSERT INTO `token`
VALUES (72, 'Rai Reflex Index', 'RAI', '0x03ab458634910AaD20eF5f1C8ee96F1D6ac54919',
        'https://assets.coingecko.com/coins/images/14004/thumb/RAI-logo-coin.png?1613592334', '1', 18);
INSERT INTO `token`
VALUES (73, 'COTI', 'COTI', '0xDDB3422497E61e13543BeA06989C0789117555c5',
        'https://assets.coingecko.com/coins/images/2962/thumb/Coti.png?1559653863', '1', 18);
INSERT INTO `token`
VALUES (74, 'SOL Wormhole ', 'SOL', '0xD31a59c85aE9D8edEFeC411D448f90841571b89c',
        'https://assets.coingecko.com/coins/images/22876/thumb/SOL_wh_small.png?1644224316', '1', 9);
INSERT INTO `token`
VALUES (75, 'Crypterium', 'CRPT', '0x08389495D7456E1951ddF7c3a1314A4bfb646d8B',
        'https://assets.coingecko.com/coins/images/1901/thumb/crypt.png?1547036205', '1', 18);
INSERT INTO `token`
VALUES (76, 'SuperFarm', 'SUPER', '0xe53EC727dbDEB9E2d5456c3be40cFF031AB40A55',
        'https://assets.coingecko.com/coins/images/14040/thumb/6YPdWn6.png?1613975899', '1', 18);
INSERT INTO `token`
VALUES (77, 'Synapse', 'SYN', '0x0f2D719407FdBeFF09D87557AbB7232601FD9F29',
        'https://assets.coingecko.com/coins/images/18024/thumb/syn.png?1635002049', '1', 18);
INSERT INTO `token`
VALUES (78, 'TrueFi', 'TRU', '0x4C19596f5aAfF459fA38B0f7eD92F11AE6543784',
        'https://assets.coingecko.com/coins/images/13180/thumb/truefi_glyph_color.png?1617610941', '1', 8);
INSERT INTO `token`
VALUES (79, 'DerivaDAO', 'DDX', '0x3A880652F47bFaa771908C07Dd8673A787dAEd3A',
        'https://assets.coingecko.com/coins/images/13453/thumb/ddx_logo.png?1608741641', '1', 18);
INSERT INTO `token`
VALUES (80, 'DFI money', 'YFII', '0xa1d0E215a23d7030842FC67cE582a6aFa3CCaB83',
        'https://assets.coingecko.com/coins/images/11902/thumb/YFII-logo.78631676.png?1598677348', '1', 18);
INSERT INTO `token`
VALUES (81, 'DIA', 'DIA', '0x84cA8bc7997272c7CfB4D0Cd3D55cd942B3c9419',
        'https://assets.coingecko.com/coins/images/11955/thumb/image.png?1646041751', '1', 18);
INSERT INTO `token`
VALUES (82, 'Rubic', 'RBC', '0xA4EED63db85311E22dF4473f87CcfC3DaDCFA3E3',
        'https://assets.coingecko.com/coins/images/12629/thumb/200x200.png?1607952509', '1', 18);
INSERT INTO `token`
VALUES (83, 'Enjin Coin', 'ENJ', '0xF629cBd94d3791C9250152BD8dfBDF380E2a3B9c',
        'https://assets.coingecko.com/coins/images/1102/thumb/enjin-coin-logo.png?1547035078', '1', 18);
INSERT INTO `token`
VALUES (84, 'SuperRare', 'RARE', '0xba5BDe662c17e2aDFF1075610382B9B691296350',
        'https://assets.coingecko.com/coins/images/17753/thumb/RARE.jpg?1629220534', '1', 18);
INSERT INTO `token`
VALUES (85, 'Tokemak', 'TOKE', '0x2e9d63788249371f1DFC918a52f8d799F4a38C94',
        'https://assets.coingecko.com/coins/images/17495/thumb/tokemak-avatar-200px-black.png?1628131614', '1', 18);
INSERT INTO `token`
VALUES (86, 'Ethernity Chain', 'ERN', '0xBBc2AE13b23d715c30720F079fcd9B4a74093505',
        'https://assets.coingecko.com/coins/images/14238/thumb/LOGO_HIGH_QUALITY.png?1647831402', '1', 18);
INSERT INTO `token`
VALUES (87, 'Fetch ai', 'FET', '0xaea46A60368A7bD060eec7DF8CBa43b7EF41Ad85',
        'https://assets.coingecko.com/coins/images/5681/thumb/Fetch.jpg?1572098136', '1', 18);
INSERT INTO `token`
VALUES (88, 'Function X', 'FX', '0x8c15Ef5b4B21951d50E53E4fbdA8298FFAD25057',
        'https://assets.coingecko.com/coins/images/8186/thumb/47271330_590071468072434_707260356350705664_n.jpg?1556096683',
        '1', 18);
INSERT INTO `token`
VALUES (89, 'Gods Unchained', 'GODS', '0xccC8cb5229B0ac8069C51fd58367Fd1e622aFD97',
        'https://assets.coingecko.com/coins/images/17139/thumb/10631.png?1635718182', '1', 18);
INSERT INTO `token`
VALUES (90, 'Goldfinch', 'GFI', '0xdab396cCF3d84Cf2D07C4454e10C8A6F5b008D2b',
        'https://assets.coingecko.com/coins/images/19081/thumb/GOLDFINCH.png?1634369662', '1', 18);
INSERT INTO `token`
VALUES (91, 'Golem', 'GLM', '0x7DD9c5Cba05E151C895FDe1CF355C9A1D5DA6429',
        'https://assets.coingecko.com/coins/images/542/thumb/Golem_Submark_Positive_RGB.png?1606392013', '1', 18);
INSERT INTO `token`
VALUES (92, 'GYEN', 'GYEN', '0xC08512927D12348F6620a698105e1BAac6EcD911',
        'https://assets.coingecko.com/coins/images/14191/thumb/icon_gyen_200_200.png?1614843343', '1', 6);
INSERT INTO `token`
VALUES (93, 'Harvest Finance', 'FARM', '0xa0246c9032bC3A600820415aE600c6388619A14D',
        'https://assets.coingecko.com/coins/images/12304/thumb/Harvest.png?1613016180', '1', 18);
INSERT INTO `token`
VALUES (94, 'Highstreet', 'HIGH', '0x71Ab77b7dbB4fa7e017BC15090b2163221420282',
        'https://assets.coingecko.com/coins/images/18973/thumb/logosq200200Coingecko.png?1634090470', '1', 18);
INSERT INTO `token`
VALUES (95, 'IDEX', 'IDEX', '0xB705268213D593B8FD88d3FDEFF93AFF5CbDcfAE',
        'https://assets.coingecko.com/coins/images/2565/thumb/logomark-purple-286x286.png?1638362736', '1', 18);
INSERT INTO `token`
VALUES (96, 'iExec RLC', 'RLC', '0x607F4C5BB672230e8672085532f7e901544a7375',
        'https://assets.coingecko.com/coins/images/646/thumb/pL1VuXm.png?1604543202', '1', 9);
INSERT INTO `token`
VALUES (97, 'Inverse Finance', 'INV', '0x41D5D79431A913C4aE7d69a668ecdfE5fF9DFB68',
        'https://assets.coingecko.com/coins/images/14205/thumb/inverse_finance.jpg?1614921871', '1', 18);
INSERT INTO `token`
VALUES (98, 'JasmyCoin', 'JASMY', '0x7420B4b9a0110cdC71fB720908340C03F9Bc03EC',
        'https://assets.coingecko.com/coins/images/13876/thumb/JASMY200x200.jpg?1612473259', '1', 18);
INSERT INTO `token`
VALUES (99, 'KRYLL', 'KRL', '0x464eBE77c293E473B48cFe96dDCf88fcF7bFDAC0',
        'https://assets.coingecko.com/coins/images/2807/thumb/krl.png?1547036979', '1', 18);
INSERT INTO `token`
VALUES (100, 'LCX', 'LCX', '0x037A54AaB062628C9Bbae1FDB1583c195585fe41',
        'https://assets.coingecko.com/coins/images/9985/thumb/zRPSu_0o_400x400.jpg?1574327008', '1', 18);
INSERT INTO `token`
VALUES (101, 'Liquity', 'LQTY', '0x6DEA81C8171D0bA574754EF6F8b412F2Ed88c54D',
        'https://assets.coingecko.com/coins/images/14665/thumb/200-lqty-icon.png?1617631180', '1', 18);
INSERT INTO `token`
VALUES (102, 'Livepeer', 'LPT', '0x58b6A8A3302369DAEc383334672404Ee733aB239',
        'https://assets.coingecko.com/coins/images/7137/thumb/logo-circle-green.png?1619593365', '1', 18);
INSERT INTO `token`
VALUES (103, 'Maple', 'MPL', '0x33349B282065b0284d756F0577FB39c158F935e6',
        'https://assets.coingecko.com/coins/images/14097/thumb/photo_2021-05-03_14.20.41.jpeg?1620022863', '1', 18);
INSERT INTO `token`
VALUES (104, 'Measurable Data Token', 'MDT', '0x814e0908b12A99FeCf5BC101bB5d0b8B5cDf7d26',
        'https://assets.coingecko.com/coins/images/2441/thumb/mdt_logo.png?1569813574', '1', 18);
INSERT INTO `token`
VALUES (105, 'Mirror Protocol', 'MIR', '0x09a3EcAFa817268f77BE1283176B946C4ff2E608',
        'https://assets.coingecko.com/coins/images/13295/thumb/mirror_logo_transparent.png?1611554658', '1', 18);
INSERT INTO `token`
VALUES (106, 'Moss Carbon Credit', 'MCO2', '0xfC98e825A2264D890F9a1e68ed50E1526abCcacD',
        'https://assets.coingecko.com/coins/images/14414/thumb/ENtxnThA_400x400.jpg?1615948522', '1', 18);
INSERT INTO `token`
VALUES (107, 'mStable USD', 'MUSD', '0xe2f2a5C287993345a840Db3B0845fbC70f5935a5',
        'https://assets.coingecko.com/coins/images/11576/thumb/mStable_USD.png?1595591803', '1', 18);
INSERT INTO `token`
VALUES (108, 'OMG Network', 'OMG', '0xd26114cd6EE289AccF82350c8d8487fedB8A0C07',
        'https://assets.coingecko.com/coins/images/776/thumb/OMG_Network.jpg?1591167168', '1', 18);
INSERT INTO `token`
VALUES (109, 'Origin Protocol', 'OGN', '0x8207c1FfC5B6804F6024322CcF34F29c3541Ae26',
        'https://assets.coingecko.com/coins/images/3296/thumb/op.jpg?1547037878', '1', 18);
INSERT INTO `token`
VALUES (110, 'OriginTrail', 'TRAC', '0xaA7a9CA87d3694B5755f213B5D04094b8d0F0A6F',
        'https://assets.coingecko.com/coins/images/1877/thumb/TRAC.jpg?1635134367', '1', 18);
INSERT INTO `token`
VALUES (111, 'Orion Protocol', 'ORN', '0x0258F474786DdFd37ABCE6df6BBb1Dd5dfC4434a',
        'https://assets.coingecko.com/coins/images/11841/thumb/orion_logo.png?1594943318', '1', 8);
INSERT INTO `token`
VALUES (112, 'Pawtocol', 'UPI', '0x70D2b7C19352bB76e4409858FF5746e500f2B67c',
        'https://assets.coingecko.com/coins/images/12186/thumb/pawtocol.jpg?1597962008', '1', 18);
INSERT INTO `token`
VALUES (113, 'Perpetual Protocol', 'PERP', '0xbC396689893D065F41bc2C6EcbeE5e0085233447',
        'https://assets.coingecko.com/coins/images/12381/thumb/60d18e06844a844ad75901a9_mark_only_03.png?1628674771',
        '1', 18);
INSERT INTO `token`
VALUES (114, 'IoTeX', 'IOTX', '0x6fB3e0A217407EFFf7Ca062D46c26E5d60a14d69',
        'https://s2.coinmarketcap.com/static/img/coins/64x64/2777.png', '1', 18);
INSERT INTO `token`
VALUES (115, 'Polkastarter', 'POLS', '0x83e6f1E41cdd28eAcEB20Cb649155049Fac3D5Aa',
        'https://assets.coingecko.com/coins/images/12648/thumb/polkastarter.png?1609813702', '1', 18);
INSERT INTO `token`
VALUES (116, 'Polymath', 'POLY', '0x9992eC3cF6A55b00978cdDF2b27BC6882d88D1eC',
        'https://assets.coingecko.com/coins/images/2784/thumb/inKkF01.png?1605007034', '1', 18);
INSERT INTO `token`
VALUES (117, 'Propy', 'PRO', '0x226bb599a12C826476e3A771454697EA52E9E220',
        'https://assets.coingecko.com/coins/images/869/thumb/propy.png?1548332100', '1', 8);
INSERT INTO `token`
VALUES (118, 'Quant', 'QNT', '0x4a220E6096B25EADb88358cb44068A3248254675',
        'https://assets.coingecko.com/coins/images/3370/thumb/5ZOu7brX_400x400.jpg?1612437252', '1', 18);
INSERT INTO `token`
VALUES (119, 'Quantstamp', 'QSP', '0x99ea4dB9EE77ACD40B119BD1dC4E33e1C070b80d',
        'https://assets.coingecko.com/coins/images/1219/thumb/0_E0kZjb4dG4hUnoDD_.png?1604815917', '1', 18);
INSERT INTO `token`
VALUES (120, 'Quickswap', 'QUICK', '0x6c28AeF8977c9B773996d0e8376d2EE379446F2f',
        'https://assets.coingecko.com/coins/images/13970/thumb/1_pOU6pBMEmiL-ZJVb0CYRjQ.png?1613386659', '1', 18);
INSERT INTO `token`
VALUES (121, 'Radicle', 'RAD', '0x31c8EAcBFFdD875c74b94b077895Bd78CF1E64A3',
        'https://assets.coingecko.com/coins/images/14013/thumb/radicle.png?1614402918', '1', 18);
INSERT INTO `token`
VALUES (122, 'NKN', 'NKN', '0x5Cf04716BA20127F1E2297AdDCf4B5035000c9eb',
        'https://assets.coingecko.com/coins/images/3375/thumb/nkn.png?1548329212', '1', 18);
INSERT INTO `token`
VALUES (123, 'Rally', 'RLY', '0xf1f955016EcbCd7321c7266BccFB96c68ea5E49b',
        'https://assets.coingecko.com/coins/images/12843/thumb/image.png?1611212077', '1', 18);
INSERT INTO `token`
VALUES (124, 'Rari Governance Token', 'RGT', '0xD291E7a03283640FDc51b121aC401383A46cC623',
        'https://assets.coingecko.com/coins/images/12900/thumb/Rari_Logo_Transparent.png?1613978014', '1', 18);
INSERT INTO `token`
VALUES (125, 'Rarible', 'RARI', '0xFca59Cd816aB1eaD66534D82bc21E7515cE441CF',
        'https://assets.coingecko.com/coins/images/11845/thumb/Rari.png?1594946953', '1', 18);
INSERT INTO `token`
VALUES (126, 'Render Token', 'RNDR', '0x6De037ef9aD2725EB40118Bb1702EBb27e4Aeb24',
        'https://assets.coingecko.com/coins/images/11636/thumb/rndr.png?1638840934', '1', 18);
INSERT INTO `token`
VALUES (127, 'Request', 'REQ', '0x8f8221aFbB33998d8584A2B05749bA73c37a938a',
        'https://assets.coingecko.com/coins/images/1031/thumb/Request_icon_green.png?1643250951', '1', 18);
INSERT INTO `token`
VALUES (128, 'Ribbon Finance', 'RBN', '0x6123B0049F904d730dB3C36a31167D9d4121fA6B',
        'https://assets.coingecko.com/coins/images/15823/thumb/RBN_64x64.png?1633529723', '1', 18);
INSERT INTO `token`
VALUES (129, 'ShapeShift FOX Token', 'FOX', '0xc770EEfAd204B5180dF6a14Ee197D99d808ee52d',
        'https://assets.coingecko.com/coins/images/9988/thumb/FOX.png?1574330622', '1', 18);
INSERT INTO `token`
VALUES (130, 'Shiba Inu', 'SHIB', '0x95aD61b0a150d79219dCF64E1E6Cc01f0B64C4cE',
        'https://assets.coingecko.com/coins/images/11939/thumb/shiba.png?1622619446', '1', 18);
INSERT INTO `token`
VALUES (131, 'Shping', 'SHPING', '0x7C84e62859D0715eb77d1b1C4154Ecd6aBB21BEC',
        'https://assets.coingecko.com/coins/images/2588/thumb/r_yabKKi_400x400.jpg?1639470164', '1', 18);
INSERT INTO `token`
VALUES (132, 'SKALE', 'SKL', '0x00c83aeCC790e8a4453e5dD3B0B4b3680501a7A7',
        'https://assets.coingecko.com/coins/images/13245/thumb/SKALE_token_300x300.png?1606789574', '1', 18);
INSERT INTO `token`
VALUES (133, 'ORCA Alliance', 'ORCA', '0x6F59e0461Ae5E2799F1fB3847f05a63B16d0DbF8',
        'https://s2.coinmarketcap.com/static/img/coins/64x64/5183.png', '1', 18);
INSERT INTO `token`
VALUES (134, 'Spell Token', 'SPELL', '0x090185f2135308BaD17527004364eBcC2D37e5F6',
        'https://assets.coingecko.com/coins/images/15861/thumb/abracadabra-3.png?1622544862', '1', 18);
INSERT INTO `token`
VALUES (135, 'Stox', 'STX', '0x006BeA43Baa3f7A6f765F14f10A1a1b08334EF45',
        'https://assets.coingecko.com/coins/images/1230/thumb/stox-token.png?1547035256', '1', 18);
INSERT INTO `token`
VALUES (136, 'Status', 'SNT', '0x744d70FDBE2Ba4CF95131626614a1763DF805B9E',
        'https://assets.coingecko.com/coins/images/779/thumb/status.png?1548610778', '1', 18);
INSERT INTO `token`
VALUES (137, 'PayperEx', 'PAX', '0xc1D204d77861dEf49b6E769347a883B15EC397Ff',
        'https://assets.coingecko.com/coins/images/1601/thumb/pax.png?1547035800', '1', 18);
INSERT INTO `token`
VALUES (138, 'SUKU', 'SUKU', '0x0763fdCCF1aE541A5961815C0872A8c5Bc6DE4d7',
        'https://assets.coingecko.com/coins/images/11969/thumb/UmfW5S6f_400x400.jpg?1596602238', '1', 18);
INSERT INTO `token`
VALUES (139, 'Sushi', 'SUSHI', '0x6B3595068778DD592e39A122f4f5a5cF09C90fE2',
        'https://assets.coingecko.com/coins/images/12271/thumb/512x512_Logo_no_chop.png?1606986688', '1', 18);
INSERT INTO `token`
VALUES (140, 'Tellor', 'TRB', '0x88dF592F8eb5D7Bd38bFeF7dEb0fBc02cf3778a0',
        'https://assets.coingecko.com/coins/images/9644/thumb/Blk_icon_current.png?1584980686', '1', 18);
INSERT INTO `token`
VALUES (141, 'Tribe', 'TRIBE', '0xc7283b66Eb1EB5FB86327f08e1B5816b0720212B',
        'https://assets.coingecko.com/coins/images/14575/thumb/tribe.PNG?1617487954', '1', 18);
INSERT INTO `token`
VALUES (142, 'Unifi Protocol DAO', 'UNFI', '0x441761326490cACF7aF299725B6292597EE822c2',
        'https://assets.coingecko.com/coins/images/13152/thumb/logo-2.png?1605748967', '1', 18);
INSERT INTO `token`
VALUES (143, 'Voyager Token', 'VGX', '0x3C4B6E6e1eA3D4863700D7F76b36B7f3D3f13E3d',
        'https://assets.coingecko.com/coins/images/794/thumb/Voyager-vgx.png?1575693595', '1', 8);
INSERT INTO `token`
VALUES (144, 'XYO Network', 'XYO', '0x55296f69f40Ea6d20E478533C15A6B08B654E758',
        'https://assets.coingecko.com/coins/images/4519/thumb/XYO_Network-logo.png?1547039819', '1', 18);
INSERT INTO `token`
VALUES (145, 'Smooth Love Potion', 'SLP', '0xCC8Fa225D80b9c7D42F96e9570156c65D6cAAa25',
        'https://assets.coingecko.com/coins/images/10366/thumb/SLP.png?1578640057', '1', 0);
INSERT INTO `token`
VALUES (146, 'Convex Finance', 'CVX', '0x4e3FBD56CD56c3e72c1403e103b45Db9da5B9D2B',
        'https://assets.coingecko.com/coins/images/15585/thumb/convex.png?1621256328', '1', 18);
INSERT INTO `token`
VALUES (147, 'dYdX', 'DYDX', '0x92D6C1e31e14520e676a687F0a93788B716BEff5',
        'https://assets.coingecko.com/coins/images/17500/thumb/hjnIm9bV.jpg?1628009360', '1', 18);
INSERT INTO `token`
VALUES (148, 'Frax Share', 'FXS', '0x3432B6A60D23Ca0dFCa7761B7ab56459D9C964D0',
        'https://assets.coingecko.com/coins/images/13423/thumb/frax_share.png?1608478989', '1', 18);
INSERT INTO `token`
VALUES (149, 'Keep3rV1', 'KP3R', '0x1cEB5cB57C4D4E2b2433641b95Dd330A33185A44',
        'https://assets.coingecko.com/coins/images/12966/thumb/kp3r_logo.jpg?1607057458', '1', 18);
INSERT INTO `token`
VALUES (150, 'Multichain', 'MULTI', '0x65Ef703f5594D2573eb71Aaf55BC0CB548492df4',
        'https://assets.coingecko.com/coins/images/22087/thumb/1_Wyot-SDGZuxbjdkaOeT2-A.png?1640764238', '1', 18);
INSERT INTO `token`
VALUES (151, 'Ocean Protocol', 'OCEAN', '0x967da4048cD07aB37855c090aAF366e4ce1b9F48',
        'https://assets.coingecko.com/coins/images/3687/thumb/ocean-protocol-logo.jpg?1547038686', '1', 18);
INSERT INTO `token`
VALUES (152, 'PAX Gold', 'PAXG', '0x45804880De22913dAFE09f4980848ECE6EcbAf78',
        'https://assets.coingecko.com/coins/images/9519/thumb/paxg.PNG?1568542565', '1', 18);
INSERT INTO `token`
VALUES (153, 'Alchemy Pay', 'ACH', '0xEd04915c23f00A313a544955524EB7DBD823143d',
        'https://assets.coingecko.com/coins/images/12390/thumb/ACH_%281%29.png?1599691266', '1', 8);
INSERT INTO `token`
VALUES (154, 'Circuits of Value', 'COVAL', '0x3D658390460295FB963f54dC0899cfb1c30776Df',
        'https://assets.coingecko.com/coins/images/588/thumb/coval-logo.png?1599493950', '1', 8);
INSERT INTO `token`
VALUES (155, 'The Sandbox', 'SAND', '0x3845badAde8e6dFF049820680d1F14bD3903a5d0',
        'https://assets.coingecko.com/coins/images/12129/thumb/sandbox_logo.jpg?1597397942', '1', 18);
INSERT INTO `token`
VALUES (156, 'Gemini Dollar', 'GUSD', '0x056Fd409E1d7A124BD7017459dFEa2F387b6d5Cd',
        'https://assets.coingecko.com/coins/images/5992/thumb/gemini-dollar-gusd.png?1536745278', '1', 2);
INSERT INTO `token`
VALUES (157, 'Audius', 'AUDIO', '0x18aAA7115705e8be94bfFEBDE57Af9BFc265B998',
        'https://assets.coingecko.com/coins/images/12913/thumb/AudiusCoinLogo_2x.png?1603425727', '1', 18);
INSERT INTO `token`
VALUES (158, 'ASH', 'ASH', '0x64D91f12Ece7362F91A6f8E7940Cd55F05060b92',
        'https://assets.coingecko.com/coins/images/15714/thumb/omnPqaTY.png?1622820503', '1', 18);
INSERT INTO `token`
VALUES (159, 'Dogelon Mars', 'ELON', '0x761D38e5ddf6ccf6Cf7c55759d5210750B5D60F3',
        'https://assets.coingecko.com/coins/images/14962/thumb/6GxcPRo3_400x400.jpg?1619157413', '1', 18);
INSERT INTO `token`
VALUES (160, 'Fantom', 'FTM', '0x4E15361FD6b4BB609Fa63C81A2be19d873717870',
        'https://assets.coingecko.com/coins/images/4001/thumb/Fantom.png?1558015016', '1', 18);
INSERT INTO `token`
VALUES (161, 'Injective', 'INJ', '0xe28b3B32B6c345A34Ff64674606124Dd5Aceca30',
        'https://assets.coingecko.com/coins/images/12882/thumb/Secondary_Symbol.png?1628233237', '1', 18);
INSERT INTO `token`
VALUES (162, 'Lido DAO', 'LDO', '0x5A98FcBEA516Cf06857215779Fd812CA3beF1B32',
        'https://assets.coingecko.com/coins/images/13573/thumb/Lido_DAO.png?1609873644', '1', 18);
INSERT INTO `token`
VALUES (163, 'Magic Internet Money', 'MIM', '0x99D8a9C45b2ecA8864373A26D1459e3Dff1e17F3',
        'https://assets.coingecko.com/coins/images/16786/thumb/mimlogopng.png?1624979612', '1', 18);
INSERT INTO `token`
VALUES (164, 'Merit Circle', 'MC', '0x949D48EcA67b17269629c7194F4b727d4Ef9E5d6',
        'https://assets.coingecko.com/coins/images/19304/thumb/Db4XqML.png?1634972154', '1', 18);
INSERT INTO `token`
VALUES (165, 'Gala', 'GALA', '0x15D4c048F83bd7e37d49eA4C83a07267Ec4203dA',
        'https://assets.coingecko.com/coins/images/12493/thumb/GALA-COINGECKO.png?1600233435', '1', 8);
INSERT INTO `token`
VALUES (166, 'Somnium Space CUBEs', 'CUBE', '0xDf801468a808a32656D2eD2D2d80B72A129739f4',
        'https://assets.coingecko.com/coins/images/10687/thumb/CUBE_icon.png?1617026861', '1', 8);
INSERT INTO `token`
VALUES (167, 'My Neighbor Alice', 'ALICE', '0xAC51066d7bEC65Dc4589368da368b212745d63E8',
        'https://assets.coingecko.com/coins/images/14375/thumb/alice_logo.jpg?1615782968', '1', 6);
INSERT INTO `token`
VALUES (168, 'Power Ledger', 'POWR', '0x595832F8FC6BF59c85C527fEC3740A1b7a361269',
        'https://assets.coingecko.com/coins/images/1104/thumb/power-ledger.png?1547035082', '1', 6);
INSERT INTO `token`
VALUES (169, 'Euro Coin', 'EUROC', '0x1aBaEA1f7C830bD89Acc67eC4af516284b1bC33c',
        'https://assets.coingecko.com/coins/images/26045/thumb/euro-coin.png?1655394420', '1', 6);
INSERT INTO `token`
VALUES (170, 'Arcblock', 'ABT', '0xB98d4C97425d9908E66E53A6fDf673ACcA0BE986',
        'https://assets.coingecko.com/coins/images/2341/thumb/arcblock.png?1547036543', '1', 18);
INSERT INTO `token`
VALUES (171, 'Ambire AdEx', 'ADX', '0xADE00C28244d5CE17D72E40330B1c318cD12B7c3',
        'https://assets.coingecko.com/coins/images/847/thumb/Ambire_AdEx_Symbol_color.png?1655432540', '1', 18);
INSERT INTO `token`
VALUES (172, 'Aleph im', 'ALEPH', '0x27702a26126e0B3702af63Ee09aC4d1A084EF628',
        'https://assets.coingecko.com/coins/images/11676/thumb/Monochram-aleph.png?1608483725', '1', 18);
INSERT INTO `token`
VALUES (173, 'Alethea Artificial Liquid Intelligence', 'ALI', '0x6B0b3a982b4634aC68dD83a4DBF02311cE324181',
        'https://assets.coingecko.com/coins/images/22062/thumb/alethea-logo-transparent-colored.png?1642748848', '1',
        18);
INSERT INTO `token`
VALUES (174, 'Alpha Venture DAO', 'ALPHA', '0xa1faa113cbE53436Df28FF0aEe54275c13B40975',
        'https://assets.coingecko.com/coins/images/12738/thumb/AlphaToken_256x256.png?1617160876', '1', 18);
INSERT INTO `token`
VALUES (175, 'AirSwap', 'AST', '0x27054b13b1B798B345b591a4d22e6562d47eA75a',
        'https://assets.coingecko.com/coins/images/1019/thumb/Airswap.png?1630903484', '1', 4);
INSERT INTO `token`
VALUES (176, 'Automata', 'ATA', '0xA2120b9e674d3fC3875f415A7DF52e382F141225',
        'https://assets.coingecko.com/coins/images/15985/thumb/ATA.jpg?1622535745', '1', 18);
INSERT INTO `token`
VALUES (177, 'BitDAO', 'BIT', '0x1A4b46696b2bB4794Eb3D4c26f1c55F9170fa4C5',
        'https://assets.coingecko.com/coins/images/17627/thumb/rI_YptK8.png?1653983088', '1', 18);
INSERT INTO `token`
VALUES (178, 'Boba Network', 'BOBA', '0x42bBFa2e77757C645eeaAd1655E0911a7553Efbc',
        'https://assets.coingecko.com/coins/images/20285/thumb/BOBA.png?1636811576', '1', 18);
INSERT INTO `token`
VALUES (179, 'Binance USD', 'BUSD', '0x4Fabb145d64652a948d72533023f6E7A623C7C53',
        'https://assets.coingecko.com/coins/images/9576/thumb/BUSD.png?1568947766', '1', 18);
INSERT INTO `token`
VALUES (180, 'Coin98', 'C98', '0xAE12C5930881c53715B369ceC7606B70d8EB229f',
        'https://assets.coingecko.com/coins/images/17117/thumb/logo.png?1626412904', '1', 18);
INSERT INTO `token`
VALUES (181, 'Celer Network', 'CELR', '0x4F9254C83EB525f9FCf346490bbb3ed28a81C667',
        'https://assets.coingecko.com/coins/images/4379/thumb/Celr.png?1554705437', '1', 18);
INSERT INTO `token`
VALUES (182, 'Chromia', 'CHR', '0x8A2279d4A90B6fe1C4B30fa660cC9f926797bAA2',
        'https://assets.coingecko.com/coins/images/5000/thumb/Chromia.png?1559038018', '1', 6);
INSERT INTO `token`
VALUES (183, 'Covalent', 'CQT', '0xD417144312DbF50465b1C641d016962017Ef6240',
        'https://assets.coingecko.com/coins/images/14168/thumb/covalent-cqt.png?1624545218', '1', 18);
INSERT INTO `token`
VALUES (184, 'Mines of Dalarnia', 'DAR', '0x081131434f93063751813C619Ecca9C4dC7862a3',
        'https://assets.coingecko.com/coins/images/19837/thumb/dar.png?1636014223', '1', 6);
INSERT INTO `token`
VALUES (185, 'Dent', 'DENT', '0x3597bfD533a99c9aa083587B074434E61Eb0A258',
        'https://assets.coingecko.com/coins/images/1152/thumb/gLCEA2G.png?1604543239', '1', 8);
INSERT INTO `token`
VALUES (186, 'DexTools', 'DEXT', '0xfB7B4564402E5500dB5bB6d63Ae671302777C75a',
        'https://assets.coingecko.com/coins/images/11603/thumb/dext.png?1605790188', '1', 18);
INSERT INTO `token`
VALUES (187, 'DeFi Pulse Index', 'DPI', '0x1494CA1F11D487c2bBe4543E90080AeBa4BA3C2b',
        'https://assets.coingecko.com/coins/images/12465/thumb/defi_pulse_index_set.png?1600051053', '1', 18);
INSERT INTO `token`
VALUES (188, 'Drep', 'DREP', '0x3Ab6Ed69Ef663bd986Ee59205CCaD8A20F98b4c2',
        'https://assets.coingecko.com/coins/images/14578/thumb/KotgsCgS_400x400.jpg?1617094445', '1', 18);
INSERT INTO `token`
VALUES (189, 'DeFi Yield Protocol', 'DYP', '0x961C8c0B1aaD0c0b10a51FeF6a867E3091BCef17',
        'https://assets.coingecko.com/coins/images/13480/thumb/DYP_Logo_Symbol-8.png?1655809066', '1', 18);
INSERT INTO `token`
VALUES (190, 'Elastos', 'ELA', '0xe6fd75ff38Adca4B97FBCD938c86b98772431867',
        'https://assets.coingecko.com/coins/images/2780/thumb/Elastos.png?1597048112', '1', 18);
INSERT INTO `token`
VALUES (191, 'Euler', 'EUL', '0xd9Fcd98c322942075A5C3860693e9f4f03AAE07b',
        'https://assets.coingecko.com/coins/images/26149/thumb/YCvKDfl8_400x400.jpeg?1656041509', '1', 18);
INSERT INTO `token`
VALUES (192, 'Stafi', 'FIS', '0xef3A930e1FfFFAcd2fc13434aC81bD278B0ecC8d',
        'https://assets.coingecko.com/coins/images/12423/thumb/stafi_logo.jpg?1599730991', '1', 18);
INSERT INTO `token`
VALUES (193, 'Forta', 'FORT', '0x41545f8b9472D758bB669ed8EaEEEcD7a9C4Ec29',
        'https://assets.coingecko.com/coins/images/25060/thumb/Forta_lgo_%281%29.png?1655353696', '1', 18);
INSERT INTO `token`
VALUES (194, 'Frax', 'FRAX', '0x853d955aCEf822Db058eb8505911ED77F175b99e',
        'https://assets.coingecko.com/coins/images/13422/thumb/frax_logo.png?1608476506', '1', 18);
INSERT INTO `token`
VALUES (195, 'Project Galaxy', 'GAL', '0x5fAa989Af96Af85384b8a938c2EdE4A7378D9875',
        'https://assets.coingecko.com/coins/images/24530/thumb/GAL-Token-Icon.png?1651483533', '1', 18);
INSERT INTO `token`
VALUES (196, 'Aavegotchi', 'GHST', '0x3F382DbD960E3a9bbCeaE22651E88158d2791550',
        'https://assets.coingecko.com/coins/images/12467/thumb/ghst_200.png?1600750321', '1', 18);
INSERT INTO `token`
VALUES (197, 'HOPR', 'HOPR', '0xF5581dFeFD8Fb0e4aeC526bE659CFaB1f8c781dA',
        'https://assets.coingecko.com/coins/images/14061/thumb/Shared_HOPR_logo_512px.png?1614073468', '1', 18);
INSERT INTO `token`
VALUES (198, 'Index Cooperative', 'INDEX', '0x0954906da0Bf32d5479e25f46056d22f08464cab',
        'https://assets.coingecko.com/coins/images/12729/thumb/index.png?1634894321', '1', 18);
INSERT INTO `token`
VALUES (199, 'Geojam', 'JAM', '0x23894DC9da6c94ECb439911cAF7d337746575A72',
        'https://assets.coingecko.com/coins/images/24648/thumb/ey40AzBN_400x400.jpg?1648507272', '1', 18);
INSERT INTO `token`
VALUES (200, 'Jupiter', 'JUP', '0x4B1E80cAC91e2216EEb63e29B957eB91Ae9C2Be8',
        'https://assets.coingecko.com/coins/images/10351/thumb/logo512.png?1632480932', '1', 18);
INSERT INTO `token`
VALUES (201, 'SelfKey', 'KEY', '0x4CC19356f2D37338b9802aa8E8fc58B0373296E7',
        'https://assets.coingecko.com/coins/images/2034/thumb/selfkey.png?1548608934', '1', 18);
INSERT INTO `token`
VALUES (202, 'League of Kingdoms', 'LOKA', '0x61E90A50137E1F645c9eF4a0d3A4f01477738406',
        'https://assets.coingecko.com/coins/images/22572/thumb/loka_64pix.png?1642643271', '1', 18);
INSERT INTO `token`
VALUES (203, 'Liquity USD', 'LUSD', '0x5f98805A4E8be255a32880FDeC7F6728C6568bA0',
        'https://assets.coingecko.com/coins/images/14666/thumb/Group_3.png?1617631327', '1', 18);
INSERT INTO `token`
VALUES (204, 'MATH', 'MATH', '0x08d967bb0134F2d07f7cfb6E246680c53927DD30',
        'https://assets.coingecko.com/coins/images/11335/thumb/2020-05-19-token-200.png?1589940590', '1', 18);
INSERT INTO `token`
VALUES (205, 'Metis', 'METIS', '0x9E32b13ce7f2E80A01932B42553652E053D6ed8e',
        'https://assets.coingecko.com/coins/images/15595/thumb/metis.jpeg?1660285312', '1', 18);
INSERT INTO `token`
VALUES (206, 'Monavale', 'MONA', '0x275f5Ad03be0Fa221B4C6649B8AeE09a42D9412A',
        'https://assets.coingecko.com/coins/images/13298/thumb/monavale_logo.jpg?1607232721', '1', 18);
INSERT INTO `token`
VALUES (207, 'Metal', 'MTL', '0xF433089366899D83a9f26A773D59ec7eCF30355e',
        'https://assets.coingecko.com/coins/images/763/thumb/Metal.png?1592195010', '1', 8);
INSERT INTO `token`
VALUES (208, 'Muse DAO', 'MUSE', '0xB6Ca7399B4F9CA56FC27cBfF44F4d2e4Eef1fc81',
        'https://assets.coingecko.com/coins/images/13230/thumb/muse_logo.png?1606460453', '1', 18);
INSERT INTO `token`
VALUES (209, 'GensoKishi Metaverse', 'MV', '0xAE788F80F2756A86aa2F410C651F2aF83639B95b',
        'https://s2.coinmarketcap.com/static/img/coins/64x64/17704.png', '1', 18);
INSERT INTO `token`
VALUES (210, 'MXC', 'MXC', '0x5Ca381bBfb58f0092df149bD3D243b08B9a8386e',
        'https://assets.coingecko.com/coins/images/4604/thumb/mxc.png?1655534336', '1', 18);
INSERT INTO `token`
VALUES (211, 'Nest Protocol', 'NEST', '0x04abEdA201850aC0124161F037Efd70c74ddC74C',
        'https://assets.coingecko.com/coins/images/11284/thumb/52954052.png?1589868539', '1', 18);
INSERT INTO `token`
VALUES (212, 'Marlin', 'POND', '0x57B946008913B82E4dF85f501cbAeD910e58D26C',
        'https://assets.coingecko.com/coins/images/8903/thumb/POND_200x200.png?1622515451', '1', 18);
INSERT INTO `token`
VALUES (213, 'PARSIQ', 'PRQ', '0x362bc847A3a9637d3af6624EeC853618a43ed7D2',
        'https://assets.coingecko.com/coins/images/11973/thumb/DsNgK0O.png?1596590280', '1', 18);
INSERT INTO `token`
VALUES (214, 'pSTAKE Finance', 'PSTAKE', '0xfB5c6815cA3AC72Ce9F5006869AE67f18bF77006',
        'https://assets.coingecko.com/coins/images/23931/thumb/PSTAKE_Dark.png?1645709930', '1', 18);
INSERT INTO `token`
VALUES (215, 'Qredo', 'QRDO', '0x4123a133ae3c521FD134D7b13A2dEC35b56c2463',
        'https://assets.coingecko.com/coins/images/17541/thumb/qrdo.png?1630637735', '1', 8);
INSERT INTO `token`
VALUES (216, 'REVV', 'REVV', '0x557B933a7C2c45672B610F8954A3deB39a51A8Ca',
        'https://assets.coingecko.com/coins/images/12373/thumb/REVV_TOKEN_Refined_2021_%281%29.png?1627652390', '1',
        18);
INSERT INTO `token`
VALUES (217, 'Rook', 'ROOK', '0xfA5047c9c78B8877af97BDcb85Db743fD7313d4a',
        'https://assets.coingecko.com/coins/images/13005/thumb/keeper_dao_logo.jpg?1604316506', '1', 18);
INSERT INTO `token`
VALUES (218, 'Stargate Finance', 'STG', '0xAf5191B0De278C7286d6C7CC6ab6BB8A73bA2Cd6',
        'https://assets.coingecko.com/coins/images/24413/thumb/STG_LOGO.png?1647654518', '1', 18);
INSERT INTO `token`
VALUES (219, 'SWFTCOIN', 'SWFTC', '0x0bb217E40F8a5Cb79Adf04E1aAb60E5abd0dfC1e',
        'https://assets.coingecko.com/coins/images/2346/thumb/SWFTCoin.jpg?1618392022', '1', 8);
INSERT INTO `token`
VALUES (220, 'Swipe', 'SXP', '0x8CE9137d39326AD0cD6491fb5CC0CbA0e089b6A9',
        'https://assets.coingecko.com/coins/images/9368/thumb/swipe.png?1566792311', '1', 18);
INSERT INTO `token`
VALUES (221, 'Sylo', 'SYLO', '0xf293d23BF2CDc05411Ca0edDD588eb1977e8dcd4',
        'https://assets.coingecko.com/coins/images/6430/thumb/SYLO.svg?1589527756', '1', 18);
INSERT INTO `token`
VALUES (222, 'Threshold Network', 'T', '0xCdF7028ceAB81fA0C6971208e83fa7872994beE5',
        'https://assets.coingecko.com/coins/images/22228/thumb/nFPNiSbL_400x400.jpg?1641220340', '1', 18);
INSERT INTO `token`
VALUES (223, 'ChronoTech', 'TIME', '0x485d17A6f1B8780392d53D64751824253011A260',
        'https://assets.coingecko.com/coins/images/604/thumb/time-32x32.png?1627130666', '1', 8);
INSERT INTO `token`
VALUES (224, 'Alien Worlds', 'TLM', '0x888888848B652B3E3a0f34c96E00EEC0F3a23F72',
        'https://assets.coingecko.com/coins/images/14676/thumb/kY-C4o7RThfWrDQsLCAG4q4clZhBDDfJQVhWUEKxXAzyQYMj4Jmq1zmFwpRqxhAJFPOa0AsW_PTSshoPuMnXNwq3rU7Imp15QimXTjlXMx0nC088mt1rIwRs75GnLLugWjSllxgzvQ9YrP4tBgclK4_rb17hjnusGj_c0u2fx0AvVokjSNB-v2poTj0xT9BZRCbzRE3-lF1.jpg?1617700061',
        '1', 4);
INSERT INTO `token`
VALUES (225, 'TE FOOD', 'TONE', '0x2Ab6Bb8408ca3199B8Fa6C92d5b455F820Af03c4',
        'https://assets.coingecko.com/coins/images/2325/thumb/tec.png?1547036538', '1', 18);
INSERT INTO `token`
VALUES (226, 'The Virtua Kolect', 'TVK', '0xd084B83C305daFD76AE3E1b4E1F1fe2eCcCb3988',
        'https://assets.coingecko.com/coins/images/13330/thumb/virtua_original.png?1656043619', '1', 18);
INSERT INTO `token`
VALUES (227, 'Wrapped Ampleforth', 'WAMPL', '0xEDB171C18cE90B633DB442f2A6F72874093b49Ef',
        'https://assets.coingecko.com/coins/images/20825/thumb/photo_2021-11-25_02-05-11.jpg?1637811951', '1', 18);
INSERT INTO `token`
VALUES (228, 'Wrapped Centrifuge', 'WCFG', '0xc221b7E65FfC80DE234bbB6667aBDd46593D34F0',
        'https://assets.coingecko.com/coins/images/17106/thumb/WCFG.jpg?1626266462', '1', 18);
INSERT INTO `token`
VALUES (229, 'WOO Network', 'WOO', '0x4691937a7508860F876c9c0a2a617E7d9E945D4B',
        'https://assets.coingecko.com/coins/images/12921/thumb/w2UiemF__400x400.jpg?1603670367', '1', 18);
INSERT INTO `token`
VALUES (230, 'Chain', 'XCN', '0xA2cd3D43c775978A96BdBf12d733D5A1ED94fb18',
        'https://assets.coingecko.com/coins/images/24210/thumb/Chain_icon_200x200.png?1646895054', '1', 18);
INSERT INTO `token`
VALUES (231, 'Yield Guild Games', 'YGG', '0x25f8087EAD173b73D6e8B84329989A8eEA16CF73',
        'https://assets.coingecko.com/coins/images/17358/thumb/le1nzlO6_400x400.jpg?1632465691', '1', 18);
INSERT INTO `token`
VALUES (232, 'Unisocks', 'SOCKS', '0x23B608675a2B2fB1890d3ABBd85c5775c51691d5',
        'https://assets.coingecko.com/coins/images/10717/thumb/qFrcoiM.png?1582525244', '1', 18);
INSERT INTO `token`
VALUES (233, 'Blur', 'BLUR', '0x5283D291DBCF85356A21bA090E6db59121208b44',
        'https://assets.coingecko.com/coins/images/28453/large/blur.png?1670745921', '1', 18);
INSERT INTO `token`
VALUES (234, 'Axelar', 'AXL', '0x467719aD09025FcC6cF6F8311755809d45a5E5f3',
        'https://assets.coingecko.com/coins/images/27277/large/V-65_xQ1_400x400.jpeg', '1', 6);
INSERT INTO `token`
VALUES (235, 'Illuvium', 'ILV', '0x767FE9EDC9E0dF98E07454847909b5E959D7ca0E',
        'https://assets.coingecko.com/coins/images/14468/large/ILV.JPG', '1', 18);
INSERT INTO `token`
VALUES (236, 'Hashflow', 'HFT', '0xb3999F658C0391d94A37f7FF328F3feC942BcADC',
        'https://assets.coingecko.com/coins/images/26136/large/hashflow-icon-cmc.png', '1', 18);
INSERT INTO `token`
VALUES (237, 'Arbitrum', 'ARB', '0xB50721BCf8d664c30412Cfbc6cf7a15145234ad1', 'https://arbitrum.foundation/logo.png',
        '1', 18);
INSERT INTO `token`
VALUES (238, 'Coinbase Wrapped Staked ETH', 'cbETH', '0xBe9895146f7AF43049ca1c1AE358B0541Ea49704',
        'https://assets.coingecko.com/coins/images/27008/large/cbeth.png', '1', 18);
INSERT INTO `token`
VALUES (239, 'Cardano Token', 'ADA', '0x3EE2200Efb3400fAbB9AacF31297cBdD1d435D47',
        'https://tokens.pancakeswap.finance/images/0x3EE2200Efb3400fAbB9AacF31297cBdD1d435D47.png', '56', 18);
INSERT INTO `token`
VALUES (240, 'ALICE', 'ALICE', '0xAC51066d7bEC65Dc4589368da368b212745d63E8',
        'https://tokens.pancakeswap.finance/images/0xAC51066d7bEC65Dc4589368da368b212745d63E8.png', '56', 6);
INSERT INTO `token`
VALUES (241, 'AlinX', 'ALIX', '0xaF6Bd11A6F8f9c44b9D18f5FA116E403db599f8E',
        'https://assets-cdn.trustwallet.com/blockchains/smartchain/assets/0xaF6Bd11A6F8f9c44b9D18f5FA116E403db599f8E/logo.png',
        '56', 18);
INSERT INTO `token`
VALUES (242, 'AlphaToken', 'ALPHA', '0xa1faa113cbE53436Df28FF0aEe54275c13B40975',
        'https://tokens.pancakeswap.finance/images/0xa1faa113cbE53436Df28FF0aEe54275c13B40975.png', '56', 18);
INSERT INTO `token`
VALUES (243, 'Altura', 'ALU', '0x8263CD1601FE73C066bf49cc09841f35348e3be0',
        'https://assets-cdn.trustwallet.com/blockchains/smartchain/assets/0x8263CD1601FE73C066bf49cc09841f35348e3be0/logo.png',
        '56', 18);
INSERT INTO `token`
VALUES (244, 'Automata', 'ATA', '0xA2120b9e674d3fC3875f415A7DF52e382F141225',
        'https://tokens.pancakeswap.finance/images/0xA2120b9e674d3fC3875f415A7DF52e382F141225.png', '56', 18);
INSERT INTO `token`
VALUES (245, 'Cosmos Token', 'ATOM', '0x0Eb3a705fc54725037CC9e008bDede697f62F335',
        'https://tokens.pancakeswap.finance/images/0x0Eb3a705fc54725037CC9e008bDede697f62F335.png', '56', 18);
INSERT INTO `token`
VALUES (246, 'Axie Infinity Shard', 'AXS', '0x715D400F88C167884bbCc41C5FeA407ed4D2f8A0',
        'https://tokens.pancakeswap.finance/images/0x715D400F88C167884bbCc41C5FeA407ed4D2f8A0.png', '56', 18);
INSERT INTO `token`
VALUES (247, 'Baby Doge Coin', 'BABYDOGE', '0xc748673057861a797275CD8A068AbB95A902e8de',
        'https://assets-cdn.trustwallet.com/blockchains/smartchain/assets/0xc748673057861a797275CD8A068AbB95A902e8de/logo.png',
        '56', 9);
INSERT INTO `token`
VALUES (248, 'Bear', 'BEAR', '0xc3EAE9b061Aa0e1B9BD3436080Dc57D2d63FEdc1',
        'https://assets-cdn.trustwallet.com/blockchains/smartchain/assets/0xc3EAE9b061Aa0e1B9BD3436080Dc57D2d63FEdc1/logo.png',
        '56', 18);
INSERT INTO `token`
VALUES (249, 'Bella Protocol', 'BEL', '0x8443f091997f06a61670B735ED92734F5628692F',
        'https://tokens.pancakeswap.finance/images/0x8443f091997f06a61670B735ED92734F5628692F.png', '56', 18);
INSERT INTO `token`
VALUES (250, 'BELT Token', 'BELT', '0xE0e514c71282b6f4e823703a39374Cf58dc3eA4f',
        'https://tokens.pancakeswap.finance/images/0xE0e514c71282b6f4e823703a39374Cf58dc3eA4f.png', '56', 18);
INSERT INTO `token`
VALUES (251, 'Binemon', 'BIN', '0xe56842Ed550Ff2794F010738554db45E60730371',
        'https://assets-cdn.trustwallet.com/blockchains/smartchain/assets/0xe56842Ed550Ff2794F010738554db45E60730371/logo.png',
        '56', 18);
INSERT INTO `token`
VALUES (252, 'Binamon', 'BMON', '0x08ba0619b1e7A582E0BCe5BBE9843322C954C340',
        'https://tokens.pancakeswap.finance/images/0x08ba0619b1e7A582E0BCe5BBE9843322C954C340.png', '56', 18);
INSERT INTO `token`
VALUES (253, 'BinaryX', 'BNX', '0x8C851d1a123Ff703BD1f9dabe631b69902Df5f97',
        'https://assets-cdn.trustwallet.com/blockchains/smartchain/assets/0x8C851d1a123Ff703BD1f9dabe631b69902Df5f97/logo.png',
        '56', 18);
INSERT INTO `token`
VALUES (254, 'BunnyPark', 'BP', '0xACB8f52DC63BB752a51186D1c55868ADbFfEe9C1',
        'https://tokens.pancakeswap.finance/images/0xACB8f52DC63BB752a51186D1c55868ADbFfEe9C1.png', '56', 18);
INSERT INTO `token`
VALUES (255, 'BSCPAD.com', 'BSCPAD', '0x5A3010d4d8D3B5fB49f8B6E57FB9E48063f16700',
        'https://tokens.pancakeswap.finance/images/0x5A3010d4d8D3B5fB49f8B6E57FB9E48063f16700.png', '56', 18);
INSERT INTO `token`
VALUES (256, 'BitTorrent Old', 'BTTOLD', '0x8595F9dA7b868b1822194fAEd312235E43007b49',
        'https://tokens.pancakeswap.finance/images/0x8595F9dA7b868b1822194fAEd312235E43007b49.png', '56', 18);
INSERT INTO `token`
VALUES (257, 'Coin98', 'C98', '0xaEC945e04baF28b135Fa7c640f624f8D90F1C3a6',
        'https://tokens.pancakeswap.finance/images/0xaEC945e04baF28b135Fa7c640f624f8D90F1C3a6.png', '56', 18);
INSERT INTO `token`
VALUES (258, 'Chess', 'CHESS', '0x20de22029ab63cf9A7Cf5fEB2b737Ca1eE4c82A6',
        'https://tokens.pancakeswap.finance/images/0x20de22029ab63cf9A7Cf5fEB2b737Ca1eE4c82A6.png', '56', 18);
INSERT INTO `token`
VALUES (259, 'Chroma', 'CHR', '0xf9CeC8d50f6c8ad3Fb6dcCEC577e05aA32B224FE',
        'https://tokens.pancakeswap.finance/images/0xf9CeC8d50f6c8ad3Fb6dcCEC577e05aA32B224FE.png', '56', 6);
INSERT INTO `token`
VALUES (260, 'CP', 'CP', '0x82C19905B036bf4E329740989DCF6aE441AE26c1',
        'https://assets-cdn.trustwallet.com/blockchains/smartchain/assets/0x82C19905B036bf4E329740989DCF6aE441AE26c1/logo.png',
        '56', 18);
INSERT INTO `token`
VALUES (261, 'DeRace Token', 'DERC', '0x373E768f79c820aA441540d254dCA6d045c6d25b',
        'https://assets-cdn.trustwallet.com/blockchains/smartchain/assets/0x373E768f79c820aA441540d254dCA6d045c6d25b/logo.png',
        '56', 18);
INSERT INTO `token`
VALUES (262, 'DODO bird', 'DODO', '0x67ee3Cb086F8a16f34beE3ca72FAD36F7Db929e2',
        'https://tokens.pancakeswap.finance/images/0x67ee3Cb086F8a16f34beE3ca72FAD36F7Db929e2.png', '56', 18);
INSERT INTO `token`
VALUES (263, 'Dogecoin', 'DOGE', '0xbA2aE424d960c26247Dd6c32edC70B295c744C43',
        'https://tokens.pancakeswap.finance/images/0xbA2aE424d960c26247Dd6c32edC70B295c744C43.png', '56', 8);
INSERT INTO `token`
VALUES (264, 'My DeFi Pet Token', 'DPET', '0xfb62AE373acA027177D1c18Ee0862817f9080d08',
        'https://assets-cdn.trustwallet.com/blockchains/smartchain/assets/0xfb62AE373acA027177D1c18Ee0862817f9080d08/logo.png',
        '56', 18);
INSERT INTO `token`
VALUES (265, 'DeathRoad Token', 'DRACE', '0xA6c897CaaCA3Db7fD6e2D2cE1a00744f40aB87Bb',
        'https://assets-cdn.trustwallet.com/blockchains/smartchain/assets/0xA6c897CaaCA3Db7fD6e2D2cE1a00744f40aB87Bb/logo.png',
        '56', 18);
INSERT INTO `token`
VALUES (266, 'DragonSlayer', 'DRS', '0xc8E8ecB2A5B5d1eCFf007BF74d15A86434aA0c5C',
        'https://assets-cdn.trustwallet.com/blockchains/smartchain/assets/0xc8E8ecB2A5B5d1eCFf007BF74d15A86434aA0c5C/logo.png',
        '56', 9);
INSERT INTO `token`
VALUES (267, 'Dvision', 'DVI', '0x758FB037A375F17c7e195CC634D77dA4F554255B',
        'https://tokens.pancakeswap.finance/images/0x758FB037A375F17c7e195CC634D77dA4F554255B.png', '56', 18);
INSERT INTO `token`
VALUES (268, 'Etherconnect Coin', 'ECC', '0x8D047F4F57A190C96c8b9704B39A1379E999D82B',
        'https://assets-cdn.trustwallet.com/blockchains/smartchain/assets/0x8D047F4F57A190C96c8b9704B39A1379E999D82B/logo.png',
        '56', 8);
INSERT INTO `token`
VALUES (269, 'Ellipsis', 'EPS', '0xA7f552078dcC247C2684336020c03648500C6d9F',
        'https://tokens.pancakeswap.finance/images/0xA7f552078dcC247C2684336020c03648500C6d9F.png', '56', 18);
INSERT INTO `token`
VALUES (270, 'FaraCrystal', 'FARA', '0xF4Ed363144981D3A65f42e7D0DC54FF9EEf559A1',
        'https://assets-cdn.trustwallet.com/blockchains/smartchain/assets/0xF4Ed363144981D3A65f42e7D0DC54FF9EEf559A1/logo.png',
        '56', 18);
INSERT INTO `token`
VALUES (271, 'FLOKI', 'FLOKI', '0x2B3F34e9D4b127797CE6244Ea341a83733ddd6E4',
        'https://assets-cdn.trustwallet.com/blockchains/smartchain/assets/0x2B3F34e9D4b127797CE6244Ea341a83733ddd6E4/logo.png',
        '56', 9);
INSERT INTO `token`
VALUES (272, 'Formation Finance', 'FORM', '0x25A528af62e56512A19ce8c3cAB427807c28CC19',
        'https://tokens.pancakeswap.finance/images/0x25A528af62e56512A19ce8c3cAB427807c28CC19.png', '56', 18);
INSERT INTO `token`
VALUES (273, 'Frontier Token', 'FRONT', '0x928e55daB735aa8260AF3cEDadA18B5f70C72f1b',
        'https://tokens.pancakeswap.finance/images/0x928e55daB735aa8260AF3cEDadA18B5f70C72f1b.png', '56', 18);
INSERT INTO `token`
VALUES (274, 'CyberDragon Gold', 'GOLD', '0xb3a6381070B1a15169DEA646166EC0699fDAeA79',
        'https://assets-cdn.trustwallet.com/blockchains/smartchain/assets/0xb3a6381070B1a15169DEA646166EC0699fDAeA79/logo.png',
        '56', 18);
INSERT INTO `token`
VALUES (275, 'StepHero', 'HERO', '0xE8176d414560cFE1Bf82Fd73B986823B89E4F545',
        'https://tokens.pancakeswap.finance/images/0xE8176d414560cFE1Bf82Fd73B986823B89E4F545.png', '56', 18);
INSERT INTO `token`
VALUES (276, 'Metahero', 'HERO', '0xD40bEDb44C081D2935eebA6eF5a3c8A31A1bBE13',
        'https://tokens.pancakeswap.finance/images/0xD40bEDb44C081D2935eebA6eF5a3c8A31A1bBE13.png', '56', 18);
INSERT INTO `token`
VALUES (277, 'Honey token', 'HONEY', '0xFa363022816aBf82f18a9C2809dCd2BB393F6AC5',
        'https://assets-cdn.trustwallet.com/blockchains/smartchain/assets/0xFa363022816aBf82f18a9C2809dCd2BB393F6AC5/logo.png',
        '56', 18);
INSERT INTO `token`
VALUES (278, 'Hunny Token', 'HUNNY', '0x565b72163f17849832A692A3c5928cc502f46D69',
        'https://assets-cdn.trustwallet.com/blockchains/smartchain/assets/0x565b72163f17849832A692A3c5928cc502f46D69/logo.png',
        '56', 18);
INSERT INTO `token`
VALUES (279, 'Injective Protocol', 'INJ', '0xa2B726B1145A4773F68593CF171187d8EBe4d495',
        'https://tokens.pancakeswap.finance/images/0xa2B726B1145A4773F68593CF171187d8EBe4d495.png', '56', 18);
INSERT INTO `token`
VALUES (280, 'IoTeX Network', 'IOTX', '0x9678E42ceBEb63F23197D726B29b1CB20d0064E5',
        'https://tokens.pancakeswap.finance/images/0x9678E42ceBEb63F23197D726B29b1CB20d0064E5.png', '56', 18);
INSERT INTO `token`
VALUES (281, 'Kaby Arena', 'KABY', '0x02A40C048eE2607B5f5606e445CFc3633Fb20b58',
        'https://assets-cdn.trustwallet.com/blockchains/smartchain/assets/0x02A40C048eE2607B5f5606e445CFc3633Fb20b58/logo.png',
        '56', 18);
INSERT INTO `token`
VALUES (282, 'KmonCoin', 'KMON', '0xc732B6586A93b6B7CF5FeD3470808Bc74998224D',
        'https://assets-cdn.trustwallet.com/blockchains/smartchain/assets/0xc732B6586A93b6B7CF5FeD3470808Bc74998224D/logo.png',
        '56', 18);
INSERT INTO `token`
VALUES (283, 'Linear Token', 'LINA', '0x762539b45A1dCcE3D36d080F74d1AED37844b878',
        'https://tokens.pancakeswap.finance/images/0x762539b45A1dCcE3D36d080F74d1AED37844b878.png', '56', 18);
INSERT INTO `token`
VALUES (284, 'ChainLink Token', 'LINK', '0xF8A0BF9cF54Bb92F17374d9e9A321E6a111a51bD',
        'https://tokens.pancakeswap.finance/images/0xF8A0BF9cF54Bb92F17374d9e9A321E6a111a51bD.png', '56', 18);
INSERT INTO `token`
VALUES (285, 'Mask Network', 'MASK', '0x2eD9a5C8C13b93955103B9a7C167B67Ef4d568a3',
        'https://tokens.pancakeswap.finance/images/0x2eD9a5C8C13b93955103B9a7C167B67Ef4d568a3.png', '56', 18);
INSERT INTO `token`
VALUES (286, 'Mobox', 'MBOX', '0x3203c9E46cA618C8C1cE5dC67e7e9D75f5da2377',
        'https://tokens.pancakeswap.finance/images/0x3203c9E46cA618C8C1cE5dC67e7e9D75f5da2377.png', '56', 18);
INSERT INTO `token`
VALUES (287, 'MiniFootball', 'MINIFOOTBALL', '0xD024Ac1195762F6F13f8CfDF3cdd2c97b33B248b',
        'https://assets-cdn.trustwallet.com/blockchains/smartchain/assets/0xD024Ac1195762F6F13f8CfDF3cdd2c97b33B248b/logo.png',
        '56', 9);
INSERT INTO `token`
VALUES (288, 'Mist', 'MIST', '0x68E374F856bF25468D365E539b700b648Bf94B67',
        'https://assets-cdn.trustwallet.com/blockchains/smartchain/assets/0x68E374F856bF25468D365E539b700b648Bf94B67/logo.png',
        '56', 18);
INSERT INTO `token`
VALUES (289, 'Mound Token', 'MND', '0x4c97c901B5147F8C1C7Ce3c5cF3eB83B44F244fE',
        'https://assets-cdn.trustwallet.com/blockchains/smartchain/assets/0x4c97c901B5147F8C1C7Ce3c5cF3eB83B44F244fE/logo.png',
        '56', 18);
INSERT INTO `token`
VALUES (290, 'Monsta Infinite Token', 'MONI', '0x9573c88aE3e37508f87649f87c4dd5373C9F31e0',
        'https://assets-cdn.trustwallet.com/blockchains/smartchain/assets/0x9573c88aE3e37508f87649f87c4dd5373C9F31e0/logo.png',
        '56', 18);
INSERT INTO `token`
VALUES (291, 'Nafter', 'NAFT', '0xD7730681B1DC8f6F969166B29D8A5EA8568616a3',
        'https://assets-cdn.trustwallet.com/blockchains/smartchain/assets/0xD7730681B1DC8f6F969166B29D8A5EA8568616a3/logo.png',
        '56', 18);
INSERT INTO `token`
VALUES (292, 'Nobility', 'NBL', '0xA67a13c9283Da5AABB199Da54a9Cb4cD8B9b16bA',
        'https://assets-cdn.trustwallet.com/blockchains/smartchain/assets/0xA67a13c9283Da5AABB199Da54a9Cb4cD8B9b16bA/logo.png',
        '56', 18);
INSERT INTO `token`
VALUES (293, 'NFTB', 'NFTB', '0xde3dbBE30cfa9F437b293294d1fD64B26045C71A',
        'https://assets-cdn.trustwallet.com/blockchains/smartchain/assets/0xde3dbBE30cfa9F437b293294d1fD64B26045C71A/logo.png',
        '56', 18);
INSERT INTO `token`
VALUES (294, 'Nerve', 'NRV', '0x42F6f551ae042cBe50C739158b4f0CAC0Edb9096',
        'https://tokens.pancakeswap.finance/images/0x42F6f551ae042cBe50C739158b4f0CAC0Edb9096.png', '56', 18);
INSERT INTO `token`
VALUES (295, 'Harmony ONE', 'ONE', '0x03fF0ff224f904be3118461335064bB48Df47938',
        'https://tokens.pancakeswap.finance/images/0x03fF0ff224f904be3118461335064bB48Df47938.png', '56', 18);
INSERT INTO `token`
VALUES (296, 'PAID Network', 'PAID', '0xAD86d0E9764ba90DDD68747D64BFfBd79879a238',
        'https://assets-cdn.trustwallet.com/blockchains/smartchain/assets/0xAD86d0E9764ba90DDD68747D64BFfBd79879a238/logo.png',
        '56', 18);
INSERT INTO `token`
VALUES (297, 'PET GAMES', 'PETG', '0x09607078980CbB0665ABa9c6D1B84b8eAD246aA0',
        'https://assets-cdn.trustwallet.com/blockchains/smartchain/assets/0x09607078980CbB0665ABa9c6D1B84b8eAD246aA0/logo.png',
        '56', 18);
INSERT INTO `token`
VALUES (298, 'Pink Token', 'PINK', '0x9133049Fb1FdDC110c92BF5b7Df635abB70C89DC',
        'https://assets-cdn.trustwallet.com/blockchains/smartchain/assets/0x9133049Fb1FdDC110c92BF5b7Df635abB70C89DC/logo.png',
        '56', 18);
INSERT INTO `token`
VALUES (299, 'Polkamon', 'PMON', '0x1796ae0b0fa4862485106a0de9b654eFE301D0b2',
        'https://tokens.pancakeswap.finance/images/0x1796ae0b0fa4862485106a0de9b654eFE301D0b2.png', '56', 18);
INSERT INTO `token`
VALUES (300, 'Poco Token', 'POCO', '0x394bBA8F309f3462b31238B3fd04b83F71A98848',
        'https://assets-cdn.trustwallet.com/blockchains/smartchain/assets/0x394bBA8F309f3462b31238B3fd04b83F71A98848/logo.png',
        '56', 18);
INSERT INTO `token`
VALUES (301, 'Moonpot', 'POTS', '0x3Fcca8648651E5b974DD6d3e50F61567779772A8',
        'https://tokens.pancakeswap.finance/images/0x3Fcca8648651E5b974DD6d3e50F61567779772A8.png', '56', 18);
INSERT INTO `token`
VALUES (302, 'Plant vs Undead Token', 'PVU', '0x31471E0791fCdbE82fbF4C44943255e923F1b794',
        'https://assets-cdn.trustwallet.com/blockchains/smartchain/assets/0x31471E0791fCdbE82fbF4C44943255e923F1b794/logo.png',
        '56', 18);
INSERT INTO `token`
VALUES (303, 'PandaInu Wallet Token', 'PWT', '0xf3eDD4f14a018df4b6f02Bf1b2cF17A8120519A2',
        'https://assets-cdn.trustwallet.com/blockchains/smartchain/assets/0xf3eDD4f14a018df4b6f02Bf1b2cF17A8120519A2/logo.png',
        '56', 8);
INSERT INTO `token`
VALUES (304, 'Qubit Token', 'QBT', '0x17B7163cf1Dbd286E262ddc68b553D899B93f526',
        'https://tokens.pancakeswap.finance/images/0x17B7163cf1Dbd286E262ddc68b553D899B93f526.png', '56', 18);
INSERT INTO `token`
VALUES (305, 'Radio Caca V2', 'RACA', '0x12BB890508c125661E03b09EC06E404bc9289040',
        'https://assets-cdn.trustwallet.com/blockchains/smartchain/assets/0x12BB890508c125661E03b09EC06E404bc9289040/logo.png',
        '56', 18);
INSERT INTO `token`
VALUES (306, 'RAMP DEFI', 'RAMP', '0x8519EA49c997f50cefFa444d240fB655e89248Aa',
        'https://tokens.pancakeswap.finance/images/0x8519EA49c997f50cefFa444d240fB655e89248Aa.png', '56', 18);
INSERT INTO `token`
VALUES (307, 'Reef.finance', 'REEF', '0xF21768cCBC73Ea5B6fd3C687208a7c2def2d966e',
        'https://tokens.pancakeswap.finance/images/0xF21768cCBC73Ea5B6fd3C687208a7c2def2d966e.png', '56', 18);
INSERT INTO `token`
VALUES (308, 'rUSD', 'RUSD', '0x07663837218A003e66310a01596af4bf4e44623D',
        'https://tokens.pancakeswap.finance/images/0x07663837218A003e66310a01596af4bf4e44623D.png', '56', 18);
INSERT INTO `token`
VALUES (309, 'SafePal Token', 'SFP', '0xD41FDb03Ba84762dD66a0af1a6C8540FF1ba5dfb',
        'https://tokens.pancakeswap.finance/images/0xD41FDb03Ba84762dD66a0af1a6C8540FF1ba5dfb.png', '56', 18);
INSERT INTO `token`
VALUES (310, 'SeedifyFund', 'SFUND', '0x477bC8d23c634C154061869478bce96BE6045D12',
        'https://tokens.pancakeswap.finance/images/0x477bC8d23c634C154061869478bce96BE6045D12.png', '56', 18);
INSERT INTO `token`
VALUES (311, 'Shirtum', 'SHI', '0x7269d98Af4aA705e0B1A5D8512FadB4d45817d5a',
        'https://assets-cdn.trustwallet.com/blockchains/smartchain/assets/0x7269d98Af4aA705e0B1A5D8512FadB4d45817d5a/logo.png',
        '56', 18);
INSERT INTO `token`
VALUES (312, 'CryptoBlades Skill Token', 'SKILL', '0x154A9F9cbd3449AD22FDaE23044319D6eF2a1Fab',
        'https://tokens.pancakeswap.finance/images/0x154A9F9cbd3449AD22FDaE23044319D6eF2a1Fab.png', '56', 18);
INSERT INTO `token`
VALUES (313, 'StarMon', 'SMON', '0xAB15B79880f11cFfb58dB25eC2bc39d28c4d80d2',
        'https://assets-cdn.trustwallet.com/blockchains/smartchain/assets/0xAB15B79880f11cFfb58dB25eC2bc39d28c4d80d2/logo.png',
        '56', 18);
INSERT INTO `token`
VALUES (314, 'Splintershards', 'SPS', '0x1633b7157e7638C4d6593436111Bf125Ee74703F',
        'https://tokens.pancakeswap.finance/images/0x1633b7157e7638C4d6593436111Bf125Ee74703F.png', '56', 18);
INSERT INTO `token`
VALUES (315, 'SushiToken', 'SUSHI', '0x947950BcC74888a40Ffa2593C5798F11Fc9124C4',
        'https://tokens.pancakeswap.finance/images/0x947950BcC74888a40Ffa2593C5798F11Fc9124C4.png', '56', 18);
INSERT INTO `token`
VALUES (316, 'Swipe', 'SXP', '0x47BEAd2563dCBf3bF2c9407fEa4dC236fAbA485A',
        'https://tokens.pancakeswap.finance/images/0x47BEAd2563dCBf3bF2c9407fEa4dC236fAbA485A.png', '56', 18);
INSERT INTO `token`
VALUES (317, 'Tokocrypto Token', 'TKO', '0x9f589e3eabe42ebC94A44727b3f3531C0c877809',
        'https://tokens.pancakeswap.finance/images/0x9f589e3eabe42ebC94A44727b3f3531C0c877809.png', '56', 18);
INSERT INTO `token`
VALUES (318, 'Alien Worlds Trilium', 'TLM', '0x2222227E22102Fe3322098e4CBfE18cFebD57c95',
        'https://tokens.pancakeswap.finance/images/0x2222227E22102Fe3322098e4CBfE18cFebD57c95.png', '56', 4);
INSERT INTO `token`
VALUES (319, 'TokenPocket Token', 'TPT', '0xECa41281c24451168a37211F0bc2b8645AF45092',
        'https://tokens.pancakeswap.finance/images/0xECa41281c24451168a37211F0bc2b8645AF45092.png', '56', 4);
INSERT INTO `token`
VALUES (320, 'TRONPAD.network', 'TRONPAD', '0x1Bf7AedeC439D6BFE38f8f9b20CF3dc99e3571C4',
        'https://assets-cdn.trustwallet.com/blockchains/smartchain/assets/0x1Bf7AedeC439D6BFE38f8f9b20CF3dc99e3571C4/logo.png',
        '56', 18);
INSERT INTO `token`
VALUES (321, 'TRON', 'TRX', '0x85EAC5Ac2F758618dFa09bDbe0cf174e7d574D5B',
        'https://tokens.pancakeswap.finance/images/0x85EAC5Ac2F758618dFa09bDbe0cf174e7d574D5B.png', '56', 18);
INSERT INTO `token`
VALUES (322, 'TrusterCoin', 'TSC', '0xA2a26349448ddAfAe34949a6Cc2cEcF78c0497aC',
        'https://assets-cdn.trustwallet.com/blockchains/smartchain/assets/0xA2a26349448ddAfAe34949a6Cc2cEcF78c0497aC/logo.png',
        '56', 9);
INSERT INTO `token`
VALUES (323, 'TrueUSD', 'TUSD', '0x14016E85a25aeb13065688cAFB43044C2ef86784',
        'https://tokens.pancakeswap.finance/images/0x14016E85a25aeb13065688cAFB43044C2ef86784.png', '56', 18);
INSERT INTO `token`
VALUES (324, 'Trust Wallet', 'TWT', '0x4B0F1812e5Df2A09796481Ff14017e6005508003',
        'https://tokens.pancakeswap.finance/images/0x4B0F1812e5Df2A09796481Ff14017e6005508003.png', '56', 18);
INSERT INTO `token`
VALUES (325, 'UNCL on xDai on BSC', 'UNCL', '0x0E8D5504bF54D9E44260f8d153EcD5412130CaBb',
        'https://assets-cdn.trustwallet.com/blockchains/smartchain/assets/0x0E8D5504bF54D9E44260f8d153EcD5412130CaBb/logo.png',
        '56', 18);
INSERT INTO `token`
VALUES (326, 'UniCrypt on xDai on BSC', 'UNCX', '0x09a6c44c3947B69E2B45F4D51b67E6a39ACfB506',
        'https://assets-cdn.trustwallet.com/blockchains/smartchain/assets/0x09a6c44c3947B69E2B45F4D51b67E6a39ACfB506/logo.png',
        '56', 18);
INSERT INTO `token`
VALUES (327, 'Uniswap', 'UNI', '0xBf5140A22578168FD562DCcF235E5D43A02ce9B1',
        'https://tokens.pancakeswap.finance/images/0xBf5140A22578168FD562DCcF235E5D43A02ce9B1.png', '56', 18);
INSERT INTO `token`
VALUES (328, 'Wrapped UST Token', 'UST', '0x23396cF899Ca06c4472205fC903bDB4de249D6fC',
        'https://tokens.pancakeswap.finance/images/0x23396cF899Ca06c4472205fC903bDB4de249D6fC.png', '56', 18);
INSERT INTO `token`
VALUES (329, 'VAI Stablecoin', 'VAI', '0x4BD17003473389A42DAF6a0a729f6Fdb328BbBd7',
        'https://tokens.pancakeswap.finance/images/0x4BD17003473389A42DAF6a0a729f6Fdb328BbBd7.png', '56', 18);
INSERT INTO `token`
VALUES (330, 'Wanaka Farm', 'WANA', '0x339C72829AB7DD45C3C52f965E7ABe358dd8761E',
        'https://assets-cdn.trustwallet.com/blockchains/smartchain/assets/0x339C72829AB7DD45C3C52f965E7ABe358dd8761E/logo.png',
        '56', 18);
INSERT INTO `token`
VALUES (331, 'WEYU', 'WEYU', '0xFAfD4CB703B25CB22f43D017e7e0d75FEBc26743',
        'https://assets-cdn.trustwallet.com/blockchains/smartchain/assets/0xFAfD4CB703B25CB22f43D017e7e0d75FEBc26743/logo.png',
        '56', 18);
INSERT INTO `token`
VALUES (332, 'WINk', 'WIN', '0xaeF0d72a118ce24feE3cD1d43d383897D05B4e99',
        'https://tokens.pancakeswap.finance/images/0xaeF0d72a118ce24feE3cD1d43d383897D05B4e99.png', '56', 18);
INSERT INTO `token`
VALUES (333, 'XRP Token', 'XRP', '0x1D2F0da169ceB9fC7B3144628dB156f3F6c60dBE',
        'https://tokens.pancakeswap.finance/images/0x1D2F0da169ceB9fC7B3144628dB156f3F6c60dBE.png', '56', 18);
INSERT INTO `token`
VALUES (334, 'XWG', 'XWG', '0x6b23C89196DeB721e6Fd9726E6C76E4810a464bc',
        'https://assets-cdn.trustwallet.com/blockchains/smartchain/assets/0x6b23C89196DeB721e6Fd9726E6C76E4810a464bc/logo.png',
        '56', 18);
INSERT INTO `token`
VALUES (335, 'YAY Games', 'YAY', '0x524dF384BFFB18C0C8f3f43d012011F8F9795579',
        'https://assets-cdn.trustwallet.com/blockchains/smartchain/assets/0x524dF384BFFB18C0C8f3f43d012011F8F9795579/logo.png',
        '56', 18);
INSERT INTO `token`
VALUES (336, 'ZomaInfinity', 'ZIN', '0xFbe0b4aE6E5a200c36A341299604D5f71A5F0a48',
        'https://assets-cdn.trustwallet.com/blockchains/smartchain/assets/0xFbe0b4aE6E5a200c36A341299604D5f71A5F0a48/logo.png',
        '56', 18);


SET
FOREIGN_KEY_CHECKS = 1;
