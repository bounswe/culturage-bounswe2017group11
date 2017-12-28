import React from 'react';
import '../utils/mycss.css';
import { Carousel } from 'react-responsive-carousel';
import styles from '../utils/carousel.min.css';
import $ from 'jquery';

function getCookie(key) {
    var keyValue = document.cookie.match('(^|;) ?' + key + '=([^;]*)(;|$)');
    return keyValue ? keyValue[2] : null;
}

var token = getCookie('token');
if(token == null){
    token = "JWT eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6ImhhbGlsa2Fsa2FuOTVAZ21haWwuY29tIiwidXNlcl9pZCI6MywiZXhwIjoxNTM3OTA1NDQ0LCJ1c2VybmFtZSI6ImhhbGlsIn0.hV0dPW3IsrqynXjwiycc5s25dtaReLP6J446soiwU2Y"
}else{
    token = "JWT " + token;
}

class Body extends React.Component {
   constructor(props){
      super(props);
      this.state = { showVideoTab: true};
   }
   componentDidMount(){
    $(document).ready(function() {
      $('.carousel-slider').click(function(e) {
        var offset = $(this).offset();
        var imgx = e.pageX - offset.left;
        imgx = parseInt(imgx);
        var imgy = e.pageY - offset.top;
        imgy = parseInt(imgy);
        var imgid = $(e.target).find('img').attr('image-id');
        console.log("IMAGE ID " + imgid);
        var annotation = prompt("Add annotation", "");
        var body = {
                "text": annotation,
                "x" : imgx,
                "y" : imgy,
                "w": 1,
                "h": 1
              };
        if(annotation){
          //alert(annotation);           
          $.ajax({
              url: "http://52.90.34.144:85/api/medias/" + imgid + "/annotations/",
              type: "post",
              headers: {
                "Content-Type" : "application/json",
                "Accept" : "application/json",
                "Authorization" : token
              },              
              data: JSON.stringify(body),
              success: function(res){
                console.log(res);
                window.location.reload();
              },
              error: function(err) {
                console.log(err);
                alert("Could not add annotation");
              }

          });
        }
      });
    });
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
            <Carousel showStatus={false} showArrows={true} emulateTouch={true}>
            
              {this.props.item.medias.slice(1).map(function(media){ return (
                <div class="img-wrapper">
                <img src={media.file_url} image-id={media.id}/>
                {media.annotations.map(function(anno){ 
                  var annoid = "pin-" + anno.id;
                  var style = {
                    top: anno.y,
                    left: anno.x
                  }                  
                  return (
                    <div id={annoid} class="box" style={style}>
                      <div class="pin-text">
                        <h3>{anno.text}</h3>
                      </div>
                    </div>   
                )})}             
            </div>
               )}
              )}
            </Carousel>
          </div>
        </div>
        :
				(this.props.item.medias[0].mediaType == "image") &&
        // Show images only        
				<Carousel showStatus={false} showArrows={true} emulateTouch={true}>
  				{this.props.item.medias.map(function(media){ return (
            <div class="img-wrapper">
                <img src={media.file_url} image-id={media.id}/>
                {media.annotations.map(function(anno){ 
                  var annoid = "pin-" + anno.id;
                  var style = {
                    top: anno.y,
                    left: anno.x
                  }                  
                  return (
                    <div id={annoid} class="box" style={style}>
                      <div class="pin-text">
                        <h3>{anno.text}</h3>
                      </div>
                    </div>   
                )})}             
            </div>
      	   )}
          )}
        </Carousel>
         : 
      	<div class="img">
      	<img src={this.props.item.featured_img} class="cover" />
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
