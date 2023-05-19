const hre = require("hardhat");

async function main() {
  const GratitudeNFT = await hre.ethers.getContractFactory("GratitudeNFT");
  const gratitudeNFT = await GratitudeNFT.deploy();

  await gratitudeNFT.deployed();
  console.log("Contract deployed:", gratitudeNFT.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });

// mumbai: 0xa11A21F90AcF541f520CE35170Bd2e15bf887466