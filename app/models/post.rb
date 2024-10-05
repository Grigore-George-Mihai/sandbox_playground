# frozen_string_literal: true

class Post < ApplicationRecord
  searchkick word_start: [:title]

  validates :title, presence: true
end
