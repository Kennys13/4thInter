// scripts/deploy.js
const { ethers } = require("hardhat");

async function main() {
  // Set up the accounts
  const [deployer] = await ethers.getSigners();

  console.log("Deploying contracts with the account:", deployer.address);

  // Deploy the contract
  const DegenGamingToken = await ethers.getContractFactory("DegenGamingToken");
  const contract = await DegenGamingToken.deploy();

  console.log("Contract address:", contract.target);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });

