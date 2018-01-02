import React from 'react';
import $ from 'jquery';
import PropTypes from 'prop-types';

/**
 *  Component for showing suggested items relative to the item being shown.
 *  
 *  Takes the suggested item as props. Renders its picture and link.
 */
class SuggestedItems extends React.Component {
  static propTypes = {
         /** Suggested items list */
         item: PropTypes.array
    }
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


    	{this.props.item.slice(0,8).map(function(myItem){ return (
    		      		<a href={"/item/" + myItem.id}>

    		    <div class="thumb">
    		    <img class = "cover" src={myItem.featured_img}/>
    		    <div>
    		    <h5><strong>{myItem.name}</strong></h5>
    		    <p>{(myItem.description == "") ? <i>No description</i> : myItem.description}</p>
    		    <i class="fa fa-thumbs-up">&nbsp;{myItem.rate}</i>&nbsp;<i class="fa fa-comment">&nbsp;{myItem.comment_count}</i>

    		    </div>
    		    </div>
    		        		 </a>     

        );})}



        

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

