import React from 'react';
import Navbar from '../Navbar/components/Navbar.jsx';
import NewsFeed from './components/NewsFeed.jsx';
import 'bootstrap/dist/css/bootstrap.min.css';
import '../Home/utils/home-styles.css';
import { Link } from 'react-router-dom';


/**
 * Search component. Makes an API call and passes on the resulting items to child component.
 * Displays error message if an error occurs.
 */
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
      		_this.setState({itemlist: data});
      	})

		.catch(function(error) {
  			console.log('There has been a problem with your fetch operation: ' + error.message);
		});

    }

	render() {
    let $list = null;
    if(this.state.itemlist.length == 0){
      //$list = (<p><i class="fa fa-times-circle" aria-hidden="true"></i>  No result found</p>);
      $list = "";
    }
    else{
      $list = (<NewsFeed itemlist={this.state.itemlist}/>);
    }

		return(
      <div>
        <Navbar/>
        <div class="search-body">
          <div class="search-body-header">Search results for <b>{this.props.match.params.item}</b></div>
          {$list}
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
