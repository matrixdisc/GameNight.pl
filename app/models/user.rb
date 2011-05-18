class User < ActiveRecord::Base
  acts_as_authentic
  acts_as_network :friends, :through => :invites, :conditions => "is_accepted = 't'"
  
  has_many :gamenights
  validates_format_of :username, :with => /\A[A-Za-z0-9_]+\z/
  validates_length_of :username, :maximum => 32

  include Gravtastic
  gravtastic :default => "monsterid"
  
  def full_name
      return "#{first_name} #{last_name}" if !first_name.blank? && !last_name.blank?
      return username
  end
end
