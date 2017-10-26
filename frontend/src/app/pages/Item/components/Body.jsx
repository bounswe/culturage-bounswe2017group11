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
      			<a href="#"><span class="badge badge-info">#cullture</span></a>
      			<a href="#"><span class="badge badge-info">#myheritage</span></a>
      			<a href="#"><span class="badge badge-info">#mustseen</span></a>
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
