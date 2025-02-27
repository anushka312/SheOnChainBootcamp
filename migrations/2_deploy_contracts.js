const Certificate = artifacts.require("Certificate");
const NFTMarketplace = artifacts.require("NFTMarketplace");

module.exports = async function(deployer) {
  await deployer.deploy(Certificate);
  const certificationInstance = await Certificate.deployed();
  console.log("Certificate deployed at:", certificationInstance.address);


  await deployer.deploy(NFTMarketplace);
  const nftMarketplaceInstance = await NFTMarketplace.deployed();
  console.log("NFTMarketplace deployed at:", nftMarketplaceInstance.address);
};
