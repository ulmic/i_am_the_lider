# encoding: utf-8

class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::Compatibility::Paperclip
  def paperclip_path
    ":rails_root/public/uploads/:id/:attachment/:style_:basename.:extension"
  end
  storage :file
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
