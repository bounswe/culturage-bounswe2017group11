import React from 'react';
import ReactDOM from 'react-dom';
import Navbar from '../Home/components/Navbar.jsx';
import ContactForm from './components/ContactForm.jsx';
import 'bootstrap/dist/css/bootstrap.min.css';
import './components/styles.css';

class Upload extends React.Component {
	render() {
		return(
			<div>
				<Navbar/>
				<ContactForm />
			</div>
		);
	}
}

export default Upload;