const hre = require("hardhat");

async function main() {
  const initBalance = 1;
  const Assessment = await hre.ethers.getContractFactory("Assessment");
  const assessment = await Assessment.deploy(initBalance);
  await assessment.deployed();

  console.log(`A contract with a balance of ${initBalance} ETH deployed to ${assessment.address}`);

  // You can also interact with the deployed contract here if needed
  // For example, you could call functions or access contract variables

  // Example: Get the contract owner
  const owner = await assessment.owner();
  console.log(`Contract owner: ${owner}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
