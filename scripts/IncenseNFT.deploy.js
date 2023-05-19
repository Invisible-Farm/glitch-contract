const hre = require("hardhat");

async function main() {
  const IncenseNFT = await hre.ethers.getContractFactory("IncenseNFT");
  const incenseNFT = await IncenseNFT.deploy();

  await incenseNFT.deployed();
  console.log("Contract deployed:", incenseNFT.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });

// mumbai: 0x28a40545fa8Af247f13B2c3Ef1A25CA95f1b25ee