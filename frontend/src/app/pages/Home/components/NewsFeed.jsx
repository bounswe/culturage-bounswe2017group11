import React from 'react';
import PropTypes from 'prop-types';
import NewsFeedItem from './NewsFeedItem.jsx';

/**
 * Newsfeed component. Contains newsfeed items. 
 */
export default class NewsFeed extends React.Component {
	static propTypes = {
     	/** Newsfeed Item list */
      	itemlist: PropTypes.array
    }
	render() {
      return (
         <div class = "newsfeed">
            {this.props.itemlist.map(function(groupItem, key){ return (
               <NewsFeedItem item={groupItem} key={key}/>
            );})}
         </div>
      )
   }
}

