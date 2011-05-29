# encoding: utf-8

class GameCoverUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  storage :s3

  #def store_dir
  #  "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  #end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  version :thumb do
    process :resize_to_fill => [90, 90]
  end

  def extension_white_list
    %w(jpg jpeg png)
  end
end
