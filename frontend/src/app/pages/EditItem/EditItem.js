import React from 'react';
import ReactDOM from 'react-dom';
import Navbar from '../Navbar/components/Navbar.jsx';
import ContactForm from './components/ContactForm.jsx';
import 'bootstrap/dist/css/bootstrap.min.css';
import './components/stylesEdit.css';

class EditItem extends React.Component {

	constructor(props){
   		super(props);
   		this.state = {item:"",
   		url:""
   		};


	}



 componentWillMount(){
        var token = getCookie('token');

        var myHeaders = new Headers();
        var url = 'http://52.90.34.144:85/api/items/' + this.props.match.params.itemId;
      myHeaders.append("Authorization", "JWT " + token);
      fetch(url, {
          method: 'GET',
          headers: myHeaders
        })
      .then(response => {
        return response.json() })
      .then((json) => {
          this.setState({item: json});
        })

    .catch(function(error) {
        console.log('There has been a problem with your fetch operation: ' + error.message);
    });


   }

	render() {
		if(this.state.item){

		return(
			<div>
				<Navbar page={"upload"}/>
				<ContactForm item={this.state.item.id} />
			</div>
		);
	}else{

		return(
			<div>
				Loading..
			</div>
		);
	}
}
}
function getCookie(key) {
    var keyValue = document.cookie.match('(^|;) ?' + key + '=([^;]*)(;|$)');
    return keyValue ? keyValue[2] : null;
}

export default EditItem;