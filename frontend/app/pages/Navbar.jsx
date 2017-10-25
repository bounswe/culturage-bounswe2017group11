import React from 'react';

class Navbar extends React.Component {
   render() {
      	return (
      		<section navBar className="navbar navbar-default">
      			<div class="container-fluid">
      				<div class="navbar-header">
      					<a class="navbar-brand" href="#"><span class="glyphicon glyphicon-fire"></span></a>
   					</div>
   					<div class="collapse navbar-collapse" id="myNavbar">
   						<ul class="nav navbar-nav">
   							<li class="active"><a href="#">Home</a></li>
        					<li><a href="#">Popular</a></li>
        					<li><a href="#">Add an Item</a></li>
   						</ul>
   						<div class="col-sm-3 col-md-3">
   							<form class="navbar-form" role="search">
   								<div class="input-group">
   									<input type="text" class="form-control" placeholder="Search" name="q"></input>
   									<div class="input-group-btn">
              				<button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
            				</div>
   								</div>
   							</form>
   						</div>
   						<ul class="nav navbar-nav navbar-right">
       						<li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      					</ul>
   					</div>
      			</div>
      		</section>

        );
    }
}

export default Navbar;
