import React from 'react';
import { Link } from 'react-router-dom';

class NewsFeedItem extends React.Component {
   constructor(props){
      super(props);

   }
	render() {
      let newsFeedItem;
         if(typeof this.props.item != "undefined") {
            newsFeedItem = <div class="newsfeed-item">
                              <div class="col-sm-6">
                                <Link to={"/item/" + this.props.item.id}>
                                    <h1>{this.props.item.name}</h1>
                                </Link>
                                 
                                 <h2>{this.props.item.created_at.substring(0, 10)} - {this.props.item.created_by.username}</h2>
                                 <p>{this.props.item.description.substring(0, 200)}...<a href="#">Read more..</a></p>
                                 
                              </div>
                              <div class="col-sm-6">
                                 <img src={this.props.item.featured_img}></img>
                              </div>
                           </div>
         } else {
            newsFeedItem = null
         }
         return (
            <div>
               {newsFeedItem}
            </div>
         )

      
   }
}


export default NewsFeedItem;