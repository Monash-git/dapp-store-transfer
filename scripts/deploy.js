const hre = require("hardhat");

async function main() {
  const [deployer] = await hre.ethers.getSigners();
  console.log("Deploying contracts with the account:", deployer.address);

  const StoreTransfer = await hre.ethers.getContractFactory("StoreTransfer");
  const storeTransfer = await StoreTransfer.deploy();

  await storeTransfer.deployed();

  console.log("StoreTransfer deployed to:", storeTransfer.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });