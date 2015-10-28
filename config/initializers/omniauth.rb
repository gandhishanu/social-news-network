Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '856220914493063', '58dabe4c6e66deca3e183eb65528f441'
end