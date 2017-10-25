import React from 'react';
import $ from 'jquery';

class LoginForm extends React.Component {
	render() {
		return(
			<form class="login-form">
      	<p class="intro">Start sharing knowledge about cultural heritage</p>
      	<input type="text" placeholder="username"/>
      	<input type="password" placeholder="password"/>
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