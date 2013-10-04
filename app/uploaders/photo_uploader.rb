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
  version :thumb do
    process resize_to_fill: [100, 100]
  end
  version :big_thumb do
    process resize_to_fill: [300, 300]
  end
  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
