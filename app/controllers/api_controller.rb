class APIController

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

  def self.valid_flair?(flair)
    #Check if post flair indicates it is media (array in case it expands)
    ["Media"].include?(flair) ? true : false
  end

  def self.has_minute?(post_title)
    # Search for and return a ##' pattern in the title (0 or 1 space allowed)
    post_title.scan(/[0-9]+'/).any? || post_title.scan(/[0-9]+ '/).any?? true : false
  end

  def self.has_score?(post_title)
    # Search for and return everything between and including ( and )
    post_title.scan(/\([0-9].+\)/).any? ? true : false

  end

  def self.has_penalty?(post_title)
    # Search for and return any instance of penalty in down-cased post title
    post_title.downcase.scan(/penalty/).any? ? true : false
  end

  def self.meets_goal_criteria(flair, post_title)
    #combines methods above to check all criteria that indicate a post is a goal highlight
    t = post_title
    valid_flair?(flair) && (has_minute?(t) || has_score?(t) || has_penalty?(t))
  end

  def self.test_scan
    #View post stream and verify that #meets_goal_criteria is working correctly
    socket.post_stream do |post|
      puts post.title
      puts post.link_flair_text
      puts meets_goal_criteria(post.link_flair_text, post.title)
      puts "----------"
    end
  end

  def self.scan
    # Monitor post stream and store valid posts in database
    socket.post_stream do |post|
      if meets_goal_criteria(post.link_flair_text, post.title)
        highlight = Highlight.create(Highlight.create_assignment_hash(post))
        highlight.domain = Domain.find_or_create_by(name: post.domain)
        highlight.save
      else
        #no action
      end
    end
  end

end
