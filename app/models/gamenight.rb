# == Schema Information
# Schema version: 20110525172444
#
# Table name: gamenights
#
#  id            :integer         not null, primary key
#  host_id       :integer         not null
#  name          :string(255)     not null
#  description   :string(255)
#  location      :string(255)
#  start_time    :datetime
#  end_time      :datetime
#  players_slots :integer
#  created_at    :datetime
#  updated_at    :datetime
#  game_id       :integer
#

class Gamenight < ActiveRecord::Base
  attr_accessible :name, :description, :location, :start_time, :end_time, :players_slots, :user, :game_id

  validates :name, :presence => true, :length => { :maximum => 255 }
  validates :host_id, :presence => true

  belongs_to :user, :foreign_key => 'host_id'
  belongs_to :game
  has_many :gamenight_invitations
  has_many :users , :through => :gamenight_invitations

  def duration
    if not self.start_time or not self.end_time then
      return "unknown"
    end

    if self.start_time.to_date == self.end_time.to_date then
      start_time_string = self.start_time.strftime("%A, %d %b %Y %l:%M%p")
      end_time_string = self.end_time.strftime("%l:%M%p")
      return "#{start_time_string} - #{end_time_string}"
    else
      start_time_string = self.start_time.strftime("%A, %d %b %Y %l:%M%p")
      end_time_string = self.end_time.strftime("%A, %d %b %Y %l:%M%p")
      return "#{start_time_string} - #{end_time_string}"
    end
  end

  def can_invite_more_people?
    self.players_slots.nil? || (self.players_slots > self.gamenight_invitations.size + 1)
  end
end
