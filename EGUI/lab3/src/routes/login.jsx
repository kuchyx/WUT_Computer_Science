import 'bootstrap/dist/css/bootstrap.min.css';

import Button from 'react-bootstrap/Button';
import Form from 'react-bootstrap/Form';
import React from 'react';

export default class Login extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
        login: "",
        password: "",
      };
  }
  
  render () {
    return (
      <Form>
          <Form.Group className="mb-3" controlId="formLogin">
          <Form.Label>Login</Form.Label>
          <Form.Control type="login" placeholder="Enter Login" 
          value={this.state.login} 
          onChange={evt => this.updateLogin(evt)}
            />
          
          </Form.Group>
      
          <Form.Group className="mb-3" controlId="formPassword">
          <Form.Label>Password</Form.Label>
          <Form.Control type="password" placeholder="Enter Password" 
          value={this.state.password} 
          onChange={evt => this.updatePassword(evt)}
          />
      </Form.Group>
      <Button variant="primary" type="submit" onClick={async () =>  this.loginUser()}>
          Submit
      </Button>
      </Form>
    )
  }

  updateLogin(evt) {
    const val = evt.target.value;
    // ...       
    this.setState({
      login: val
    });
  }
  
  updatePassword(evt) {
    const val = evt.target.value;
    // ...       
    this.setState({
      password: val
    });
  }

  async loginUser() {
    const fetchAddress = "http://localhost:8000/users/?login=" + this.state.login;
    console.log(fetchAddress);
    let response = await fetch(fetchAddress, 
    { 
      method: "GET",
      headers: {
        "Content-Type": "application/json"
      },
      mode: `cors`,
    });

    const allData = await response.json();
    console.log(JSON.stringify(allData));
    if(allData.length === 0)
    {
      alert("This login: \"" + this.state.login + "\" does not exist!");
      return;
    }    if(allData[0].password !== this.state.password)
    {
      alert("Wrong password!");
      return;
    }
    return this.state.login;
  }
}