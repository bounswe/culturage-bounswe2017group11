import React from 'react';
import '../utils/navbar.css';

class NavbarDropdown extends React.Component {
	constructor(props){
   		super(props);
   		this.state = {
   			user: this.props.user
   		};
	}
	handleClick(){
		removeCookie("token");
	}
	render() {
		return (
			<ul class = "navbar-dropdown nav navbar-nav navbar-right">
				<div class = "navbar-dropbtn navbar-p navbar-text">
					<b>{this.state.user.username}</b> <i class="fa fa-caret-down"></i>
				</div>
				<div class="navbar-dropdown-content">
					<li><a href="/Profile">Profile</a></li>
					<li onClick={this.handleClick}><a href="/login"><span className="glyphicon glyphicon-log-out"></span> Logout </a></li>
				</div>
			</ul>
		);
	}

}

function getCookie(key) {
    var keyValue = document.cookie.match('(^|;) ?' + key + '=([^;]*)(;|$)');
    return keyValue ? keyValue[2] : null;
}
function setCookie(key, value) {
    var expires = new Date();
    expires.setTime(expires.getTime() + (1 * 24 * 60 * 60 * 1000));
    document.cookie = key + '=' + value + ';expires=' + expires.toUTCString();
}
function removeCookie( name ) {
  document.cookie = name + '=; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
}

export default NavbarDropdown;