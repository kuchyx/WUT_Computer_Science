import 'bootstrap/dist/css/bootstrap.min.css';

import Button from 'react-bootstrap/Button';
import Form from 'react-bootstrap/Form';
import React from 'react';

export default class Register extends React.Component {


        constructor(props) {
          super(props);
          this.state = {
            inputValue: 'test'
          };
        }
      
        render() {
          return (
              <div>
              <div>
              { this.state.inputValue }
              </div>
            <Form>
            <Form.Group className="mb-3" controlId="formBasicEmail">
                <Form.Label>Email address</Form.Label>
                <Form.Control type="email" placeholder="Enter email"
                value={this.state.inputValue} 
                onChange={evt => this.updateInputValue(evt)}
                 />
                </Form.Group>
                
                <Form.Group className="mb-3" controlId="formLogin">
                <Form.Label>Login</Form.Label>
                <Form.Control type="login" placeholder="Enter Login" />
                
                </Form.Group>
                <Form.Group className="mb-3" controlId="formBlogTitle">
                <Form.Label>Blog Title</Form.Label>
                <Form.Control type="blogTitle" placeholder="Enter Blog Title" />
                </Form.Group>
                
                <Form.Group className="mb-3" controlId="formPassword">
                <Form.Label>Password</Form.Label>
                <Form.Control type="password" placeholder="Enter Password" />
            </Form.Group>
            <Button variant="primary" type="submit" onClick={() => this.registerUser()}>
                Submit
            </Button>
        </Form>
        </div>
          );
        }
      
        updateInputValue(evt) {
          const val = evt.target.value;
          // ...       
          this.setState({
            inputValue: val
          });
        }

        registerUser() {
            alert(this.state.inputValue);
            
            console.log("anything");
            // console.log(this.state.inputValue);
            const test = {
                title: this.state.inputValue,
                author: "test"
              };
            fetch("http://localhost:8000/posts", {
                method: "POST",
                headers: {
                  "Content-Type": "application/json"
                },
                body: JSON.stringify(test)
              }).then(data => console.log(data));
        };
}