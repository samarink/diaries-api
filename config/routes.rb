require 'sidekiq/web'

Rails.application.routes.draw do
  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    ActiveSupport::SecurityUtils.secure_compare(
      ::Digest::SHA256.hexdigest(username), ::Digest::SHA256.hexdigest(ENV['SIDEKIQ_USERNAME'])
    ) &
      ActiveSupport::SecurityUtils.secure_compare(
        ::Digest::SHA256.hexdigest(password), ::Digest::SHA256.hexdigest(ENV['SIDEKIQ_PASSWORD'])
      )
  end

  mount Sidekiq::Web, at: '/sidekiq'

  namespace :api, defaults: { format: :json } do
    resources :diaries, only: %i[index show create update destroy] do
      resources :notes, only: %i[index create]
    end

    resources :notes, only: %i[update destroy]
  end
end
