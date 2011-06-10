# == Schema Information
# Schema version: 20110529183130
#
# Table name: games
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  cover      :string(255)
#

class Game < ActiveRecord::Base
  mount_uploader :cover, GameCoverUploader

  def thumb_url
    self.cover.thumb.url
  end


  def to_json
    return self.attributes.merge(thumb_url: self.thumb_url)
  end
end
