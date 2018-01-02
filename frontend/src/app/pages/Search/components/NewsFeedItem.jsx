import React from 'react';
import { Link } from 'react-router-dom';
import PropTypes from 'prop-types';
import NewsFeedItemDesc from './NewsFeedItemDesc.jsx';

/**
 * Heritage item component in search result page. Contains item title, description and image.
 */
export default class NewsFeedItem extends React.Component {
   static propTypes = {
      /** Heritage item */
      item: PropTypes.object
    }
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
               <h2></h2>
               <NewsFeedItemDesc description={this.props.item.description} id={this.props.item.id} />
            </div>
            <div class="col-sm-6">
               <img src={this.props.item.featured_img}></img>
            </div>
         </div>
      )
   }
}

