CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider:              'AWS',
    aws_access_key_id:     'AKIAIEKYJPLZULHQTZ3A',
    aws_secret_access_key: '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',
    region:                'us-east-1'
  }
  config.fog_directory  = 'gupharma'                                      # required
end