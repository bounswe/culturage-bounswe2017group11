import React from 'react';
import ReactDOM from 'react-dom';
import Navbar from '../Navbar/components/Navbar.jsx';
import Body from './components/Body.jsx';
import Comment from './components/Comment.js';
import Like from './components/Likebtn.js';
import 'bootstrap/dist/css/bootstrap.min.css';
import './utils/font-awesome-4.7.0/css/font-awesome.css';
import SuggestedItems from './components/SuggestedItems.js';


import './utils/mycss.css';
import $ from 'jquery';

class Item extends React.Component {
	constructor(props){
   		super(props);
   		this.state = {items: [],
   			suggestedItems: []
   		};
	}

	componentWillMount(){
    var id = this.props.match.params.id;
    var link = 'http://52.90.34.144:85/api/items/' + id;
		var _this = this;
    	var myHeaders = new Headers();
    	var token = "JWT " + getCookie('token');


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
      		console.log(data)
      	})

		.catch(function(error) {
  			console.log('There has been a problem with your fetch operation: ' + error.message);
		});

    }

	render() {
		if(this.state.items){
		return(

			<div>
				<Navbar/> 
			   		<div class="mycontainer">
			   		   			<div class="col-md-8">


                  <Body item={this.state.items} />
                  <SuggestedItems item={this.state.suggestedItems} />

                  </div>
                     			<div class="col-md-4">
                  <Like item={this.state.items} />
                  <Comment item={this.state.items} />
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