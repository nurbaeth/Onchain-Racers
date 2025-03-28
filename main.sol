// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract OnchainRacers {
    struct Racer {
        address player;
        uint256 speed;
    }

    Racer[] public racers;
    bool public raceOngoing;
    address public winner;
    
    event RaceStarted();
    event RacerRegistered(address indexed player, uint256 speed);
    event RaceFinished(address indexed winner);

    modifier onlyWhenRaceNotOngoing() {
        require(!raceOngoing, "Race is already ongoing");
        _;
    }

    function registerRacer(uint256 speed) external onlyWhenRaceNotOngoing {
        require(speed > 0, "Speed must be greater than zero");
        racers.push(Racer(msg.sender, speed));
        emit RacerRegistered(msg.sender, speed);
    }

    function startRace() external onlyWhenRaceNotOngoing {
        require(racers.length > 1, "Not enough racers");
        raceOngoing = true;
        emit RaceStarted();
    }

    function finishRace() external {
        require(raceOngoing, "Race has not started");
        require(racers.length > 1, "Not enough racers");
        
        uint256 randomIndex = uint256(keccak256(abi.encodePacked(block.timestamp, block.prevrandao, racers.length))) % racers.length;
        winner = racers[randomIndex].player;
        
        raceOngoing = false;
        delete racers;
        emit RaceFinished(winner);
    }
}
