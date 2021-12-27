// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {
    uint256 totalWaves;
    mapping(uint256 => address) public waveToAddress;

    constructor() {
        console.log("Yo yo, I am a contract and I am smart");
    }

    function wave() public {
        totalWaves += 1;
        console.log("%s has waved!", msg.sender);
        waveToAddress[totalWaves] = msg.sender;
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

        console.log("Wave number %d, from %d", _waveNumber, waveAddress);

        return waveAddress;
    }
}
