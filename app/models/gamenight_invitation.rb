# == Schema Information
# Schema version: 20110522184230
#
# Table name: gamenight_invitations
#
#  id           :integer         not null, primary key
#  user_id      :integer         not null
#  gamenight_id :integer         not null
#  code         :string(255)
#  message      :text
#  is_accepted  :boolean
#  accepted_at  :datetime
#

class GamenightInvitation < ActiveRecord::Base
  attr_accessible :user_id, :gamenight_id, :message, :is_accepted, :user_inviting_id
  belongs_to :user
  belongs_to :user_inviting, :class_name => "User", :foreign_key => "user_inviting_id"
  belongs_to :gamenight

end
