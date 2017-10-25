import React from 'react';
import ReactDOM from 'react-dom';
import { BrowserRouter, Route, Switch } from 'react-router-dom';

import App from './App.js';
import Login from './app/pages/Login/Login.js';
import Home from './app/pages/Home/Home.js';
import Upload from './app/pages/ContactForm/Upload.js';

ReactDOM.render(
  <BrowserRouter>
  	<Switch>
    	<Route exact path="/" component={Home} />
    	<Route exact path="/login" component={Login} />
    	<Route exact path="/upload" component={Upload} />
  	</Switch>
  </BrowserRouter>,
  document.getElementById('app')
);
