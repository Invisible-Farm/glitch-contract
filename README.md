## glitch-contect-server
This project is for issuing NFTs.
It is a contract that issues SBT and NFTs (GFT, IFT).
These contracts are deployed on the Mumbai Network.

* PSBT(Proof of value SBT): `0x34acf1B28Eb3ef32850f408Ab3a6b714de0fc1B7`
  * OpenSea: https://testnets.opensea.io/collection/proof-of-value-sbt
* GFT (Gratitude NFT): `0xa11A21F90AcF541f520CE35170Bd2e15bf887466`
  * OpenSea: https://testnets.opensea.io/collection/gratitude-nft-1
* IFT (Incense NFT): `0x28a40545fa8Af247f13B2c3Ef1A25CA95f1b25ee`
  * OpenSea: https://testnets.opensea.io/collection/incense-nft
* SigVerifier: `0x1567710F9b6F8A82AFE37EB1D567CC6197d7BF5f`

Dependencies
------------
This service has dependencies on other services.
- IVFM Front: https://github.com/Invisible-Farm/glitch-frontend
- IVFM Backend: https://github.com/Invisible-Farm/glitch-backend
- IVFM Contract: https://github.com/Invisible-Farm/glitch-contract
- IVFM Verifier: https://github.com/Invisible-Farm/glitch-verifier-server
- PostgreSQL: https://www.postgresql.org/
- Polygon ID: https://0xpolygonid.github.io/tutorials/

Building
--------
	npm clean
	npm install
    npm run start

