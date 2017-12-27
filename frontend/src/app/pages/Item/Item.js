import React from 'react';
import ReactDOM from 'react-dom';
import Navbar from '../Navbar/components/Navbar.jsx';
import Body from './components/Body.js';
import Comment from './components/Comment.js';
import Like from './components/Likebtn.js';
import 'bootstrap/dist/css/bootstrap.min.css';
import './utils/font-awesome-4.7.0/css/font-awesome.css';
import SuggestedItems from './components/SuggestedItems.js';
import ItemMap from './components/Map.jsx';


import './utils/mycss.css';
import $ from 'jquery';

class Item extends React.Component {
	constructor(props){
   		super(props);
   		this.state = {items: [],
   			suggestedItems: [],
            loggedIn:"",
            templocation: {
                name: "Bebek Mahallesi, Boğaziçi University, Beşiktaş/Istanbul, Turkey",
                lat: 41.0847571,
                lon: 29.051039899999978
            }
   		};
	}

	componentDidMount(){

        var id = this.props.match.params.id;
        var link = 'http://52.90.34.144:85/api/items/' + id;
		var _this = this;
    	var myHeaders = new Headers();
    	var token = getCookie('token');
        if(token == null){
            token = "JWT eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6ImhhbGlsa2Fsa2FuOTVAZ21haWwuY29tIiwidXNlcl9pZCI6MywiZXhwIjoxNTM3OTA1NDQ0LCJ1c2VybmFtZSI6ImhhbGlsIn0.hV0dPW3IsrqynXjwiycc5s25dtaReLP6J446soiwU2Y"
        }else{
            token = "JWT " + token;
            this.setState({loggedIn: 1});
        }     


    	myHeaders.append("Authorization", token);
    	fetch(link , {
        	method: 'GET',
        	headers: myHeaders
        })
    	.then(response => response.json())
    	.then(function(data){
      		_this.setState({items: data});
      		console.log(data)
      	})

		.catch(function(error) {
  			console.log('There has been a problem with your fetch operation: ' + error.message);
		});

        var link2 = 'http://52.90.34.144:85/api/recommendation/item/' + id;
		fetch(link2 , {
        	method: 'GET',
        	headers: myHeaders
        })
    	.then(response => response.json())
    	.then(function(data){
      		_this.setState({suggestedItems: data});
      	})

		.catch(function(error) {
  			console.log('There has been a problem with your fetch operation: ' + error.message);
		});

    }

	render() {
		if(this.state.items.name){
    		return(
    			<div>
    				<Navbar/> 
                    <div class="mycontainer">
                        <div class="col-md-8">
                            <Body item={this.state.items} />
                            <SuggestedItems item={this.state.suggestedItems}/>
                        </div>
                        <div class="col-md-4">
                            <Like item={this.state.items} loginStatus={this.state.loggedIn} />
                            <Comment item={this.state.items} loginStatus={this.state.loggedIn}/>
                            {console.log(this.state)}
                            {this.state.items.timelines!=null ? this.state.items.timelines.map(function(timeLine, key){
                                if(timeLine.location!=null)
                                    return(<ItemMap location = {timeLine.location} key={key} />)
                            })                  
                            : ""}
                        </div>
                    </div>
    			</div>
    		);
        }
        else{
			return(<div>Loading..</div>);
		}
	}
}

function getCookie(key) {
    var keyValue = document.cookie.match('(^|;) ?' + key + '=([^;]*)(;|$)');
    return keyValue ? keyValue[2] : null;
}


export default Item;