// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Certificate {
    address public owner;

    struct CertificateData {
        string certificateId;
        string recipientName;
        string courseName;
        string issuer;
        uint256 issueDate;
        uint256 expiryDate;
        bool revoked;
    }

    mapping(uint8 => CertificateData) public certificates;
    mapping(string => bool) private existingCertificates; 

    event CertificateIssued(address indexed recipient, uint8 certId);
    event CertificateRevoked(uint8 certId);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function issueCertificate(
        uint8 _certId,
        string memory _certificateId,
        string memory _recipientName,
        string memory _courseName,
        string memory _issuer,
        uint256 _issueDate,
        uint256 _expiryDate
    ) external onlyOwner {
        require(!existingCertificates[_certificateId], "Certificate ID already exists");
        require(certificates[_certId].issueDate == 0, "Certificate already issued");

        certificates[_certId] = CertificateData(
            _certificateId,
            _recipientName,
            _courseName,
            _issuer,
            _issueDate,
            _expiryDate,
            false
        );
        existingCertificates[_certificateId] = true;

        emit CertificateIssued(msg.sender, _certId);
    }

    function revokeCertificate(uint8 _certId) external onlyOwner {
        require(certificates[_certId].issueDate != 0, "Certificate does not exist");
        require(!certificates[_certId].revoked, "Certificate already revoked");

        certificates[_certId].revoked = true;

        emit CertificateRevoked(_certId);
    }

    function verifyCertificate(uint8 _certId) external view returns (bool) {
        return certificates[_certId].issueDate != 0 && !certificates[_certId].revoked;
    }
}
