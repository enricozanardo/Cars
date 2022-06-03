import logo from './inboxLogo_01.svg';
import './App.css';


import contract from './contract';
import { useEffect, useState } from 'react';
import web3 from './web3';
import Loader from 'react-loader-spinner';

function App() {
  const [message, setMessage] = useState('');
  const [newMessage, setNewMessage] = useState('');
  const [isLoading, setIsLoading] = useState(false);


  useEffect(() => {
    getMessage();
  }, [])

  const getMessage = async () => {
    let blockchainMessage = await contract.methods.message().call();
    setMessage(blockchainMessage)
  }

  const inputText = (value) => {
    setNewMessage(value);
  }

  const handleSubmit = async (event) => {
    event.preventDefault();
    setIsLoading(true);

    // Get the accounts
    const accounts = await web3.eth.getAccounts();

    //Generate the transaction
    // Use one of those accounts to deploy the contract
     await contract.methods.setMessage(newMessage).send({ from: accounts[0], gas: '1000000', gasPrice: '5000000000'});
    
    //Update the view
    getMessage()
    setIsLoading(false);
  }


  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        {isLoading &&
          <Loader type="Circles" color="#F5A623" height={80} width={80}/>
        }
        {!isLoading && (
          <div>
             <p style={{color:'#F5A623'}}>Last message on the blockchain is: <h4 style={{color:'#4A90E2'}}>{message}</h4> </p>
             <div>
                <label style={{color:'#F5A623'}}>&lt;Type New Message&gt;</label> <br/>
                <input
                onChange={event => inputText(event.target.value) }
                /> &nbsp;
                <button onClick={event => handleSubmit(event)}>Send Transaction</button>
              </div>
          </div>
        )}
      </header>
    </div>
  );
}

export default App;
