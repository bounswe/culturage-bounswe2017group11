import React from 'react';
import { Link } from 'react-router-dom';

import NewsFeedItemDesc from './NewsFeedItemDesc.jsx';

export default class NewsFeedItem extends React.Component {
   constructor(props){
      super(props);

   }
	render() {
      return (
         <div class="newsfeed-item">
            <div class="col-sm-6">
               {console.log("In item page: ", this.props.item)}
               <Link to={"/item/" + this.props.item.id}>
                  <h1>{this.props.item.name}</h1>
               </Link>            
               <h2>{this.props.item.created_at.substring(0, 10)} - {this.props.item.created_by.username}</h2>
               <NewsFeedItemDesc description={this.props.item.description} id={this.props.item.id} />
            </div>
            <div class="col-sm-6">
               <img src={this.props.item.featured_img}></img>
            </div>
         </div>
      )
   }
}

