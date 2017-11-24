import React from 'react';
import RecommendedListItem from "./RecommendedListItem.jsx"

export default class RecommendedList extends React.Component {
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