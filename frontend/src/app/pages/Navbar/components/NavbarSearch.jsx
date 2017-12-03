import React from 'react';
import '../utils/navbar.css';

class NavbarSearch extends React.Component {
	constructor(){
		super();
		this.state = {
					searchText: '',
					searchResults: []
			}
			this.handleValueChange = this.handleValueChange.bind(this);
			this.handleSubmit = this.handleSubmit.bind(this);
	}

	// Handler for the button/submit event
	handleSubmit(e){
		e.preventDefault();

		var link = 'http://52.90.34.144:85/api/search/item?q=' + this.state.searchText;
		var _this = this;
			var myHeaders = new Headers();
			var token = "JWT " + getCookie('token');
			myHeaders.append("Authorization", token);
			fetch(link , {
					method: 'GET',
					headers: myHeaders
				})
			.then(response => response.json())
			.then(function(data){
					_this.setState({searchResults: data});
					console.log(data)
				})

		.catch(function(error) {
				console.log('There has been a problem with your fetch operation: ' + error.message);
		});

	}

	handleValueChange(e) {
				e.preventDefault();
        this.setState({searchText: e.target.value});
    }


	render() {
		return (
			<div className="col-sm-3 col-md-3">
				<form id="search-bar" className="navbar-form" role="search">
					<div className="input-group my-input-group">

							<input className="form-control"
								type="text"
								name="q"
								ref="title"
								value={ this.state.subject }
								onChange={ this.handleValueChange }
							required />

							<div className="input-group-btn">
								<button className="btn btn-default" type="submit" onClick={ this.handleSubmit }><i className="glyphicon glyphicon-search"></i></button>

							</div>
					</div>
				</form>
			</div>
		);
	}

}

function getCookie(key) {
    var keyValue = document.cookie.match('(^|;) ?' + key + '=([^;]*)(;|$)');
    return keyValue ? keyValue[2] : null;
}

export default NavbarSearch;
