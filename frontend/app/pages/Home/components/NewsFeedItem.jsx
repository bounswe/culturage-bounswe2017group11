import React from 'react';

class NewsFeedItem extends React.Component {
   constructor(props){
      super(props);

   }
	render() {
      let newsFeedItem;
         if(typeof this.props.item != "undefined") {
            newsFeedItem = <div class="newsfeed-item">
                              <div class="col-sm-6">
                                 <a href="#"><h1>{this.props.item.name}</h1></a>
                                 <h2>{this.props.item.created_at.substring(0, 10)} - {this.props.item.created_by.username}</h2>
                                 <p>{this.props.item.description.substring(0, 200)}...<a href="#">Read more..</a></p>
                                 
                              </div>
                              <div class="col-sm-6">
                                 <img src={this.props.item.featured_img}></img>
                              </div>
                           </div>
         } else {
            newsFeedItem = null
         }
         return (
            <div>
               {newsFeedItem}
            </div>
         )

      
   }
}


export default NewsFeedItem;