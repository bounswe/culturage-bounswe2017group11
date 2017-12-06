import React from 'react';
import TagsInput from 'react-tagsinput'
import 'react-tagsinput/react-tagsinput.css'

class ContactForm extends React.Component {
    constructor(props) {
        super(props);

        this.state = {
            selectedValue: 'media',
            file: '',
            imagePreviewUrl: ' ',
            name: '',
            description: '',
            location: '',
            day:'00',
            month:'00',
            year:'0000',
            image: '',
            tags: [],
            tag: '',
            isChecked: false,
        }
        this.handleSelectedChange = this.handleSelectedChange.bind(this);
        this.handleNameChange = this.handleNameChange.bind(this);
        this.handleDescriptionChange = this.handleDescriptionChange.bind(this);
        this.handleChangeTags =  this.handleChangeTags.bind(this);
        this.handleSubmit = this.handleSubmit.bind(this);
        this.handleClear = this.handleClear.bind(this);
        this.toggleChange = this.toggleChange.bind(this);

        this.handleYearChange = this.handleYearChange.bind(this);

        this.handleMonthChange = this.handleMonthChange.bind(this);

        this.handleDayChange =
        this.handleDayChange.bind(this);
    }

    toggleChange = () => {
      this.setState({
        isChecked: !this.state.isChecked,
      });
    }

    handleChangeTags(tags) {this.setState({tags});}

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


    handleClear(e) { e.preventDefault();window.location.replace("/upload");}

    // onChange handler saves subject to state
    handleNameChange(event){event.preventDefault();this.setState({name: event.target.value});};

    // onChange handler saves subject to state
    handleDescriptionChange(event){event.preventDefault();this.setState({description: event.target.value});};
    handleLocationChange(event){event.preventDefault();this.setState({location: event.target.value});};

    handleYearChange(event){event.preventDefault();this.setState({year: event.target.value});};

    handleMonthChange(event){event.preventDefault();  this.setState({month: event.target.value});};

    handleDayChange(event){event.preventDefault();  this.setState({day: event.target.value});};

    handleImageChange(event){event.preventDefault();this.setState({image: event.target.value});};
    handleTagsChange(event){event.preventDefault();this.setState({tags: event.target.value});};
    handleSelectedChange(event) {this.setState({selectedValue: event.target.value});}


    // Handler for the button/submit event
    handleSubmit(e){
      e.preventDefault();

      var myHeaders = new Headers();
      var yearValue = this.state.year;
      if(this.state.isChecked){
        yearValue = '-'+ yearValue;
      }
      var dateUpload = yearValue + '-' + this.state.month + '-' + this.state.day;

      console.log(dateUpload);

      var payload = {
        "name" : this.state.name,
        "description": this.state.description,
        "location": this.state.location,
        "date": dateUpload,
        "image": this.state.imagePreviewUrl,
        "tags": this.state.tags
      };

      console.log("PAYLOAD");
      console.log(payload);
      var token = getCookie('token');
      fetch('http://52.90.34.144:85/api/items/',
      {

      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'JWT ' + token
      },

        method: 'POST',
        body: JSON.stringify( payload )
      })

      .then(function(res){
        if(res.ok){
          window.location.replace("/");
        } else {
          alert("Couldn't upload");
        }
      })
      .catch((error) => {
        console.error(error);
      })
    };

    render() {

      let {imagePreviewUrl} = this.state;
      let $imagePreview = null;
      if (imagePreviewUrl) {
        $imagePreview = (<img src={imagePreviewUrl} />);
      } else {
        $imagePreview = (<div className="previewText">Please select an Image for Preview</div>);
      }

        return (

        <div className="container-fluid home-body">
          <div className="row newsfeed">
          <h1>Upload New Item</h1>
          <hr/>


            <div className="col-md-5" >
              <div className="previewComponent text-center">
                <form onSubmit={(e)=>this._handleSubmit(e)}>
                  <input className="fileInput"
                    type="file"
                    onChange={(e)=>this._handleImageChange(e)} />
                </form>
                <div className="imgPreview">
                  {$imagePreview}
                </div>
              </div>
            </div>

            <div className="col-md-6">
                <form className="form-horizontal" role="form">

                  <div className="form-group">
                    <label className="col-lg-3 control-label">Title:</label>
                    <div className="col-lg-8">
                      <input className="form-control"
                        type="text"
                        name="title"
                        ref="title"
                        value={ this.state.subject }
                        onChange={ this.handleNameChange }
                      required />
                    </div>
                  </div>

                  <div className="form-group">
                      <label className="col-lg-3 control-label">Description:</label>
                      <div className="col-lg-8">
                        <textArea className="form-control"
                          rows="8"
                          type="text"
                          name="description"
                          ref="description"
                          value={ this.state.subject }
                          onChange={ this.handleDescriptionChange }
                          required />
                      </div>
                  </div>

                  <div className="form-group">
                    <label className="col-lg-3 control-label">Date:</label>
                    <div className="col-lg-2">
                      <label>
                        <input type="checkbox"
                          checked={this.state.isChecked}
                          onChange={this.toggleChange}
                        />
                        BC
                      </label>
                    </div>
                    <div className="col-lg-2">
                      <input className="form-control"
                        type="number"
                        name="day"
                        ref="day"
                        min="1"
                        max="31"
                        placeholder="DD"
                        value={ this.state.subject }
                        onChange={ this.handleDayChange }
                      required />
                    </div>
                    <div className="col-lg-2">
                      <input className="form-control"
                        type="number"
                        name="month"
                        ref="month"
                        min="1"
                        max="12"
                        placeholder="MM"
                        value={ this.state.subject }
                        onChange={ this.handleMonthChange }
                      required />
                    </div>
                    <div className="col-lg-2">
                      <input className="form-control"
                        type="number"
                        name="year"
                        ref="year"
                        min="0"
                        max="3000"
                        placeholder="YYYY"
                        value={ this.state.subject }
                        onChange={ this.handleYearChange }
                      required />
                    </div>
                  </div>

                  <div className="form-group">
                    <label className="col-lg-3 control-label">Tags:</label>
                    <div className="col-lg-8">
                      <TagsInput value={this.state.tags} onChange={this.handleChangeTags} />
                    </div>
                  </div>

                  <div class="form-group">
        						<label class="col-md-3 control-label"></label>
        						<div class="col-md-8 classWithPad">
                      <button className="btn btn-primary custom"
                        onClick={ this.handleSubmit }>Submit</button>
                      <button className="btn btn-primary custom margin-left"
                        onClick={ this.handleClear }>Clear</button>
                    </div>
                  </div>
                </form>
            </div>
          </div>
        </div>
        );
    }
}

function getCookie(key) {
    var keyValue = document.cookie.match('(^|;) ?' + key + '=([^;]*)(;|$)');
    return keyValue ? keyValue[2] : null;
}
export default ContactForm;
