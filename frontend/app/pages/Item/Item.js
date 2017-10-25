import React from 'react';
import ReactDOM from 'react-dom';
import Navbar from '../Home/components/Navbar.jsx';
import Body from './components/Body.jsx';
import Comment from './components/Comment.jsx';
import './utils/bootstrap.min.css';
import './utils/mycss.css';


class Item extends React.Component {
	constructor(props){
   		super(props);
   		this.state = {items: []};
	}

	componentDidMount(){
    var id = this.props.match.params.id;
    var link = 'http://18.220.108.135/api/items/' + id;
		var _this = this;
    	var myHeaders = new Headers();
    	myHeaders.append("Authorization", "JWT eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyMiwidXNlcm5hbWUiOiJha29rc2FsIiwiZW1haWwiOiJha29rc2FsQGEuY29tIiwiZXhwIjoyNTA4Njc4OTE1fQ.PgPIJppA9u5umhrHGxPmv7_1Hi2ItASDgd7NH4DHcO0");
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

    }

	render() {
		return(

			<div>
				<Navbar page={"home"} /> 
			   		<div class="container">
			   		   			<div class="col-md-8">


                  <Body item={this.state.items} />
                  </div>
                     			<div class="col-md-4">

                  <Comment item={this.state.items} />
                  </div>

                  </div>
			</div>
		);
	}
}



export default Item;