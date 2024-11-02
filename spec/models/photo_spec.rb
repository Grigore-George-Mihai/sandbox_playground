# frozen_string_literal: true

require "rails_helper"

RSpec.describe Photo, type: :model do
  let(:photo) { build(:photo) }

  describe "validations" do
    it { is_expected.to validate_presence_of(:title) }
  end

  describe "image uploader" do
    it "mounts the image uploader" do
      expect(photo.image).to be_an_instance_of(ImageUploader)
    end
  end
end
