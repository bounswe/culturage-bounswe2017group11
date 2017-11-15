import React from 'react';
import $ from 'jquery';

class Like extends React.Component {
    constructor(props){
      super(props);
      this.state = {
         count: 0,
         isLiked: false
       };
      this.clickHandler = this.clickHandler.bind(this)

   }
   render() {
      return( 
        <div>
        <div class="likeContainer" >
        <a class="button">
        <i id="id1" ref="myComponentDiv" class="fa fa-thumbs-o-up fa-6x text-muted" aria-hidden="true"></i></a>
        <h3>{this.state.count} likes </h3>
        </div>
        </div>
      ); 
  }

  clickHandler() {
      var clk = this.state.count
      var add = 0;
      if(!this.state.isLiked){
        add = 1;
        this.setState({
          isLiked: true
        });
      }
      else{
        add = -1;
        this.setState({
          isLiked: false
        });
      }
      this.setState({
        count: clk + add
      });
  }

  componentDidMount() {
    this.refs.myComponentDiv.addEventListener('click', this.clickHandler);

    $('#id1').click(function(){
      $(this).toggleClass('fa fa-thumbs-o-up fa-6x text-muted').toggleClass('fa fa-thumbs-o-up fa-6x text-info');
    });

    console.log('jQUery Loaded');
  }

}

export default Like;

