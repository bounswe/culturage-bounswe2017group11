import React from 'react';
import $ from 'jquery';
import SocialButton from './SocialButton';

class LoginForm extends React.Component {
	constructor(props) {
		super(props);
		this.state = {
			username : '',
			password : ''
		}

    this.handleChange = this.handleChange.bind(this);
    this.handleLogin = this.handleLogin.bind(this);
    this.handleFBLogin = this.handleFBLogin.bind(this);
    this.handleFBFailure = this.handleFBFailure.bind(this);
	}

  handleLogin(event) {
    var body = {
    	username: this.state.username,
    	password: this.state.password
    }
    $.ajax({
		  url: "http://52.90.34.144:85/api/auth/login",
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
		  	var token = res.token;
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
    } else {
    	this.setState({password: event.target.value});
    }
  }

  handleFBLogin(user){
  	console.log(user);
  }

  handleFBFailure(err){

  }

	render() {
		return(
			<form class="login-form" onSubmit={this.handleLogin}>
      	<p class="intro">Start sharing knowledge about cultural heritage</p>
      	<input type="text" id="username" onChange={this.handleChange} placeholder="username"/>
      	<input type="password" id="password" onChange={this.handleChange} placeholder="password"/>
	      <div class="row">
        	<button class="loginBtn onClick={this.handleLogin} loginBtn--login">Login</button>
      	</div>
      	<div class="row">
      	 	<SocialButton
			      provider='facebook'
			      appId='136076600389829'
			      onLoginSuccess={this.handleFBLogin}
			      onLoginFailure={this.handleFBFailure}
			      className="loginBtn loginBtn--facebook"
			    >
			      Login with Facebook
			    </SocialButton>
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
function setCookie(key, value) {
    var expires = new Date();
    expires.setTime(expires.getTime() + (1 * 24 * 60 * 60 * 1000));
    document.cookie = key + '=' + value + ';expires=' + expires.toUTCString();
}

function getCookie(key) {
    var keyValue = document.cookie.match('(^|;) ?' + key + '=([^;]*)(;|$)');
    return keyValue ? keyValue[2] : null;
}
export default LoginForm;