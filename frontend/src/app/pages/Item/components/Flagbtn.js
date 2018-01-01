import React from 'react';
import $ from 'jquery';

/*
 *  Component for the flag button of an item.
 */
class Flag extends React.Component {
    constructor(props){
      super(props);
      this.state = {
         count: "",
         isFlagged: ""
       };
      this.clickHandler = this.clickHandler.bind(this)

   }
   render() {
      return(
        <div>
        <div class="likeContainer" >
        <a class="button">
        <i id="id1" ref="myComponentDiv" class={(this.state.isFlagged) ? "fa fa-flag fa-3x text-info my-flag" : "fa fa-flag fa-3x text-muted"} aria-hidden="true"></i></a>
        <h4>{this.state.count} reported </h4>
        </div>
        </div>
      );
  }


  componentWillReceiveProps(nextProps){


    this.setState({
      count: nextProps.item.report_count,
      isFlagged: nextProps.item.is_reported
    });
  }

  componentWillMount(){

  }
  /*
   *  Handler method for flagging an item
   *  
   *  Checks if item is already flagged. If not marks item as flagged and reports to server through a POST call
   *
   *  If already flagged unflags the item and reports to the server through a POST call.
   *
   *  If user is not logged in alerts the user to login in order to flag items.
   *  @public
   */
  clickHandler() {
      var clk = this.state.count
      var add = 0;
      if(!this.state.isFlagged && this.props.loginStatus == "1"){
        add = 1;
        this.setState({
          isFlagged: true
        });

         var myHeaders = new Headers();

        var comment1 = {
        "report" : 1
        };
        var url = "http://52.90.34.144:85/api/items/" + this.props.item.id + "/reports";
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
          //alert("Item liked");
        } else {
          //alert("Couldn't complete :(");
        }
      })
      .catch((error) => {
        console.error(error);
      })
      }
      else if(this.state.isFlagged && this.props.loginStatus == "1"){
        add = -1;
        this.setState({
          isFlagged: false
        });


         var myHeaders = new Headers();

        var comment1 = {
        "report" : 0
        };
        var url = 'http://52.90.34.144:85/api/items/' + this.props.item.id + '/reports';
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
          //alert("Item disFlagged");
        } else {
          //alert("Couldn't complete :(");
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

export default Flag;
