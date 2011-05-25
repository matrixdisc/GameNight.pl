# == Schema Information
# Schema version: 20110522184230
#
# Table name: invites
#
#  id             :integer         not null, primary key
#  user_id        :integer         not null
#  user_id_target :integer         not null
#  code           :string(255)
#  message        :text
#  is_accepted    :boolean
#  accepted_at    :datetime
#

class Invite < ActiveRecord::Base
    belongs_to :user
    belongs_to :user_target, :class_name => 'User', :foreign_key => 'user_id_target'        # the target of the friend relationship
    validates_presence_of :user, :user_target
end
