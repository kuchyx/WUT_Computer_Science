import 'bootstrap/dist/css/bootstrap.min.css';

import Button from 'react-bootstrap/Button';
import Form from 'react-bootstrap/Form';
import React from 'react';

export default class Register extends React.Component {


  constructor(props) {
    super(props);
    this.state = {
      mail: "",
      login: "",
      blogTitle: "",
      password: "",
      };
  }
      
  render() {
    return (
        <div>
        <div>
        { this.state.mail }
        </div>
      <Form>
      <Form.Group className="mb-3" controlId="formBasicEmail">
          <Form.Label>Email address</Form.Label>
          <Form.Control type="email" placeholder="Enter email"
          value={this.state.mail} 
          onChange={evt => this.updateMail(evt)}
            />
          </Form.Group>
          
          <Form.Group className="mb-3" controlId="formLogin">
          <Form.Label>Login</Form.Label>
          <Form.Control type="login" placeholder="Enter Login" 
          value={this.state.login} 
          onChange={evt => this.updateLogin(evt)}
            />
          
          </Form.Group>
          <Form.Group className="mb-3" controlId="formBlogTitle">
          <Form.Label>Blog Title</Form.Label>
          <Form.Control type="blogTitle" placeholder="Enter Blog Title" 
          value={this.state.blogTitle} 
          onChange={evt => this.updateBlogTitle(evt)}
          />
          </Form.Group>
          
          <Form.Group className="mb-3" controlId="formPassword">
          <Form.Label>Password</Form.Label>
          <Form.Control type="password" placeholder="Enter Password" 
          value={this.state.password} 
          onChange={evt => this.updatePassword(evt)}
          />
      </Form.Group>
      <Button variant="primary" type="submit" onClick={async () =>  this.registerUser()}>
          Submit
      </Button>
  </Form>
  </div>
    );
  }
      
  updateMail(evt) {
    const val = evt.target.value;
    // ...       
    this.setState({
      mail: val
    });
  }

  updateLogin(evt) {
    const val = evt.target.value;
    // ...       
    this.setState({
      login: val
    });
  }

  updateBlogTitle(evt) {
    const val = evt.target.value;
    // ...       
    this.setState({
      blogTitle: val
    });
  }

  updatePassword(evt) {
    const val = evt.target.value;
    // ...       
    this.setState({
      password: val
    });
  }

  async registerUser() {
    const fetchAddress = "http://localhost:8000/posts/?login=" + this.state.login;
    // console.log(this.state.inputValue);
    const response = await fetch(fetchAddress, 
    { 
      method: "GET",
    });
    const allData = await response.json();
    console.log(allData.length);
    if(allData.length !== 0)
    {
      alert("This login: \"" + this.state.login + "\" is already taken!");
      return;
    } 
    await fetch("http://localhost:8000/posts", {
        method: "POST",
        headers: {
          "Content-Type": "application/json"
        },
        body: JSON.stringify(this.state)
      }).then(data => console.log(data));

    };
}