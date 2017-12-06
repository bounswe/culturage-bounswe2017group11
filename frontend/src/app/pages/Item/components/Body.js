import React from 'react';
import '../utils/mycss.css';
import { Carousel } from 'react-responsive-carousel';
import styles from '../utils/carousel.min.css'


class Body extends React.Component {
   constructor(props){
      super(props);
      this.state = { showVideoTab: true};
   }


   render() {
    const showVideoTab = this.state.showVideoTab;
    let body;
    if(typeof this.props.item.tags != "undefined") {
      body=<div class="containter-fluid">
      			<h1>{this.props.item.name}</h1>
              {this.props.item.tags.map(function(data){
                return <a href={"/searchTag/" + data.name}>
                <span class="badge badge-info">#{data.name}</span></a>
              })}
      			<hr/>
      {(this.props.item.medias != "") ?
      (this.props.item.medias[0].mediaType == "video") ?
        // Show videos and images in seperate tabs
        <div class="media-tabs">
          <div class="tab-buttons">
            <button class="btn video-tab-button" style={{"background-color":(showVideoTab ? '#5bc0de':'#6ec1e09e')}} onClick={() => this.setState({ showVideoTab: true })}>Videos</button>
            <button class="btn image-tab-button" style={{"background-color":(!showVideoTab ? '#5bc0de':'#6ec1e09e')}} onClick={() => this.setState({ showVideoTab: false })}>Images</button>
          </div>
          <div class="item-video-tab" style={{display:(showVideoTab ? 'block' : 'none')}}>
            <div class="embed-responsive embed-responsive-16by9">
            <iframe class="embed-responsive-item" src={"https://www.youtube.com/embed/" + this.props.item.medias[0].url.substring(32)} frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe></div> 
          </div>
          <div class="item-image-tab" style={{display:(!showVideoTab ? 'block' : 'none')}}>
            <Carousel showStatus={false}>
              <div>
                  <img src={this.props.item.featured_img} />
              </div>
              {this.props.item.medias.map(function(media){ return (
                <div>
                    <img src={media.file_url} />
                </div>
               )}
              )}
            </Carousel>
          </div>
        </div>
        :
				(this.props.item.medias[0].mediaType == "image") &&
        // Show images only        
				<Carousel showStatus={false}>
          <div>
              <img src={this.props.item.featured_img} />
          </div>
  				{this.props.item.medias.map(function(media){ return (
            <div>
                <img src={media.file_url} />
            </div>
      	   )}
          )}
        </Carousel>
         : 
      	<div class="img">
      	<img src={this.props.item.featured_img} class="cover"/>
      	</div> }


      	<div class="jumbotron">
      		<p>{this.props.item.description}</p>

      	</div>
      </div>	
      } else {
         body = null;
      }      
      return (
            <div>
               {body}
            </div>
      )
   }
}


export default Body;
