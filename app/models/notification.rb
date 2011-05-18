class Notification < ActiveRecord::Base
    belongs_to :user, :class_name => 'User'
    has_many :target_user, :class_name => 'User'
    
    validates_presence_of :user
    
    belongs_to :target, :polymorphic => true
    
end