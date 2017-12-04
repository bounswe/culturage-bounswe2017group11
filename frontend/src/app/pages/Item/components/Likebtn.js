import React from 'react';
import $ from 'jquery';

class Like extends React.Component {
    constructor(props){
      super(props);
      this.state = {
         count: "",
         isLiked: ""
       };
      this.clickHandler = this.clickHandler.bind(this)

   }
   render() {
    console.log(this.props);
      return( 
        <div>
        <div class="likeContainer" >
        <a class="button">
        <i id="id1" ref="myComponentDiv" class={(this.state.isLiked) ? "fa fa-thumbs-o-up fa-6x text-info" : "fa fa-thumbs-o-up fa-6x text-muted"} aria-hidden="true"></i></a>
        <h3>{this.state.count} likes </h3>
        </div>
        </div>
      ); 
  }


  componentWillReceiveProps(nextProps){


    this.setState({
      count: nextProps.item.rate,
      isLiked: nextProps.item.is_rated
    });
  }

  componentWillMount(){
    console.log(this.props);
  }

  clickHandler() {
      var clk = this.state.count
      var add = 0;
      if(!this.state.isLiked && this.props.loginStatus == "1"){
        add = 1;
        this.setState({
          isLiked: true
        });

         var myHeaders = new Headers();

        var comment1 = {
        "rate" : 1
        };
        var url = "http://52.90.34.144:85/api/items/" + this.props.item.id + "/rates";
      //console.log(data);
      var token = getCookie('token');
      fetch(url,
      {

      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'JWT ' + token
      },

        method: 'POST',
        body: JSON.stringify(comment1)
      })

      .then(function(res){
        if(res.ok){
          alert("Item liked");
        } else {
          alert("Couldn't complete :(");
        }
      })
      .catch((error) => {
        console.error(error);
      })
      }
      else if(this.state.isLiked && this.props.loginStatus == "1"){
        add = -1;
        this.setState({
          isLiked: false
        });


         var myHeaders = new Headers();

        var comment1 = {
        "rate" : 0
        };
        var url = 'http://52.90.34.144:85/api/items/' + this.props.item.id + '/rates';
      //console.log(data);
      var token = getCookie('token');
      fetch(url,
      {

      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'JWT ' + token
      },

        method: 'POST',
        body: JSON.stringify(comment1)
      })

      .then(function(res){
        if(res.ok){
          alert("Item disliked");
        } else {
          alert("Couldn't complete :(");
        }
      })
      .catch((error) => {
        console.error(error);
      })
      }
      else{
          alert("Please login before :(");

      }

      this.setState({
        count: clk + add
      });
  }

  componentDidMount() {
    this.refs.myComponentDiv.addEventListener('click', this.clickHandler);
  }

}

function getCookie(key) {
    var keyValue = document.cookie.match('(^|;) ?' + key + '=([^;]*)(;|$)');
    return keyValue ? keyValue[2] : null;
}

export default Like;

