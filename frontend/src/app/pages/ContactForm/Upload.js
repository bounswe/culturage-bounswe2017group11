import React from 'react';
import ReactDOM from 'react-dom';
import Navbar from '../Navbar/components/Navbar.jsx';
import ContactForm from './components/ContactForm.jsx';
import 'bootstrap/dist/css/bootstrap.min.css';
import './components/styles.css';

/**
 * Upload page component. Contains item upload form. 
 */
class Upload extends React.Component {
	render() {
		return(
			<div>
				<Navbar page={"upload"}/>
				<ContactForm />
			</div>
		);
	}
}

export default Upload;