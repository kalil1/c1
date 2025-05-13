CarrierWave.configure do |config|
    config.storage    = :aws
    config.aws_bucket = ENV.fetch('BUCKET_NAME')
    config.aws_acl    = 'public-read'
    config.aws_authenticated_url_expiration = 60 * 60 * 24 * 7
    config.aws_credentials = {
      access_key_id:     ENV.fetch('ACCESS_KEY_ID'),
      secret_access_key: ENV.fetch('SECRET_ACCESS_KEY'),
      region:            ENV.fetch('REGION') # Required
    }
  end