import React from 'react';
import Navbar from './components/Navbar.jsx';
import NewsFeed from './components/NewsFeed.jsx';
import 'bootstrap/dist/css/bootstrap.min.css';
import './utils/home-styles.css';
import { Link } from 'react-router-dom';

class Home extends React.Component {
	constructor(){
   		super();
   		this.state = {itemlist: []};
	}

	componentDidMount(){
		var _this = this;
    	var myHeaders = new Headers();
    	myHeaders.append("Authorization", "JWT eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyMiwidXNlcm5hbWUiOiJha29rc2FsIiwiZW1haWwiOiJha29rc2FsQGEuY29tIiwiZXhwIjoyNTA4Njc4OTE1fQ.PgPIJppA9u5umhrHGxPmv7_1Hi2ItASDgd7NH4DHcO0");
    	fetch('http://18.220.108.135/api/items', {
        	method: 'GET',
        	headers: myHeaders
        })
    	.then(response => response.json())
    	.then(function(data){
    			console.log(data);
      		_this.setState({itemlist: data});
      	})

		.catch(function(error) {
  			console.log('There has been a problem with your fetch operation: ' + error.message);
		});

    }

	render() {
		return(
			<div class="home-body">
				<Navbar page={"home"}/>
				<NewsFeed itemlist={this.state.itemlist}/>
			</div>
		);
	}
}

export default Home;