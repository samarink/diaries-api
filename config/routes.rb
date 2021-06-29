require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  namespace :api, defaults: { format: :json } do
    resources :diaries, only: %i[index show create update destroy] do
      resources :notes, only: %i[index create]
    end

    resources :notes, only: %i[update destroy]
  end
end
