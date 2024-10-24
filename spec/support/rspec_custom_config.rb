# frozen_string_literal: true

RSpec.configure do |config|
  config.after(:each, type: :service) do
    FileUtils.rm_rf(Dir[Rails.root.join("tmp/tests/uploads").to_s])
  end
end
