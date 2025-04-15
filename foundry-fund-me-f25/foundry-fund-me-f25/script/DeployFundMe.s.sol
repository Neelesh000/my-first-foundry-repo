// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelpConfig} from "./HelpConfig.s.sol";

contract DeployFundMe is Script {
    function run() external returns (FundMe) {
        //before and vm.startbroadcast -> its not a real trans
        HelpConfig helpConfig = new HelpConfig();
        address ethusdPriceFeed = helpConfig.activeNetworkConfig();
        //after vm.startbroadcast -> it is a real trans
        vm.startBroadcast();
        FundMe fundMe = new FundMe(ethusdPriceFeed);
        vm.stopBroadcast();
        return fundMe;
    }
}
