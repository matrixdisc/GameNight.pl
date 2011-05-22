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
  belongs_to :user
  belongs_to :gamenight
end
