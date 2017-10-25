import React from 'react';
import ReactDOM from 'react-dom';
import Navbar from './components/Navbar.jsx';
import Body from './components/Body.jsx';
import Comment from './components/Comment.jsx';
import 'bootstrap/dist/css/bootstrap.min.css';
import './utils/mycss.css';


class Item extends React.Component {
	constructor(){
   		super();
   		this.state = {items: []};
	}

	componentDidMount(){
		var _this = this;
    	var myHeaders = new Headers();
    	myHeaders.append("Authorization", "JWT eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyMiwidXNlcm5hbWUiOiJha29rc2FsIiwiZW1haWwiOiJha29rc2FsQGEuY29tIiwiZXhwIjoyNTA4Njc4OTE1fQ.PgPIJppA9u5umhrHGxPmv7_1Hi2ItASDgd7NH4DHcO0");
    	fetch('http://18.220.108.135/api/items/5', {
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

    }

	render() {
		return(
			<div>  
                  <Navbar page={"home"} />
                  <Body item={this.state.items} />
                  <Comment item={this.state.items} />

                  
			</div>
		);
	}
}



export default Item;