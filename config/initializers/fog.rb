CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider:              'AWS',
    aws_access_key_id:     'AKIAJDMUEOWOT5NQ5H7A',
    aws_secret_access_key: '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',
    region:                'us-east-1'
  }
  config.fog_directory  = 'gupharma'                                      # required
end