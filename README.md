# EduHub

## About the Developer
Anushka is a passionate developer and the creator of EduHub. With a strong background in blockchain, Web3, and smart contracts, she is currently pursuing a BTech in Computer Science at DTU. Her interests extend to designing, artificial intelligence, and building innovative projects that leverage decentralized technologies.

## Project Details
EduHub is a decentralized platform built on the EDU chain to facilitate secure and transparent issuance of certificates and tokenized course assets. The platform leverages blockchain to provide verifiable and immutable credentials while enabling an NFT marketplace for educational content.

## Vision
EduHub aims to revolutionize the education system by introducing decentralized certification and tokenized learning assets. By ensuring secure, immutable, and verifiable credentials, EduHub empowers students, educators, and institutions with a trustless and transparent system for managing educational achievements and intellectual property.

## Features
- **Decentralized Certification**: Issues verifiable blockchain-based certificates.
- **NFT Marketplace**: Enables the buying, selling, and trading of tokenized educational content.
- **Smart Contract Security**: Ensures tamper-proof and immutable records.
- **Transparent and Automated Transactions**: Uses smart contracts for seamless execution.

## Installation Guide
### Prerequisites
- Node.js (v16 or later)
- npm or yarn
- Truffle Suite
- Ganache (for local blockchain testing)
- MetaMask (for interacting with the blockchain)

### Setup Instructions
#### 1. Clone the Repository
```bash
 git clone https://github.com/yourusername/EduHub.git
 cd EduHub
```

#### 2. Install Dependencies
```bash
 npm install  # or yarn install
```

#### 3. Compile Smart Contracts
```bash
 truffle compile
```

#### 4. Deploy Contracts (Local Development)
```bash
 truffle develop  # Start a local blockchain
 migrate --reset  # Deploy contracts
```

#### 5. Run the Frontend
```bash
 cd client
 npm install  # or yarn install
 npm start  # Start the frontend
```

#### 6. Interacting with the Platform
- Connect your MetaMask wallet to the correct network.
- Use the UI to generate certificates and list educational NFTs.
- View and purchase tokenized courses.

## Smart Contract Overview
### Certificate Contract
- Generates and manages certificates with unique IDs.
- Ensures certificates are immutable and verifiable.

### NFT Marketplace Contract
- Creates and lists educational NFTs.
- Handles token sales and transfers securely.
- Implements listing price updates and transparent transactions.

## Contributing
1. Fork the repository.
2. Create a new branch (`feature-branch`).
3. Commit your changes.
4. Push to your branch and submit a PR.

## License
This project is licensed under the MIT License.

