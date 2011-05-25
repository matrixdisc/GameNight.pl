class Notification < ActiveRecord::Base
  belongs_to :user, :class_name => 'User'
  belongs_to :recipient, :class_name => 'User'

  validates_presence_of :user

  belongs_to :target, :polymorphic => true

  def self.for(recipient, opts={})
    self.where(opts.merge!(:recipient_id => recipient.id)).order('updated_at desc')
  end

  def self.notify(recipient, target)
    if target.respond_to? :notification_type
      note_type = target.notification_type(recipient)
      n = note_type.concatenate_or_create(recipient, target, note_type)
      n.email_the_user(target) if n
      n
    end
  end

  def email_the_user(target)
      # nothing here to see, move along.
  end


  def self.make_notification(user, recipient, target, notification_type)
    n = notification_type.new(:user => user,
                              :target => target,
                               :recipient_id => recipient.id,
                               :unread => true)
    n.save!
    n
  end
end

class GameNightInvitationNotification < Notification

end