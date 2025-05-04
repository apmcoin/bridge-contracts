const { task } = require("hardhat/config");
const fs = require("fs");
const path = require("path");

task("flatten", "Flattens and prints contracts and their dependencies")
  .setAction(async () => {
    const contractsPath = path.join(__dirname, "..", "contracts");
    
    // Flatten VIP.sol
    console.log("Flattening VIP.sol...");
    const flattenedVIP = await hre.run("flatten:get-flattened-sources", {
      files: [path.join(contractsPath, "token", "VIP.sol")],
    });
    fs.writeFileSync(
      path.join(__dirname, "..", "flattened", "VIP.sol"),
      flattenedVIP
    );

    // Flatten APMtoVIPBridge.sol
    console.log("Flattening APMtoVIPBridge.sol...");
    const flattenedBridge = await hre.run("flatten:get-flattened-sources", {
      files: [path.join(contractsPath, "bridge", "APMtoVIPBridge.sol")],
    });
    fs.writeFileSync(
      path.join(__dirname, "..", "flattened", "APMtoVIPBridge.sol"),
      flattenedBridge
    );

    console.log("Flattened contracts saved in 'flattened' directory");
  }); 