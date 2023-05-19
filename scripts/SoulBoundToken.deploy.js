const hre = require("hardhat");

async function main() {
  const SoulBoundToken = await hre.ethers.getContractFactory("SoulBoundToken");
  const soulBoundToken = await SoulBoundToken.deploy();

  await soulBoundToken.deployed();
  console.log("Contract deployed:", soulBoundToken.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });

// mumbai: 0x34acf1B28Eb3ef32850f408Ab3a6b714de0fc1B7