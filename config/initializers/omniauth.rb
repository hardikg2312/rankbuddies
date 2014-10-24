Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'fSjBtDQRpnq5zZiiErbTHDeoN', 'h5zCwFt3Xi3ojq1fj7Rl7HDk1yaxGoLUlQX5y6GHwvhP1tHwuA'
end