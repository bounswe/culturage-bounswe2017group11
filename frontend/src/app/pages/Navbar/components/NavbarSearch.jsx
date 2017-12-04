import React from 'react';
import '../utils/navbar.css';
import Autosuggest from 'react-autosuggest';

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
		var replaceWith = '/searchItem/' + this.state.searchText;
		window.location.replace(replaceWith);
	}

	handleValueChange(e) {
				e.preventDefault();
        this.setState({searchText: e.target.value});

				var link = 'http://52.90.34.144:85/api/search/item?q=' + this.state.searchText;
				var _this = this;
					var myHeaders = new Headers();
					var token = "JWT " + "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Imd1ZXN0QHRlc3QuY29tIiwidXNlcm5hbWUiOiJndWVzdCIsImV4cCI6MTUzODMxMjMyNiwidXNlcl9pZCI6MTd9.xKhxAdDl8yKwEV4elrjXASIg8VhO8DwwEEd_xssoxiQ";
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


	render() {
	  let {searchResults} = this.state;
		let $returnValue = null;
		if(searchResults){
			$returnValue = searchResults.map(function(data){
						return <li><a href={"/searchTag/" + data.name}>{data.name}</a></li>
			})
		}
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
