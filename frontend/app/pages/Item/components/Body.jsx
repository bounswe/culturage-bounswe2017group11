import React from 'react';
import '../utils/mycss.css';


class Body extends React.Component {
   constructor(props){
      super(props);
   }


   render() {
      let body;
      body=	<div class="containter-fluid">
      			<h1>{this.props.item.name}</h1>
      			<a href="#"><span class="badge badge-info mr-1">#cullture</span></a>
      			<a href="#"><span class="badge badge-info mr-1">#myheritage</span></a>
      			<a href="#"><span class="badge badge-info mr-1">#mustseen</span></a>
      			<hr />
            	<div class="img">
            	<br />
            	<img src={this.props.item.featured_img} class="cover"/>
            	</div>                    
            	<div class="jumbotron">
            		<p>{this.props.item.description}</p>
            	</div>
            </div>	
      return (
            <div>
               {body}
            </div>
      )
   }
}


export default Body;
