import React from 'react';
import $ from 'jquery';

import LoginForm from './components/LoginForm.js';
import RegisterForm from './components/RegisterForm.js';
import './utils/login-form.css';

class Login extends React.Component {
	render() {
		return(
			<div class="login-page">
			  <div class="form">
			  	<RegisterForm/>
					<LoginForm/>
				</div>
			</div>
		);
	}
}

export default Login;