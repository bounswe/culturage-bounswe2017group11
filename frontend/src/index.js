import React from 'react';
import ReactDOM from 'react-dom';
import { BrowserRouter, Route, Switch } from 'react-router-dom';

import App from './App.js';
import Login from './app/pages/Login/Login.js';
import Home from './app/pages/Home/Home.js';
import Upload from './app/pages/ContactForm/Upload.js';
import Item from './app/pages/Item/Item.js';
import SearchTag from './app/pages/Search/Search.js';
import Profile from './app/pages/ProfilePage/Profile.js';

ReactDOM.render(
  <BrowserRouter>
  	<Switch>
    	<Route exact path="/" component={Home} />
    	<Route exact path="/login" component={Login} />
    	<Route exact path="/upload" component={Upload} />
    	<Route path="/item/:id" component={Item} />
    	<Route path="/searchTag/:tag" component={SearchTag} />
      <Route exact path="/profile" component={Profile} />

  	</Switch>
  </BrowserRouter>,
  document.getElementById('app')
);
