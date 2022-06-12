import 'bootstrap/dist/css/bootstrap.min.css';

import Container from 'react-bootstrap/Container';
import Nav from 'react-bootstrap/Nav';
import Navbar from 'react-bootstrap/Navbar';
import {
    Outlet,
} from "react-router-dom";
import React from 'react';
import loginContext from './context.context';

export default class App extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            login: "",
          };
      }

    render() {
    return (
        <div>

    <Navbar bg="light" expand="lg">
    <Container>
        <Navbar.Brand href="/">Lab 3</Navbar.Brand>
        <Navbar.Toggle aria-controls="basic-navbar-nav" />
        <Navbar.Collapse id="basic-navbar-nav">
        <Nav className="me-auto">
            <Nav.Link href="/">Home</Nav.Link>
            <Nav.Link href="/register">Register</Nav.Link>
            <Nav.Link href="/login">Login</Nav.Link>
            <Nav.Link href="/blog">Blog</Nav.Link>
        </Nav>
        </Navbar.Collapse>
    </Container>

    </Navbar>
    <Outlet />

    </div>

    );
    }
}

  
