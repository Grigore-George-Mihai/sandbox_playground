# frozen_string_literal: true

class BaseUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_allowlist
    %w[jpg jpeg gif png]
  end

  def size_range
    (1.byte)..(5.megabytes)
  end
end
