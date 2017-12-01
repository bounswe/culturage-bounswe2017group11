import React from 'react';
import Navbar from '../Navbar/components/Navbar.jsx';
import NewsFeed from './components/NewsFeed.jsx';
import RecommendedList from './components/RecommendedList.jsx';
import 'bootstrap/dist/css/bootstrap.min.css';
import './utils/home-styles.css';
import { Link } from 'react-router-dom';

class Home extends React.Component {
	constructor(){
   		super();
   		this.state = {
   						itemlist: [],
   						recommended: [],
   						loggedIn: 0
   					};
	}

	componentDidMount(){
		var _this = this;
		var tokenTemp = getCookie("token");
		if(tokenTemp == null){
			tokenTemp = "JWT eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6ImhhbGlsa2Fsa2FuOTVAZ21haWwuY29tIiwidXNlcl9pZCI6MywiZXhwIjoxNTM3OTA1NDQ0LCJ1c2VybmFtZSI6ImhhbGlsIn0.hV0dPW3IsrqynXjwiycc5s25dtaReLP6J446soiwU2Y"
		}else{
			tokenTemp = "JWT " + tokenTemp;
			_this.setState({loggedIn: 1});
		}
    	var myHeaders = new Headers();
    	myHeaders.append("Authorization", tokenTemp);
    	fetch('http://52.90.34.144:85/api/items', {
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

		fetch('http://52.90.34.144:85/api/recommendation', {
        	method: 'GET',
        	headers: myHeaders
        })
    	.then(response => response.json())
    	.then(function(data){
      		_this.setState({recommended: data});
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
					{ Boolean(this.state.loggedIn)
						? <RecommendedList recommended={this.state.recommended}/>
							: ""
					}
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
function setCookie(key, value) {
    var expires = new Date();
    expires.setTime(expires.getTime() + (1 * 24 * 60 * 60 * 1000));
    document.cookie = key + '=' + value + ';expires=' + expires.toUTCString();
}
function removeCookie( name ) {
  document.cookie = name + '=; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
}

export default Home;