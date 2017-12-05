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
      var link = 'http://52.90.34.144:85/api/filter/tag/items?q=' + this.props.match.params.tag;
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
      <div>
        <Navbar/>
        <div class="search-body">
          <div class="search-body-header">Tag search results for <b>{this.props.match.params.tag}</b></div>
          <NewsFeed itemlist={this.state.itemlist}/>
        </div>
      </div>
		);
	}
}

function getCookie(key) {
    var keyValue = document.cookie.match('(^|;) ?' + key + '=([^;]*)(;|$)');
    return keyValue ? keyValue[2] : null;
}

export default SearchTag;