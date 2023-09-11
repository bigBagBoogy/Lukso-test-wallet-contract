// Assuming you have a web3 instance and the contract ABI and address
const contractAbi = require("./constants/abi.js");
const contractAddress = require("./constants/contractAddress.js");
const myContract = new web3.eth.Contract(contractAbi, contractAddress);

// Listen for the UniversalReceiver event
myContract.events
  .UniversalReceiver()
  .on("data", (event) => {
    const eventData = event.returnValues;
    // Process the event data, e.g., display a notification to the user
    console.log(`Received ${eventData.value} LYXt from ${eventData.from}`);
  })
  .on("error", (error) => {
    console.error("Error:", error);
  });
