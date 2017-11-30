import React from 'react';
import '../utils/navbar.css';

class Navbar extends React.Component {
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
    	fetch('http://18.220.108.135/api/profile', {
        	method: 'GET',
        	headers: myHeaders
        })
    	.then(response => response.json())
    	.then(function(data){
      		_this.setState({user: data});
      		console.log(data)
      	})

		.catch(function(error) {
  			console.log('There has been a problem with your fetch operation: ' + error.message);
		});
	}
	handleClick(){
		removeCookie("token");
	}
	render() {
		return (
			<div className="my-navbar">
				<div className="container-fluid">
					<div className="navbar-header">
						<a className="navbar-brand" href="#"><span className="glyphicon glyphicon-fire"></span></a>
					</div>
					<div className="collapse navbar-collapse" id="myNavbar">
						<ul className="nav navbar-nav">
							<li className={(this.state.activeClassName == "home") ? "active" : ""}><a href="/">Home</a></li>
							{ this.state.token
								? <li className={(this.state.activeClassName == "upload") ? "active" : ""}><a href="/Upload">Add an Item</a></li>
								: ""
							}

						</ul>
						<div className="col-sm-3 col-md-3">
							<form id="search-bar" className="navbar-form" role="search">
								<div className="input-group my-input-group">
									<input type="text" className="form-control" placeholder="Search" name="q"></input>
									<div className="input-group-btn">
										<button className="btn btn-default" type="submit"><i className="glyphicon glyphicon-search"></i></button>
									</div>
								</div>
							</form>
						</div>
						<ul className="nav navbar-nav navbar-right">
						{ this.state.user
							? <p className="navbar-text navbar-p"><b>{this.state.user.username}</b></p>
							: ""
						}
						{ this.state.token
							? <li className={(this.state.activeClassName == "profile") ? "active" : ""}><a href="/Profile">Profile</a></li>
							: ""
						}
						{ this.state.token
							? <li onClick={this.handleClick}><a href="/login"><span className="glyphicon glyphicon-log-out"></span> Logout </a></li>
							: <li><a href="/login"><span className="glyphicon glyphicon-log-in"></span> Login</a></li>
						}
						</ul>
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
