import React from 'react';
import $ from 'jquery';

class RegisterForm extends React.Component {
	render() {
		return(
			<form class="register-form">
	      <input type="text" placeholder="name"/>
	      <input type="password" placeholder="password"/>
	      <input type="text" placeholder="email address"/>
	      <button class="loginBtn loginBtn--login" style="text-indent:30%">Create</button>
	      <p class="message">Already registered? <a href="#">Sign In</a></p>
      </form>
		);
	}

	componentDidMount() {
	}
}

export default RegisterForm;