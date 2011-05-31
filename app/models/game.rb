# == Schema Information
# Schema version: 20110525172444
#
# Table name: games
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Game < ActiveRecord::Base
  mount_uploader :cover, GameCoverUploader
end
