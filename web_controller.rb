class WebController < Ramaze::Controller

  def index
    render_file 'view/index.xhtml'
  end

  def tweet
    tweet = request['tweet']
    if tweet == nil
      redirect index
    end
    posted_tweet = nil
    begin
      posted_tweet = TwitterClient::CLIENT.update(tweet)
    rescue Exception
      return 'Das hat nicht geklappt. Entweder war dein Tweet zu lang, oder irgendetwas anderes ist passiert.'
    end
    redirect posted_tweet.url
  end

end