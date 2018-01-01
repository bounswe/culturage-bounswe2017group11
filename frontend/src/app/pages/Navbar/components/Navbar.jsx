import React from 'react';
import '../utils/navbar.css';
import NavbarDropdown from './NavbarDropdown.jsx';
import NavbarSearch from './NavbarSearch.jsx';
import PropTypes from 'prop-types';

	/**
   *  Navbar component. Contains NavbarDropdown and NavbarSearch components. 
   * If user is not logged in displays login/register button.
   * If user is logged in displays upload button and user dropdown menu.
   */

class Navbar extends React.Component {
	static propTypes = {
        /** Name of the current page. Ex: "home" or "upload" */
        page: PropTypes.string
    }
	constructor(props){
   		super(props);
   		this.state = {
   			activeClassName: this.props.page,
   			token: '',
   			user: ''
   		};
	}
	componentDidMount(){
		var _this = this;
		var tokenTemp = getCookie("token");
		_this.setState({token : tokenTemp});
		var myHeaders = new Headers();
    	myHeaders.append("Authorization", "JWT " + tokenTemp);
    	fetch('http://52.90.34.144:85/api/profile', {
        	method: 'GET',
        	headers: myHeaders
        })
    	.then(response => response.json())
    	.then(function(data){
      		_this.setState({user: data});
      	})

		.catch(function(error) {
  			console.log('There has been a problem with your fetch operation: ' + error.message);
		});
	}

	/**
    * Removes user token.
    *
    * @public
    */

	handleClick(){
		removeCookie("token");
	}
	render() {
		return (
			<div className="my-navbar">
				<div className="container-fluid">
					<div className="navbar-header">
						<img className="icon" src="https://image.ibb.co/gJZixG/favicon.png"/>
					</div>
					<div className="collapse navbar-collapse" id="myNavbar">
						<ul className="nav navbar-nav">
							<li className={(this.state.activeClassName == "home") ? "active" : ""}><a href="/">Home</a></li>
							{ this.state.user.username
								? <li className={(this.state.activeClassName == "upload") ? "active" : ""}><a href="/Upload">Add an Item</a></li>
								: ""
							}

						</ul>
						<NavbarSearch/>
						{ this.state.user.username
							? <NavbarDropdown user={this.state.user}/>
							: <ul className="nav navbar-nav navbar-right"><li><a href="/login"><span className="glyphicon glyphicon-log-in"></span> Login</a></li></ul>
						}
					</div>
				</div>
			</div>

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
export default Navbar;
