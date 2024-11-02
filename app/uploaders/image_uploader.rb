# frozen_string_literal: true

class ImageUploader < BaseUploader
  version :thumb do
    process resize_to_fill: [200, 200]
  end
end
