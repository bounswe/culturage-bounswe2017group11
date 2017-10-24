import React from 'react';

class Comment extends React.Component {
   render() {
      return (
      <div>
        <div class="container">
        <div class="card">
            <div class="card-header text-white bg-info">
                Where?
            </div>
            <div class="card-body">
            <h5 class="card-title">Dharmapuri, Forest Colony, Tajganj, Agra, Uttar Pradeş 282001, Hindistan</h5>
            </div>
        </div>
         
        <br />

        <div class="panel panel-white post">
            <div class="card-header text-white bg-info">
                Comments
            </div>
            <div class="post-footer">
                <div class="input-group"> 
                    <input class="form-control" placeholder="Add a comment" type="text"/>
                    <span class="input-group-addon">
                        <a href="#"><i class="fa fa-edit"></i></a>  
                    </span>
                </div>
                <ul class="comments-list">
                    <li class="comment">
                        <a class="pull-left" href="#">
                            <img class="avatar" src="http://bootdey.com/img/Content/user_1.jpg" alt="avatar"/>
                        </a>
                        <div class="comment-body">
                            <div class="comment-heading">
                                <h4 class="user">Canberk</h4>
                                <h5 class="time">5 minutes ago</h5>
                            </div>
                            <p>Wow! Hilarious. </p>
                        </div>
                    </li>
                    <li class="comment">
                        <a class="pull-left" href="#">
                            <img class="avatar" src="http://bootdey.com/img/Content/user_2.jpg" alt="avatar"/>
                        </a>
                        <div class="comment-body">
                            <div class="comment-heading">
                                <h4 class="user">Ceren</h4>
                                <h5 class="time">14 minutes ago</h5>
                            </div>
                            <p>I have visited therere before but I want to see it again.</p>
                        </div>
                    </li>
                </ul>
        </div>
    </div>
</div>

    </div> 
      );
   }
}

export default Comment;

