import React from 'react';
import { Link } from 'react-router-dom';
import PropTypes from 'prop-types';

	/**
	*	Newsfeed Item  Description component. 
	*/
export default class NewsFeedItemDesc extends React.Component {
	static propTypes = {
     	/** Description of the Newsfeed Item*/
     	description: PropTypes.string,
     	/** id of the Newsfeed Item*/
     	id: PropTypes.string
    }
	/**
	*	Shortens given text to 200 characters.
	*
	*	@param {string} text
	*	@public
	*/
	shorten(text){
		return text.substring(0, 200) + "...";
	}

	/**
	*	Edits given text into proper format.
	*	Shortens the text if necessary, to fit into description panel. 
	*
	*	@param {string} text
	*	@public
	*/
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
