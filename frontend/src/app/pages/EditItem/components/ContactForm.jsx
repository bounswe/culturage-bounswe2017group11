import React from 'react';
import { Tab, Tabs, TabList, TabPanel } from 'react-tabs';
import 'react-tabs/style/react-tabs.css';


class ContactForm extends React.Component {
    constructor(props) {
        super(props);

        this.state = {
            url:"",
            file: '',
            imagePreviewUrl: ' ',
            image: ''

        }

        this.handleSubmit = this.handleSubmit.bind(this);
        this.handleUrlChange = this.handleUrlChange.bind(this);
        this.handleSubmitImage = this.handleSubmitImage.bind(this);

    }

    _handleImageChange(e) {
      e.preventDefault();

      let reader = new FileReader();
      let file = e.target.files[0];

      reader.onloadend = () => {
        this.setState({
          file: file,
          imagePreviewUrl: reader.result
        });
      }

      reader.readAsDataURL(file)
    }

    handleImageChange(event){event.preventDefault();this.setState({image: event.target.value});};


  	handleUrlChange(event){this.setState({url: event.target.value});};

  	handleSubmitImage(e){
      e.preventDefault();

      var myHeaders = new Headers();
      var id = this.props.item;
      var url = 'http://52.90.34.144:85/api/items/' + id + '/medias';
      var formData  = new FormData();
      formData.append('file', this.state.file);
    
      var token = getCookie('token');
      fetch(url,
      {

      headers: {
        'Authorization': 'JWT ' + token
      },

        method: 'POST',
        body: formData
      })

      .then(function(res){
        if(res.ok){
          window.location.replace("/item/" + id);
        } else {
          alert("Couldn't upload");
        }
      })
      .catch((error) => {
        console.error(error);
      })
    };


    // Handler for the button/submit event
    handleSubmit(e){
      e.preventDefault();

      var myHeaders = new Headers();

      var formData  = new FormData();
      formData.append('url', this.state.url);
      var id = this.props.item;
      var url = 'http://52.90.34.144:85/api/items/' + id + '/medias';

      var token = getCookie('token');
      fetch(url,
      {

      headers: {
        'Authorization': 'JWT ' + token
      },

        method: 'POST',
        body: formData
      })

      .then(function(res){
        if(res.ok){
          window.location.replace("/item/" + id);
        } else {
          alert("Couldn't upload");
        }
      })
      .catch((error) => {
        console.error(error);
      })
    };

    render() {

      let form = "";
      let {imagePreviewUrl} = this.state;
      let $imagePreview = null;
      if (imagePreviewUrl) {
        $imagePreview = (<img src={imagePreviewUrl} />);
      } else {
        $imagePreview = (<div className="previewText">Please select an Image for Preview</div>);
      }
      if(typeof this.props.item !="undefined"){
        form = <div class="mycontainer"> <Tabs>
    				<TabList>
      					<Tab>Video</Tab>
      					<Tab>Image</Tab>
    			</TabList>

    			<TabPanel>
    			<div class = "col-md-4">
    				<div class="form-horizontal">

        				<div class="form-group">
                		<label for="url">Youtube url:</label>
                		</div>
                		<div class="form-group">
  						<input type="text" id="url" class="form-control" placeholder="Url" aria-describedby="basic-addon1" value = {this.state.url} onChange={ this.handleUrlChange}/>
  						</div>
  						<div class="form-group">
                      	<button class="btn btn-primary"
                        onClick={ this.handleSubmit }>Submit video</button>
                        </div>
                        </div>

            		</div>
    			</TabPanel>
    			<TabPanel>
    			   	  <div class="form-horizontal">

                  		<input class="fileInput2"
                    		type="file"
                    		onChange={(e)=>this._handleImageChange(e)} />
                		<div class="imgPreview2">
                  		{$imagePreview}
                		</div>

                      <button className="btn btn-primary"
                        onClick={ this.handleSubmitImage }>Submit Image</button>
                    </div>
    		</TabPanel>
  		</Tabs>
  		</div>

    }
	return(
		<div>
			{form}
		</div>
		);
    }
}

function getCookie(key) {
    var keyValue = document.cookie.match('(^|;) ?' + key + '=([^;]*)(;|$)');
    return keyValue ? keyValue[2] : null;
}
export default ContactForm;
