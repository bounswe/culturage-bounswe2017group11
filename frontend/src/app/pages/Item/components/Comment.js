import React from 'react';

class Comment extends React.Component {
    constructor(props){
        super(props);
        this.state = {
            myComment: '',
            user: ""
        }

        this.handleCommentChange = this.handleCommentChange.bind(this);
        this.handleSubmit = this.handleSubmit.bind(this);
        this.handleKeyPress = this.handleKeyPress.bind(this);
    }

    componentDidMount(){
        var token = getCookie('token');
        var myHeaders = new Headers();
        myHeaders.append("Authorization", "JWT " + token);
        fetch('http://52.90.34.144:85/api/profile', {
            method: 'GET',
            headers: myHeaders
        })
        .then(response => {
            return response.json() })
        .then((json) => {
            this.setState({user: json});
        })

        .catch(function(error) {
            console.log('There has been a problem with your fetch operation: ' + error.message);
        });
    }

   handleCommentChange(event){this.setState({myComment: event.target.value});};

   handleKeyPress(e){
        if(e.key === 'Enter'){
            var myHeaders = new Headers();

            var comment1 = {
                "text" : this.state.myComment
            };
            var url = 'http://52.90.34.144:85/api/items/' + this.props.item.id + '/comments';
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
                    window.location.reload();
                } else {
                    alert("Please login before :(");
                }
            })
            .catch((error) => {
                console.error(error);
            })
        }
   }

   handleSubmit(e){
        e.preventDefault();
        var myHeaders = new Headers();

        var comment1 = {
        "text" : this.state.myComment
        };
        var url = 'http://52.90.34.144:85/api/items/' + this.props.item.id + '/comments';
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
                window.location.reload();
            } else {
                alert("Please login before :(");
            }
        })
        .catch((error) => {
            console.error(error);
        })
    };

    editDate(date){
        var year = date.substring(0,4)
        var month = date.substring(5,7)
        var day = date.substring(8,10)
        if(month=="01") month = "January"
        else if(month=="02") month = "February"
        else if(month=="03") month = "March"
        else if(month=="04") month = "April"
        else if(month=="05") month = "May"
        else if(month=="06") month = "June"
        else if(month=="07") month = "July"
        else if(month=="08") month = "August"
        else if(month=="09") month = "September"
        else if(month=="10") month = "October"
        else if(month=="11") month = "November"
        else if(month=="12") month = "December"
        var edited = new String(day + " " + month + " " + year)
        return edited
    }

    render() {
    let comment;
    if(typeof this.props.item.created_by != "undefined") {
        comment = <div>
            <div class="mycontainer2">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        Item details
                    </div>
                    <div class="panel-body">
                        {/*<h5 class="panel-title"><strong>Id:</strong> {this.props.item.id}</h5>*/}
                        <div class="details-text"><b>Created by:</b> {this.props.item.created_by.username}</div>
                        <div class="details-text"><b>Created at:</b> {this.editDate(this.props.item.created_at)}</div>
                        {console.log(this.props.item)}
                        {this.props.item.timelines!=null ? this.props.item.timelines.map(function(timeLine, key){
                            if(timeLine.location!=null && timeLine.location.name != "")
                                return(<div class="details-text"><b>Location:</b> {timeLine.location.name}</div>)
                        })                  
                        : ""}
                        {this.props.item.timelines!=null ? this.props.item.timelines.map(function(timeLine, key){
                            if(timeLine.startLabel!=null && timeLine.endLabel!=null)
                                return(<div class="details-text"><b>Start Date:</b> {timeLine.startLabel}</div>)
                            else if(timeLine.startLabel!=null)
                                return(<div class="details-text"><b>Date:</b> {timeLine.startLabel}</div>)
                        })                  
                        : ""}
                        {this.props.item.timelines!=null ? this.props.item.timelines.map(function(timeLine, key){
                            if(timeLine.endLabel!=null)
                                return(<div class="details-text"><b>End Date:</b> {timeLine.endLabel}</div>)
                        })                  
                        : ""}
                        <div class = {(this.props.loginStatus == "1") ? "" : "hidden"}> 
                            <hr></hr>
                            <a href={"/editItem/" + this.props.item.id} type="button" class="btn btn-danger btn-block media-button">Add media</a>
                        </div>
                    </div>
                </div>
                <br />
                <div class="panel panel-info post">
                    <div class="panel-heading">
                        Comments
                    </div>
                    <div class="post-footer">
                        <div class="input-group"> 
                            <input class="form-control" placeholder="Add a comment" type="text" value = {this.state.myComment} onChange={ this.handleCommentChange } onKeyPress={this.handleKeyPress}/>
                            <span class="input-group-addon" onClick = {this.handleSubmit}>
                                <a href="#"><i class="fa fa-edit"></i></a>  
                            </span>
                        </div>
                        <ul class="comments-list">
                            {this.props.item.comments.map(function(comment){ return (
                            <li class="comment">
                                <a class="pull-left" href="#">
                                    <img class="avatar" src= {(comment.written_by.photo) ? comment.written_by.photo : "http://bootdey.com/img/Content/user_1.jpg" }alt="avatar"/>
                                 </a>
                                <div class="comment-body">
                                    <div class="comment-heading">
                                        <h4 class="user">{comment.written_by.username}</h4>
                                        <h5 class="time">{comment.created_at.substring(0,10)} {comment.created_at.substring(11,16)}</h5>
                                    </div>
                                    <p class="comment-text">{comment.text}</p>
                            </div>
                            </li>
                            );})}

                        </ul>
                    </div>
                </div>
            </div>
        </div> 
    } else{
        comment = null;
    }
    return (
        <div>
            {comment}
        </div>
        );
    }
}

function getCookie(key) {
    var keyValue = document.cookie.match('(^|;) ?' + key + '=([^;]*)(;|$)');
    return keyValue ? keyValue[2] : null;
}

export default Comment;

