class TwitterController < ApplicationController
  CALLBACK = "http://127.0.0.1:3000/twitter/autenticated"
  require "oauth"
  require 'json'

 def get_screen_name(access_token)
      # Whoooooo are you? Who, who - who, who
      response = @oauth.request(:get, '/account/verify_credentials.json', access_token, { :scheme => :query_string })
      if response.code == "200"
        user_info = JSON.parse(response.body)
        return user_info['screen_name'] if user_info['screen_name']
      end
      logger.error "Failed to get user info via OAuth"
      return false
    end

  def add_credentials
    @oauth = OAuth::Consumer.new("Cq6R4sQJjCetDwfH1lRPag", "0EvRS72W87Jzk3dCh7AxbTQzFtnNiJobskjRURpcSU",{ :site=>"http://twitter.com"})
    request_token = @oauth.get_request_token#(:oauth_callback => CALLBACK)
    session[:request_token] = request_token.token
    session[:request_token_secret] = request_token.secret
    redirect_to request_token.authorize_url
  rescue OAuth::Unauthorized => e
    logger.error e.response.inspect
  end

  def authenticated
    @oauth = OAuth::Consumer.new("Cq6R4sQJjCetDwfH1lRPag", "0EvRS72W87Jzk3dCh7AxbTQzFtnNiJobskjRURpcSU",{ :site=>"http://twitter.com"})
    request_token = OAuth::RequestToken.new(@oauth, session[:request_token], session[:request_token_secret])
    access_token = request_token.get_access_token(:consumer => @oauth,  :pin => params[:pin] )
    current_user.twitter_screenname = get_screen_name(access_token).to_s
    current_user.twitter_token = access_token.token;
    current_user.twitter_secret = access_token.secret;
    current_user.save!
    Twitter.configure do |config|
      config.consumer_key = "Cq6R4sQJjCetDwfH1lRPag"
      config.consumer_secret = "0EvRS72W87Jzk3dCh7AxbTQzFtnNiJobskjRURpcSU"
      config.oauth_token = current_user.twitter_token
      config.oauth_token_secret = current_user.twitter_secret
    end

    current_user.user_settings.has_twitter = true;
    current_user.user_settings.save!
    @client = Twitter::Client.new
    @client.update("I just linked my twitter account with my GameNight acount!")
    flash[:mood] = "positive"
        redirect_to edit_user_path(current_user), :notice => "Twitter account '"+current_user.twitter_screenname.to_s+"' succesfully linked."
  rescue Twitter::Forbidden
    flash[:mood] = "positive"
            redirect_to edit_user_path(current_user), :notice => "Twitter account '"+current_user.twitter_screenname+"' succesfully linked."
  rescue OAuth::Unauthorized => e
    flash[:mood] = "negative"
    redirect_to edit_user_path(current_user), :notice => "Something went wrong. Try again:("

  end
  def send_tweet message
    @client = Twitter::Client.new(:oauth_token => current_user.twitter_token, :oauth_secret => current_user.twitter_secret)  if @client.nil?

    @client.update(message)
  end

  def unlink
    current_user.twitter_screenname = ""
    current_user.twitter_token = ""
    current_user.twitter_secret = ""
    current_user.user_settings.has_twitter = false
    current_user.user_settings.save!
    current_user.save!
    flash[:mood] = "positive"
    redirect_to edit_user_path(current_user), :notice => "Twitter account successfully unlinked."
  end

end
