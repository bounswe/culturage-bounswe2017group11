import React from 'react';
import { Link } from 'react-router-dom';
import PropTypes from 'prop-types';

    /**
   *  Recommended List Item component. 
   * Recommended List Item contains image, title, creation date, number of likes and number of comments of the item.
   */

export default class RecommendedListItem extends React.Component {
    static propTypes = {
        /** Recommended List Item */
        item: PropTypes.object
    }

    /**
    * Converts given date string to desired format. 
    *
    * @param {string} date
    * @public
    */

  editDate(date){
        var year = date.substring(0,4)
        var month = date.substring(5,7)
        var day = date.substring(8,10)
        if(month=="01") month = "January"
        else if(month=="02") month = "February"
        else if(month=="03") month = "March"
        else if(month=="04") month = "April"
        else if(month=="05") month = "May"
        else if(month=="06") month = "June"
        else if(month=="07") month = "July"
        else if(month=="08") month = "August"
        else if(month=="09") month = "September"
        else if(month=="10") month = "October"
        else if(month=="11") month = "November"
        else if(month=="12") month = "December"
        var edited = new String(day + " " + month + " " + year)
        return edited
    }
	render() {
      	return (
            <Link to={"/item/" + this.props.item.id}>
        	    <div class="recommended-list-item">
        			  <div class="col-sm-6">
                  <img src={this.props.item.featured_img}></img>
                </div>
        		    <div class="col-md-6 recommended-list-item-desc">
        				  <h2>{this.props.item.name}</h2>
                        <p>
	        			    {this.editDate(this.props.item.created_at)} <br/>
	        			    <i class="fa fa-comment-o" aria-hidden="true">{this.props.item.comment_count}</i> &nbsp;
	        			    <i class="fa fa-thumbs-o-up" aria-hidden="true">{this.props.item.rate}</i>
                        </p>
                    </div>
                </div>
            </Link>
      	)
   	}
}