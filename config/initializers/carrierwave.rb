CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider           => 'Google',
    :google_storage_access_key_id     => 'GOOGCHGPXXFQFDNGXAE6',
    :google_storage_secret_access_key => 'noOKwivU78gOb5sokRIiMMgxcHMXGCa+Jhmo2RKF'
  }
  config.fog_directory = 'rankbuddies'
end 