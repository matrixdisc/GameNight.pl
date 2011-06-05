class UserMailer < ActionMailer::Base
  default :from => "gamenight.development@gmail.com"
  
  def registration_confirmation(user)
    @user = user
    attachments["gamenight.png"] = File.read("#{Rails.root}/public/images/logo1.png")
    mail(:to => "#{user.username} <#{user.email}>", :subject => "Thank you for registering at GameNight.pl")
  end
end

