import React from 'react';

import NewsFeedItem from './NewsFeedItem.jsx';

/**
 * Search Results component. Contains heritage item list.
 */

export default class NewsFeed extends React.Component {
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

