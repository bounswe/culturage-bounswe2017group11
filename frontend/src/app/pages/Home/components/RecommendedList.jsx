import React from 'react';
import RecommendedListItem from "./RecommendedListItem.jsx"
import PropTypes from 'prop-types';

   /**
   *  Recommended List component. Contains Recommended List Item component. 
   */

export default class RecommendedList extends React.Component {
   static propTypes = {
      /** Reccommended Item List */
      recommended: PropTypes.array
    }
	render() {
      return (
         <div class="recommended-list">
            <h1>Recommended for you</h1>
            <hr/>
            {this.props.recommended.map(function(groupItem, key){ return (
               <RecommendedListItem item={groupItem} key={key}/>
            );})}
         </div>
      )
   }
}