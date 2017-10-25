import React from 'react';
import $ from 'jquery';

class LoginForm extends React.Component {
	constructor(props) {
		super(props);
		this.state = {
			username : '',
			password : ''
		}

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
	}

  handleSubmit(event) {
    var body = {
    	username: this.state.username,
    	password: this.state.password
    }
    $.ajax({
		  url: "http://18.220.108.135/api/auth/login",
		  data: JSON.stringify(body),
		  type: "POST",
		  headers: {
		  	"Content-Type" : "application/json",
		  	"Accept" : "application/json"
		  },
		  beforeSend: () => {
		  	console.log();
		  },
		  success: (res) => {
		  	console.log("SUCCESS! Token: " + JSON.stringify(res));
		  },
		  error: (res, err) => {
		  	console.log("ERR " + err);
		  }
		});
    event.preventDefault();
  }

  handleChange(event) {
  	console.log(event.target.id);
  	if(event.target.id == "username"){
    	this.setState({username: event.target.value});
    } else {
    	this.setState({password: event.target.value});
    }
  }

	render() {
		return(
			<form class="login-form" onSubmit={this.handleSubmit}>
      	<p class="intro">Start sharing knowledge about cultural heritage</p>
      	<input type="text" id="username" onChange={this.handleChange} placeholder="username"/>
      	<input type="password" id="password" onChange={this.handleChange} placeholder="password"/>
	      <div class="row">
        	<button class="loginBtn loginBtn--login">Login</button>
      	</div>
      	<div class="row">
	        <button class="loginBtn loginBtn--facebook">Login with Facebook </button>
	      </div>
	      <div class="row">
	        <button class="loginBtn loginBtn--google">Login with Google</button>
	      </div>
	      <p class="message">Not registered? <a href="#">Create an account</a></p>
			</form>
		);
	}

	componentDidMount() {
		$('.message a').click(function(){
   		$('form').animate({height: "toggle", opacity: "toggle"}, "slow");
 		});

 		console.log('jQUery Loaded');
	}
}

export default LoginForm;