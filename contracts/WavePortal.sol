// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {
    uint256 totalWaves;
    mapping(uint256 => address) public waveToAddress;
    mapping(address => uint256) public userWaveCounts;

    constructor() {
        console.log("Yo yo, I am a contract and I am smart");
    }

    function wave() public {
        totalWaves += 1;
        console.log("%s has waved!", msg.sender);
        waveToAddress[totalWaves] = msg.sender;

        uint256 userCount = userWaveCounts[msg.sender];

        userWaveCounts[msg.sender] = userCount + 1;
    }

    function getTotalWaves() public view returns (uint256) {
        console.log("We have %d total waves!", totalWaves);
        return totalWaves;
    }

    function getAddressOfWaveNumber(uint256 _waveNumber)
        public
        view
        returns (address)
    {
        address waveAddress;

        waveAddress = waveToAddress[_waveNumber];

        console.log("Wave number %s, from %s", _waveNumber, waveAddress);

        return waveAddress;
    }

    function getUserCount() public view returns (uint256) {
        uint256 count = userWaveCounts[msg.sender];

        console.log("User %s has %s waves", msg.sender, count);

        return count;
    }
}
