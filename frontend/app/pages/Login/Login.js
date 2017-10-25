import React from 'react';

import LoginForm from './components/LoginForm.js';

class Login extends React.Component {
	render() {
		return(
			<div class="login-page">
			  <div class="form">
					<LoginForm/>
				</div>
			</div>
		);
	}
}

export default Login;