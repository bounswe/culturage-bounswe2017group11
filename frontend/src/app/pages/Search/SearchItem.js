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
      var link = 'http://52.90.34.144:85/api/search/item?q=' + this.props.match.params.item;
      var token = "JWT " + "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Imd1ZXN0QHRlc3QuY29tIiwidXNlcm5hbWUiOiJndWVzdCIsImV4cCI6MTUzODMxMjMyNiwidXNlcl9pZCI6MTd9.xKhxAdDl8yKwEV4elrjXASIg8VhO8DwwEEd_xssoxiQ";
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
        <Navbar page={"home"}/>
        <div class="home-body">
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
