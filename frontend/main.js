import React from 'react';
import ReactDOM from 'react-dom';
import { BrowserRouter, Route, Switch } from 'react-router-dom';

import App from './App.js';
import Login from './app/pages/Login/Login.js';
import Home from './app/pages/Home/Home.js';

ReactDOM.render(
  <BrowserRouter>
  	<Switch>
    	<Route exact path="/" component={Home} />
    	<Route exact path="/login" component={Login} />
  	</Switch>
  </BrowserRouter>,
  document.getElementById('app')
);
