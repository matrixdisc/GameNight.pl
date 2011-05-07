class User < ActiveRecord::Base
  acts_as_authentic
  acts_as_network :friends, :through => :invites, :conditions => "is_accepted = 't'"
end
