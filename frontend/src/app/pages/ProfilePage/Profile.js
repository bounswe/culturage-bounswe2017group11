import React from 'react';
import Navbar from '../Navbar/components/Navbar.jsx';
import ProfilePage from './components/ProfilePage.jsx';
import 'bootstrap/dist/css/bootstrap.min.css';
import { Link } from 'react-router-dom';

class Profile extends React.Component {
	constructor(){
   		super();
   		this.state = {
   						profileinfo: [],
   					};
	}

	componentDidMount(){
		var _this = this;
    //var myHeaders = new Headers();
    //myHeaders.append("Authorization", "JWT eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyMiwidXNlcm5hbWUiOiJha29rc2FsIiwiZW1haWwiOiJha29rc2FsQGEuY29tIiwiZXhwIjoyNTA4Njc4OTE1fQ.PgPIJppA9u5umhrHGxPmv7_1Hi2ItASDgd7NH4DHcO0");
    var token = getCookie('token');
		fetch('http://52.90.34.144:85/api/profile', {
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization': 'JWT ' + token
          },
        	method: 'GET'
        })
    	.then(response => response.json())
    	.then(function(data){
    			console.log(data);
      		_this.setState({profileinfo: data});
      	})

		.catch(function(error) {
  			console.log('There has been a problem with your fetch operation: ' + error.message);
		});

    }

	render() {
		return(
			<div >
				<Navbar page={"profile"}/>
				<ProfilePage profileinfo={this.state.profileinfo}/>
			</div>
		);
	}
}

function getCookie(key) {
    var keyValue = document.cookie.match('(^|;) ?' + key + '=([^;]*)(;|$)');
    return keyValue ? keyValue[2] : null;
}
export default Profile;
