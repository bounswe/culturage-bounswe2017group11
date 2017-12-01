import React from 'react';
import '../utils/navbar.css';

class NavbarSearch extends React.Component {
	constructor(){
		super();
	}
	render() {
		return (
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
		);
	}

}

export default NavbarSearch;