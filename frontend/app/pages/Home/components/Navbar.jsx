import React from 'react';

class Navbar extends React.Component {
	constructor(props){
   		super(props);
   		this.state = {
   			activeClassName: this.props.page,
   			token: ''
   		};
	}
	componentDidMount(){
		var tokenTemp = getCookie("token");
		this.setState({token : tokenTemp});
		console.log(this.token);
	}
	render() {
		return (
			<div class="navbar navbar-default">
				<div class="container-fluid">
					<div class="navbar-header">
						<a class="navbar-brand" href="#"><span class="glyphicon glyphicon-fire"></span></a>
					</div>
					<div class="collapse navbar-collapse" id="myNavbar">
						<ul class="nav navbar-nav">
							<li class={(this.state.activeClassName == "home") ? "active" : ""}><a href="http://localhost:8080/home">Home</a></li>
							<li><a href="#">Add an Item</a></li>
						</ul>
						<div class="col-sm-3 col-md-3">
							<form class="navbar-form" role="search">
							<div class="input-group">
								<input type="text" class="form-control" placeholder="Search" name="q"></input>
								<div class="input-group-btn">
									<button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
								</div>
							</div>
								</form>
						</div>
						<ul class="nav navbar-nav navbar-right">
						{ this.state.token ? <li><a href="/login"><span class="glyphicon glyphicon-log-out" onClick={this.logOut}></span> Logout </a></li>
									: <li><a href="/login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
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
export default Navbar;