import Login from './login';
import React from 'react';
import loginContext from '../context.context';

export default class Blog extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
        login: "",
      };
  }
  
    render() {
      return (
          <div> You are not logged in {this.state.login} </div>
      );
    }
  }