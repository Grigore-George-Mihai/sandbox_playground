CarrierWave.configure do |config|
  if Rails.env.production?
    config.fog_credentials = {
      provider: "AWS",
      aws_access_key_id: ENV.fetch("AWS_ACCESS_KEY_ID", nil),
      aws_secret_access_key: ENV.fetch("AWS_SECRET_ACCESS_KEY", nil),
      region: ENV.fetch("AWS_REGION", nil)
    }
    config.fog_directory  = ENV.fetch("S3_BUCKET_NAME", nil)
    config.fog_public     = false
    config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" }
    config.storage        = :fog
  elsif Rails.env.test?
    config.storage = :file
    config.enable_processing = false
    config.root = Rails.root.join("tmp/tests")
  else
    config.storage = :file
  end
end
