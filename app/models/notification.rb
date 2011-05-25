class Notification < ActiveRecord::Base
  belongs_to :user, :class_name => 'User'
  belongs_to :recipent, :class_name => 'User'

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

private
  def self.concatenate_or_create(recipient, target, actor, notification_type)
    if n = notification_type.where(:target_id => target.id,
                              :target_type => target.class,
                               :recipient_id => recipient.id,
                               :unread => false).first
      n.unread = true
      n.save!
      n
    else
      make_notification(recipient, target, notification_type)
    end
  end

  def self.make_notification(recipient, target, notification_type)
    n = notification_type.new(:target => target,
                               :recipient_id => recipient.id,
                               :unread => true)
    n.save!
    n
  end
end