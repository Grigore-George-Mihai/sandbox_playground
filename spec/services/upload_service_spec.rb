# frozen_string_literal: true

require "rails_helper"

RSpec.describe UploadService, type: :service do
  let(:photo_params) do
    { title: "Sample Photo",
      image: Rack::Test::UploadedFile.new(Rails.root.join("spec/fixtures/files/sample.jpg"), "image/jpeg") }
  end

  describe "#call" do
    context "when the photo is valid" do
      it "creates and saves a new photo" do
        service = described_class.new(Photo, photo_params)
        photo = service.call

        expect(photo).to be_persisted
        expect(photo.title).to eq("Sample Photo")
        expect(photo.image.url).to be_present
      end
    end

    context "when the photo is invalid" do
      it "does not save the photo and returns nil" do
        invalid_params = { title: "" }
        service = described_class.new(Photo, invalid_params)
        photo = service.call

        expect(photo).to be_nil
      end
    end
  end
end
