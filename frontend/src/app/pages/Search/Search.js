import React from 'react';
import Navbar from '../Navbar/components/Navbar.jsx';
import NewsFeed from './components/NewsFeed.jsx';
import 'bootstrap/dist/css/bootstrap.min.css';
import '../Home/utils/home-styles.css';
import { Link } from 'react-router-dom';

class SearchTag extends React.Component {
	constructor(){
   		super();
   		this.state = {itemlist: []};
	}

	componentDidMount(){
		var _this = this;
    	var myHeaders = new Headers();
      var link = 'http://18.220.108.135/api/filter/tag/items?q=' + this.props.match.params.tag;
      var token = "JWT " + getCookie('token');
    	myHeaders.append("Authorization",token);
    	fetch(link , {
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

function getCookie(key) {
    var keyValue = document.cookie.match('(^|;) ?' + key + '=([^;]*)(;|$)');
    return keyValue ? keyValue[2] : null;
}

export default SearchTag;