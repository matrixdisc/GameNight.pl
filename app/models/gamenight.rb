# == Schema Information
# Schema version: 20110503230850
#
# Table name: gamenights
#
#  id            :integer         not null, primary key
#  host_id       :integer
#  name          :string(255)
#  description   :string(255)
#  location      :string(255)
#  start_time    :datetime
#  end_time      :datetime
#  players_slots :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class Gamenight < ActiveRecord::Base
  attr_accessible :name, :description, :location, :start_time, :end_time, :players_slots, :user, :game_id

  validates :name, :presence => true, :length => { :maximum => 255 }
  validates :host_id, :presence => true

  belongs_to :user, :foreign_key => 'host_id'
  belongs_to :game
  has_many :gamenight_invitations
  has_many :users , :through => :gamenight_invitations
end
