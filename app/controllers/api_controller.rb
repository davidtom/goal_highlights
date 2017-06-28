class APIController

  # Create arrays for post criteria to check for
  @@flair = ["Media"]
  # make sure all are downcase!
  @@goal_indicators = ["'", "penalty"] #regex for (#-#)

  def self.session
    Redd.it(
      user_agent: "Goal_Highlights",
      client_id: "_6Ql0Wm5PO_ABA",
      secret: "asRLazsZt8mK1Q4tjqUevZxGSkU",
      username: "Shabla_goo32",
      password: "jsoccer4"
    )
  end

  def self.socket
    session.subreddit("soccer")
  end

  def self.stream_posts_title_flair
    socket.post_stream do |post|
      puts post.title
      puts post.link_flair_text
      puts "****************************************"
    end
  end

  def self.valid_flair?(flair)
    @@flair.include?(flair) ? true : false
  end

  def self.collect_goals
    # socket.post_stream do |post|
      # if post.title
      # end
        #word is array
        # words.any? { |word| sentence.include?(word) }
  end

end
