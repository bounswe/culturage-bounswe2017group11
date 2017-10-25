import React from 'react';
import ReactDOM from 'react-dom';
import Navbar from './Navbar.jsx';
import ContactForm from './ContactForm.jsx';
import './node_modules/bootstrap/dist/css/bootstrap.min.css';
import './styles.css';

ReactDOM.render(<Navbar />, document.getElementById('putNavbar'));
ReactDOM.render(<ContactForm />, document.getElementById('app'));
