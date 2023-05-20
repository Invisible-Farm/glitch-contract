const hre = require("hardhat");

async function main() {
  const SigVerifier = await hre.ethers.getContractFactory("SigVerifier");
  const sigVerifier = await SigVerifier.deploy();

  await sigVerifier.deployed();
  console.log("Contract deployed:", sigVerifier.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });

// mumbai: 0x1567710F9b6F8A82AFE37EB1D567CC6197d7BF5f