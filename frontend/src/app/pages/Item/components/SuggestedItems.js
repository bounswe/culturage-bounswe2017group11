import React from 'react';
import $ from 'jquery';

class SuggestedItems extends React.Component {
    constructor(props){
      super(props);
      this.state = {
        myComment: ''
      }
   }

   componentDidMount(){
  
   }


   render() {
   let body;
   if(typeof this.props.item != "undefined") {
    body = <div>
          	<h1>Suggested Items</h1>
      			<hr />

            <div class="row">

    	{this.props.item.slice(0,8).map(function(myItem){ return (
    		  <div class="col-md-3">
    		      		<a href={"/item/" + myItem.id}>

    		    <div class="thumb">
    		    <img class = "cover" src={myItem.featured_img}/>
    		    <div>
    		    <h4>{myItem.name}</h4>
    		    <p>{(myItem.description == "") ? <i>No description</i> : myItem.description.substring(0,20)}</p>

    		    </div>
    		    </div>
    		        		 </a>     

    		      </div>
        );})}
</div>



        

    </div> 
} else{
    body = null;
}
      return (
      <div>
            {body}
        </div>
      );
   }
}

function getCookie(key) {
    var keyValue = document.cookie.match('(^|;) ?' + key + '=([^;]*)(;|$)');
    return keyValue ? keyValue[2] : null;
}

export default SuggestedItems;

