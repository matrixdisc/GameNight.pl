class Game < ActiveRecord::Base
  mount_uploader :cover, GameCoverUploader
end
