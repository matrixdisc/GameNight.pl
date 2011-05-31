class Notification < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipient, :class_name => 'User'

  validates_presence_of :user

  belongs_to :target, :polymorphic => true

  def email_the_user(target)
      # nothing here to see, move along.
  end


  def message(current_user)
    "default message"
  end
end
