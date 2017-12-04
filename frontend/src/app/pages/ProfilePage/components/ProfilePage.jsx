import React from 'react';
import DatePicker from 'react-datepicker';
import moment from 'moment';
import 'react-datepicker/dist/react-datepicker.css';
import 'bootstrap/dist/css/bootstrap.min.css';
import './style.css'

class ProfilePage extends React.Component {
	constructor(props) {
		super(props);
		this.state = {
			username: props.profileinfo.username,
			fullname: props.profileinfo.fullName,
			email: props.profileinfo.email,
			imagePreviewUrl: props.profileinfo.photo,
			birthday : props.profileinfo.birthday
		}

		this.handleDateChange = this.handleDateChange.bind(this);
		this.handleChange = this.handleChange.bind(this);
		this.handleSubmit = this.handleSubmit.bind(this);
		this.handleClear = this.handleClear.bind(this);
		{console.log("MOMENT")};
		{console.log(moment())};
		{console.log("BIRTHDAY")};
		{console.log(this.props.profileinfo)};
	}

	handleClear(e) { e.preventDefault();window.location.replace("/profile");};

	handleDateChange(date){this.setState({birthday: date});};

	handleChange(event) {
		event.preventDefault();
		if(event.target.id == "username"){
			this.setState({username: event.target.value});
		} else if(event.target.id == "fullname"){
			this.setState({fullname: event.target.value});
		} else {
			this.setState({email: event.target.value});
		}
	}

	handleSubmit(e){
		e.preventDefault();

		var myHeaders = new Headers();

		var payload = {
			"email" : this.state.email,
			"photo" : this.state.imagePreviewUrl,
			"fullName": this.state.fullname,
			"location": this.props.profileinfo.location,
		};

		var token = getCookie('token');
		fetch('http://52.90.34.144:85/api/profile',
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

	render() {

		let {imagePreviewUrl} = this.state;
		let $imagePreview = null;
		if (imagePreviewUrl) {
			var url = imagePreviewUrl;
			$imagePreview = (<img src = {url} className = "avatar img-circle" alt ="avatar"  width="200" height="200"/>);
		} else if(this.props.profileinfo.photo){
			var url = '//' + this.props.profileinfo.photo;
			$imagePreview = (<img src = {url} className = "avatar img-circle" alt ="avatar"  width="200" height="200"/>);
		}else{
			$imagePreview = (<img src="//placehold.it/100" className = "avatar img-circle" alt ="avatar"  width="200" height="200"/>);
		}

		return(
		<div className="container-fluid">
	    <h1>Edit Profile</h1>
	  	<hr/>
			<div className="row">

				<div className="col-md-4">
					<div className="text-center">
						 {$imagePreview}
						<h6>Upload a different photo...</h6>

						<form onSubmit={(e)=>this._handleSubmit(e)}>
							<input className="form-control"
								type="file"
								onChange={(e)=>this._handleImageChange(e)} />
						</form>

					</div>
				</div>

				<div className="col-md-8 personal-info">

				<h3>Personal info</h3>
				<form className="form-horizontal" role="form">

					<div className="form-group">
						<label className="col-lg-3 control-label">Username:</label>
						<div className="col-lg-8">
							<input className="form-control"
								type="text" id="username" onChange={this.handleChange} placeholder={this.props.profileinfo.username}
								  />
						</div>
					</div>

					<div className="form-group">
						<label className="col-lg-3 control-label">Full Name:</label>
						<div className="col-lg-8">
							<input className="form-control"
								type="text"
								placeholder={this.props.profileinfo.fullName}
								id="fullname"
								name="title"
								ref="title"
								onChange={ this.handleChange }
									/>
						</div>
					</div>

					<div className="form-group">
						<label className="col-lg-3 control-label">Email:</label>
						<div className="col-lg-8">
							<input className="form-control"
								type="text"
								placeholder={this.props.profileinfo.email}
								id="email"
								name="title"
								ref="title"
								onChange={ this.handleChange }
									/>
						</div>
					</div>

					<div className = "form-group">
						<label className="col-lg-3 control-label">Birthday:</label>
						<DatePicker
							dateFormat="YYYY-MM-DD"
							selected={this.state.birthday}
							onChange={this.handleDateChange} />
					</div>

					<div class="form-group">
						<label class="col-md-3 control-label"></label>
						<div class="col-md-8">
							<button className="btn btn-primary custom"
								onClick={ this.handleSubmit }>Submit</button>
							<span></span>
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
};

function getCookie(key) {
    var keyValue = document.cookie.match('(^|;) ?' + key + '=([^;]*)(;|$)');
    return keyValue ? keyValue[2] : null;
}
export default ProfilePage
