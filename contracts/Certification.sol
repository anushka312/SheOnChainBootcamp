// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Certificate {
    mapping(address => uint8[]) public certificateIds;

    function generateCertificate(string memory _certificateId) 
        external returns (uint8) 
    {   
        require(bytes(_certificateId).length > 1, "Invalid ID");

        
        uint8 newCertID = uint8(uint256(keccak256(abi.encodePacked(_certificateId, msg.sender))) %256);

        
        for (uint i = 0; i < certificateIds[msg.sender].length; ++i) {
            if (certificateIds[msg.sender][i] == newCertID) {
                revert("Certificate with this ID already exists");
            }
        }

        
        certificateIds[msg.sender].push(newCertID);

        return newCertID;
    }
}
