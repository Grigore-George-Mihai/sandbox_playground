# frozen_string_literal: true

class Photo < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates :title, presence: true
end
