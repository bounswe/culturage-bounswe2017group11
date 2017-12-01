import React from 'react';

import DatePicker from 'react-datepicker';
import moment from 'moment';
import 'react-datepicker/dist/react-datepicker.css';

class ProfilePage extends React.Component {
	constructor(props) {
		super(props);
		this.state = {
			profileinfo : props.profileinfo,
			birthday : moment(),
			email : props.profileinfo.email,
			fullname: props.profileinfo.fullname,
			location: props.profileinfo.location,
			photo: props.profileinfo.photo,
			username: props.profileinfo.username

		}
		this.handleDateChange = this.handleDateChange.bind(this);
		this.handleChange = this.handleChange.bind(this);
		this.handleSubmit = this.handleSubmit.bind(this);
		this.handleClear = this.handleClear.bind(this);
		{console.log(this.props.profileinfo)}
	}

	handleDateChange(date){this.setState({birthday: date});};


	handleClear(e) { e.preventDefault();window.location.replace("/upload");};

	handleChange(event) {
		event.preventDefault();
		if(event.target.id == "username"){
			this.setState({username: event.target.value});
		} else if(event.target.id == "fullname"){
			this.setState({password: event.target.value});
		} else if(event.target.id == "email"){
			this.setState({password: event.target.value});
		}else if(event.target.id == "location"){
			this.setState({password: event.target.value});
		}
	}

	handleSubmit(e){
		e.preventDefault();

		var myHeaders = new Headers();

		var payload = {
			"birthday" : this.state.birthday,
			"email": this.state.email,
			"fullname": this.state.fullname,
			"location": this.state.location,
			"photo": this.props.profileinfo.photo,
			"username": this.state.username
		};

		//console.log(data);
		var token = getCookie('token');
		fetch('http://18.220.108.135/api/auth/register',
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

		return(
			<div className="App">
				<Image src={this.props.profileinfo.photo} />
				<Profile profileinfo = {this.props.profileinfo}/>
			</div>
		);
	}
};

class Image extends React.Component{
	render() {
		return (
		<div class="col-md-6">
			<div className = "imgPreview">
						<img src={this.props.src}></img>
			</div>
		</div>
		);
	}
};

class Profile extends React.Component{
	render() {
		return (
		<div class="col-md-5">
			<form >
			<div className="form-group">
			<label id="titleID">Username:</label>
				<input className="form-control"
					type="text" id="username" onChange={this.handleChange} placeholder={this.props.profileinfo.username}
					  />
			</div>
			<div className="form-group">
			<label id="titleID">Full Name:</label>
				<input className="form-control"
					type="text"
					placeholder={this.props.profileinfo.fullname}
					id="fullname"
					name="title"
					ref="title"
					onChange={ this.handleChange }
						/>
			</div>
			<div className="form-group">
				<label id="titleID">Email:</label>
				<input className="form-control"
					type="text" 	id="email"
					placeholder={this.props.profileinfo.email}
					onChange={ this.handleChange }
						/>
			</div>
			<div>
			<DatePicker
				dateFormat="YYYY-MM-DD"
				selected={this.state.birthday}
				onChange={this.handleDateChange} />
			</div>
				<button className="btn btn-primary custom"
					onClick={ this.handleSubmit }>Submit</button>
					<button className="btn btn-primary custom margin-left"
						onClick={ this.handleClear }>Clear</button>
			</form>
		</div>
		);
	}
};
function getCookie(key) {
    var keyValue = document.cookie.match('(^|;) ?' + key + '=([^;]*)(;|$)');
    return keyValue ? keyValue[2] : null;
}
export default ProfilePage
