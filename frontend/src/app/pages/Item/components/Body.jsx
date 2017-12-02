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

               {(this.props.item.medias != "") ? (this.props.item.medias[0].extension == "youtube") && 
         <div class="embed-responsive embed-responsive-16by9">

               <iframe class="embed-responsive-item" src={"https://www.youtube.com/embed/" + this.props.item.medias[0].url.substring(32)} frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe></div> : 
            	<div class="img">
            	<img src={this.props.item.featured_img} class="cover"/>
            	</div> }                    
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
