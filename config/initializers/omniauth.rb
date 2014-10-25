OmniAuth.config.logger = Rails.logger
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'fSjBtDQRpnq5zZiiErbTHDeoN', 'h5zCwFt3Xi3ojq1fj7Rl7HDk1yaxGoLUlQX5y6GHwvhP1tHwuA'
  provider :facebook, '311674462368409', '3275219dc16449d6fda7429def807378'
  provider :google_oauth2, '904118285624-s27fj303u99n3m8q8dinhb6vr6r6dcp5.apps.googleusercontent.com', 'iY_iWYKgRvpjFW0RdaOVRbYn', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end