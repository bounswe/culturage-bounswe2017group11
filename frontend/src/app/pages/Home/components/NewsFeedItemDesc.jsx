import React from 'react';
import { Link } from 'react-router-dom';

export default class NewsFeedItemDesc extends React.Component {
	shorten(text){
		return text.substring(0, 200) + "...";
	}
	organize(text){
		if(text.length > 200){
			text = this.shorten(text)
		}
		if(text.length == 0){
			text = <i>No description</i>
		}
		return text;
	}
	render() {
    	return (
    		<p>{this.organize(this.props.description)}<Link to={"/item/" + this.props.id}> Show More</Link></p>
    	)
    }
}
