# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

@matrix = User.create(:username => "ma_trix", :email => "matrix.disc@gmail.com", :first_name => "Mateusz", :last_name => 'Łukomski', :location => 'Poznań', :password => "pass", :password_confirmation => "pass")
if @matrix.save
  puts "User ma_trix created and saved"
else
  puts "matrix not saved"
end
@marcel = User.create(:username => "marcel", :email => "marcel@kwach.org", :first_name => "Marcel", :last_name => 'Makowski', :location => 'Poznań', :password => "pass", :password_confirmation => "pass")
if @marcel.save
  puts "User marcel created and saved"
else
  puts "marcel not saved"
end
@friendship = Invite.create(:user => @matrix, :user_target => @marcel, :message => "Friends?", :is_accepted => true)
if @friendship.save
  puts "ma_trix and marcel are friends now"
else
  puts "friendship not saved"
end
@gamenight = Gamenight.create(:user => @matrix, :name => "First gamenight", :description => "First gamenight ever", :location => "Poznań", :start_time => "15:00 10-05-2011", :end_time => "24:00 10-05-2011", :player_slots => 5)
if @gamenight.save
  puts "gamenight saved"
else
  puts "gamenight not saved"
end
@gamenight_invitation = @marcel.gamenight_invitations.create :gamenight_id => @gamenight.id, :user_inviting_id => @matrix.id
if @gamenight_invitation.save
  puts "gamenight invitation saved"
else
  puts "gamenight invitation not saved"
end

@notification = GamenightCreationNotification.create(:user => @matrix, :recipient => @marcel, :target => @gamenight)
if @notification.save!
  puts "notification1 saved"
else
  puts "notification not saved"
end
@notification = GamenightInvitationNotification.create(:user => @matrix, :recipient => @marcel, :target => @gamenight_invitation)
if @notification.save!
  puts "notification2 saved"
else
  puts "notification not saved"
end
