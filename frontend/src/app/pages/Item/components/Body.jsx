import React from 'react';
import '../utils/mycss.css';


class Body extends React.Component {
   constructor(props){
      super(props);
   }


   render() {
      let body;
    if(typeof this.props.item.tags != "undefined") {
      body=	<div class="containter-fluid">
      			<h1>{this.props.item.name}</h1>
               {this.props.item.tags.map(function(data){
                     return <a href={"/searchTag/" + data.name}><span class="badge badge-info">#{data.name}</span></a>
               })}
      			<hr />
            	<div class="img">
            	<img src={this.props.item.featured_img} class="cover"/>
            	</div>                    
            	<div class="jumbotron">
            		<p>{this.props.item.description}</p>
            	</div>
            </div>	
      } else {
         body = null;
      }      
      return (
            <div>
               {body}
            </div>
      )
   }
}


export default Body;
