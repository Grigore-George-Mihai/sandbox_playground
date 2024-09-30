# frozen_string_literal: true

class Post < ApplicationRecord
  searchkick word_start: [:title]
  after_commit :reindex, on: %i[create update]

  validates :title, presence: true
end
