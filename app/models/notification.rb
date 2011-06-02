# == Schema Information
# Schema version: 20110529183130
#
# Table name: notifications
#
#  id            :integer         not null, primary key
#  target_type   :string(255)
#  target_id     :integer
#  recipient_id  :integer
#  notifications :string(255)
#  unread        :boolean         default(TRUE)
#  created_at    :datetime
#  updated_at    :datetime
#  user_id       :integer
#  type          :string(255)
#

class Notification < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipient, :class_name => 'User'

  validates_presence_of :user

  belongs_to :target, :polymorphic => true

  def email_the_user(target)
      # nothing here to see, move along.
  end

  def target_link_name
    target.name if target.respond_to?(:name)
    target.username if target.respond_to?(:username)
    "Go to target"
  end

  def message(current_user)
    "default message"
  end
end
