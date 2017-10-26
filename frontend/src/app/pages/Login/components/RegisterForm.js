import React from 'react';
import $ from 'jquery';

class RegisterForm extends React.Component {
	constructor(props) {
		super(props);
		this.state = {
			username : '',
			password : '',
			email : ''
		}

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
	}
	handleSubmit(event) {
    var body = {
    	username: this.state.username,
    	password: this.state.password,
    	email : this.state.email
    }
    $.ajax({
		  url: "http://18.220.108.135/api/auth/register",
		  data: JSON.stringify(body),
		  type: "POST",
		  headers: {
		  	"Content-Type" : "application/json",
		  },
		  beforeSend: () => {
		  	console.log();
		  },
		  success: (res) => {
		  	var token = JSON.stringify(res.token);
		  	console.log("SUCCESS! Token: " + token);
		  	setCookie("token", token);
		  	window.location.replace("/");
		  },
		  error: (res, err) => {
		  	console.log("ERR " + err);
		  }
		});
    event.preventDefault();
  }

  handleChange(event) {
  	if(event.target.id == "username"){
    	this.setState({username: event.target.value});
    } else if (event.target.id == "email"){
    	this.setState({email: event.target.value});
    } else {
			this.setState({password: event.target.value});
    }
  }

	render() {
		return(
			<form class="register-form" onSubmit={this.handleSubmit}>
	      <input type="text" id="username" onChange={this.handleChange} placeholder="username"/>
	      <input type="password" id="password" onChange={this.handleChange}  placeholder="password"/>
	      <input type="text" id="email" onChange={this.handleChange}  placeholder="email address"/>
	      <button class="loginBtn loginBtn--login">Create</button>
	      <p class="message">Already registered? <a href="#">Sign In</a></p>
      </form>
		);
	}

	componentDidMount() {
	}
}
function setCookie(key, value) {
    var expires = new Date();
    expires.setTime(expires.getTime() + (1 * 24 * 60 * 60 * 1000));
    document.cookie = key + '=' + value + ';expires=' + expires.toUTCString();
}

function getCookie(key) {
    var keyValue = document.cookie.match('(^|;) ?' + key + '=([^;]*)(;|$)');
    return keyValue ? keyValue[2] : null;
}
export default RegisterForm;