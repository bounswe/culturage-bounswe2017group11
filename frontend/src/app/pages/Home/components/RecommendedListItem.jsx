import React from 'react';

export default class RecommendedListItem extends React.Component {
	render() {
      	return (
        	<div class="recommended-list-item">
                <h2>{this.props.item.name}</h2>
                This is the description blah blah blah
        	</div>
      	)
   	}
}