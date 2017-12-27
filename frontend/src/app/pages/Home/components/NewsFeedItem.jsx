import React from 'react';
import { Link } from 'react-router-dom';

import NewsFeedItemDesc from './NewsFeedItemDesc.jsx';

export default class NewsFeedItem extends React.Component {
   constructor(props){
      super(props);

   }

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
         <div class="newsfeed-item">
            <div class="col-sm-6">
               <Link to={"/item/" + this.props.item.id}>
                  <h1>{this.props.item.name}</h1>
               </Link>            
               <h2>{this.editDate(this.props.item.created_at)} - {this.props.item.created_by.username}</h2>
               <NewsFeedItemDesc description={this.props.item.description} id={this.props.item.id} />
            </div>
            <div class="col-sm-6">
               <Link to={"/item/" + this.props.item.id}>
                  <img src={this.props.item.featured_img}></img>
               </Link>
            </div>
         </div>
      )
   }
}

