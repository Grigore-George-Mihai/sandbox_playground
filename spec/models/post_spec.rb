# frozen_string_literal: true

# spec/models/post_spec.rb
require "rails_helper"

RSpec.describe Post, type: :model do
  let(:post) { build(:post) }

  describe "validations" do
    it "is valid with a title" do
      expect(post).to be_valid
    end

    it "is invalid without a title" do
      post.title = nil
      expect(post).not_to be_valid
      expect(post.errors[:title]).to include("can't be blank")
    end
  end

  describe "searchkick integration" do
    it "calls reindex after commit on create" do
      post = build(:post)
      allow(post).to receive(:reindex)
      post.save!
      expect(post).to have_received(:reindex)
    end

    it "calls reindex after commit on update" do
      post = create(:post)
      allow(post).to receive(:reindex)
      post.update!(title: "New Title")
      expect(post).to have_received(:reindex)
    end
  end
end
