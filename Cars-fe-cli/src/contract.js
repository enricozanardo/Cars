import web3 from "./web3";

// taken from the deployed contract on the Rinkeby network
const address = "0x71ACF62a26f938F29E0b2cCcDA27C8D0CbD48bB6";

// taken from contracts_Inbox_sol_Inbox.abi
const abi = [
  {
    inputs: [{ internalType: "string", name: "initialMessage", type: "string" }],
    stateMutability: "nonpayable",
    type: "constructor",
  },
  {
    inputs: [],
    name: "message",
    outputs: [{ internalType: "string", name: "", type: "string" }],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [{ internalType: "string", name: "newMessage", type: "string" }],
    name: "setMessage",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
];

// create an instance of this contract
export default new web3.eth.Contract(abi, address);
