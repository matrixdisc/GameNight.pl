# == Schema Information
# Schema version: 20110522184230
#
# Table name: users
#
#  id                :integer         not null, primary key
#  username          :string(255)
#  email             :string(255)
#  crypted_password  :string(255)
#  password_salt     :string(255)
#  persistence_token :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  first_name        :string(255)
#  last_name         :string(255)
#  location          :string(255)
#

class User < ActiveRecord::Base
  acts_as_authentic
  acts_as_network :friends, :through => :invites, :conditions => "is_accepted = 't'"

  validates_format_of :username, :with => /\A[A-Za-z0-9_]+\z/
  validates_length_of :username, :maximum => 32
  has_many :gamenight_invitations
  has_many :gamenights, :through => :gamenight_invitations

  include Gravtastic
  gravtastic :default => "monsterid"
  
  def full_name
      return "#{first_name} #{last_name}" if !first_name.blank? && !last_name.blank?
      return username
  end
end
