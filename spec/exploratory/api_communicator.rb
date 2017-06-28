def session
  Redd.it(
    user_agent: "Goal_Highlights",
    client_id: "_6Ql0Wm5PO_ABA",
    secret: "asRLazsZt8mK1Q4tjqUevZxGSkU",
    username: "Shabla_goo32",
    password: "jsoccer4"
  )
end

def soccer_socket
  #connect session to /r/soccer
  session.subreddit("soccer")
end

def stream_posts
  #livestream all new posts from /r/soccer
  soccer_socket.post_stream do |post|
    # NOTE: This seems to give me the newest 100 posts, from oldest
    # (top) to newest (bottom); continues to udpate from there
    puts post.title
    puts post.link_flair_text
    puts "****************************************"
  end
end

def stream_comments
  #livestream all new comments made to all /r/soccer posts
  soccer_socket.comment_stream do |comment|
    puts comment.body
  end
end
