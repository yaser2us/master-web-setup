import React, {
  useCallback, useEffect, useState,
  useRef
} from 'react'
import axios from "axios"

import logo from './logo.svg';
import './App.css';

function App() {

  const [messages, setMessages] = useState({});

  useEffect(() => {
    const fetchMessages = () => {
      axios.get("https://dev-maya.maybank2u.com.my/mayasme/mayadb/mayadb/getAllMessages")
      // axios.get('http://172.31.101.121:2443/mayadb/mayadb/getAllMessages')
        // axios.get('https://sit-maya.maybank.com.my/mayasme/mayadb/mayadb/getAllMessages')
            .then(res => {
                console.log(res, "formioioioioio, locallll");
                setMessages(res.data);
            }).catch(err => console.log(err));
    }
    fetchMessages();
}, [])


  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>Good JOB ;)</p>
        <code style={{fontSize:9, color: '#777777', margin: 31}}>
          {JSON.stringify(messages)}
        </code>       
      </header>
    </div>
  );
}

export default App;
