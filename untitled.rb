        <%@all_tweets.each do |tweet|%>
        <div class="list">
          <img src="/img/twitter-egg.jpg" class="avatar">
          <div class="content">
           <a href="/user/username" class="bold"><%=tweet.username%></a> <div class="light_text" style="display:inline"> @username</div>
           <p><%=tweet.tweet%></p>
          </div>
          <i class="time">Time</i>
        </div>
        <%end%>