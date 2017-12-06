import React from 'react';
import $ from 'jquery';

import LoginForm from './components/LoginForm.js';
import RegisterForm from './components/RegisterForm.js';
import './utils/login-form.css';

class Login extends React.Component {
	render() {
		return(
			<div class="login-page" id="login-page">
			  <div class="form">
			  	<RegisterForm/>
					<LoginForm/>
				</div>
			</div>
		);
	}
}

var images = [
	"https://images.unsplash.com/photo-1485518994577-6cd6324ade8f?auto=format&fit=crop&w=1888&q=80&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D",
	"https://images.unsplash.com/photo-1505676652198-c6de23866d0e?auto=format&fit=crop&w=1923&q=80&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D",
	"https://images.unsplash.com/photo-1491156855053-9cdff72c7f85?auto=format&fit=crop&w=2000&q=80&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D",
	"https://images.unsplash.com/photo-1498732528303-ceac1ff31508?auto=format&fit=crop&w=1950&q=80&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D",
	"https://images.unsplash.com/photo-1509399039116-5e51717d4da5?auto=format&fit=crop&w=1951&q=80&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D",
	"https://images.unsplash.com/photo-1491156855053-9cdff72c7f85?auto=format&fit=crop&w=2000&q=80&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D",
	"https://images.unsplash.com/photo-1481489712339-f9c0734be5d5?auto=format&fit=crop&w=1960&q=80&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D",
	"https://images.unsplash.com/photo-1509844131888-1b6984483244?auto=format&fit=crop&w=1950&q=80&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D",
	"https://images.unsplash.com/photo-1508278579464-6532e89f884a?auto=format&fit=crop&w=1950&q=80&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D",
	"https://images.unsplash.com/photo-1509265226434-5f4ddbdb2f7a?auto=format&fit=crop&w=1950&q=80&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D"
	]

var randomImage = Math.floor(Math.random() * 10)

 $(document).ready(function() {
  $("#login-page").css("background-image", "url('" + images[randomImage] + "')");
})

export default Login;