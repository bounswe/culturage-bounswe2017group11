import React from 'react';
import { Link } from 'react-router-dom';

export default class RecommendedListItem extends React.Component {
	render() {
      	return (
        	<div class="recommended-list-item">
        		<Link to={"/item/" + this.props.item.id}>
        			<img class="col-sm-6" src={this.props.item.featured_img}></img>
        		</Link>
        		<div class="col-md-6 recommended-list-item-desc">
        			<Link to={"/item/" + this.props.item.id}>
        				<h2>{this.props.item.name}</h2>
        			</Link>
        			<p>
	        			{this.props.item.created_at.substring(0, 10)} <br/>
	        			<i class="fa fa-comment-o" aria-hidden="true">{this.props.item.comment_count}</i> &nbsp;
	        			<i class="fa fa-thumbs-o-up" aria-hidden="true">{this.props.item.rate}</i>
	        		</p>
        		</div>
        	</div>
      	)
   	}
}