class User < ActiveRecord::Base
  acts_as_authentic
  acts_as_network :friends, :through => :invites, :conditions => "is_accepted = 't'"
  has_many :gamenights

  include Gravtastic
  gravtastic :default => "monsterid"
  
  def full_name
      return "#{first_name} #{last_name}" if !first_name.blank? && !last_name.blank?
      return username
  end
end
