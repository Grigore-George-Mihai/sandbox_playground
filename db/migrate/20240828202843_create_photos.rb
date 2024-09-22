# frozen_string_literal: true

class CreatePhotos < ActiveRecord::Migration[7.2]
  def change
    create_table :photos do |t|
      t.string :title, null: false, default: ""
      t.string :image

      t.timestamps
    end
  end
end
