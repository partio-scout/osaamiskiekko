import React, { Component } from 'react';
import { Button } from 'semantic-ui-react';
import './App.css';
import 'semantic-ui-css/semantic.min.css';
import axios from 'axios';

async function getApiData() {
  try {
    const response = await axios.get('/api/testendpoints');
    console.log(response);
  } catch (error) {
    console.error(error);
  }
}

class App extends Component {
  render() {
    return (
      <div className="App">
        <header className="App-header">
          <Button primary onClick={getApiData}>Very semantic button</Button>
        </header>
      </div>
    );
  }
}

export default App;
