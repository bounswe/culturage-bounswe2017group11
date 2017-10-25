import React from 'react';
import { Link } from 'react-router-dom';
import LoginForm from './components/LoginForm.js';
import './utils/login-form.css';

class Login extends React.Component {
	render() {
		return(
			<div>
				<div class="login-page">
				  <div class="form">
						<LoginForm/>
					</div>
				</div>
			</div>
			
		);
	}
}

export default Login;