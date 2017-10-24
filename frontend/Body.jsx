import React, { Component}  from 'react';
import request from 'superagent';
import _ from "lodash";
class Body extends React.Component {
   constructor(){
      super();
   }

   componentDidMount(){
      var myHeaders = new Headers();
      myHeaders.append("Authorization", "JWT eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyMiwidXNlcm5hbWUiOiJha29rc2FsIiwiZW1haWwiOiJha29rc2FsQGEuY29tIiwiZXhwIjoyNTA4Njc4OTE1fQ.PgPIJppA9u5umhrHGxPmv7_1Hi2ItASDgd7NH4DHcO0");

      fetch('http://18.220.108.135/api/items/5', {
         method: 'GET',
         headers: myHeaders
         }

      )
      .then(response => response.json())
      .then(function(data){
      		var name = data.name
      		 		

      })
      .catch(function(error) {
  			console.log('There has been a problem with your fetch operation: ' + error.message);
	});

      }

   render() {
      return (
      		<div class="containter-fluid">
      			<h1>{this.props.title}</h1>
      			<a href="#"><span class="badge badge-info mr-1">#cullture</span></a>
      			<a href="#"><span class="badge badge-info mr-1">#myheritage</span></a>
      			<a href="#"><span class="badge badge-info mr-1">#mustseen</span></a>
      			<hr />
            	<div class="img">
            	<br />
            	<img src={this.props.url} class="cover"/>
            	</div>                    
            	<div class="jumbotron">
            		<p>{this.props.description}</p>
            	</div>
            </div>	
      );
   }
}


export default Body;
