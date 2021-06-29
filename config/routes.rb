Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json } do
    resources :diaries, only: %i[index show create update destroy] do
      resources :notes, only: %i[index create]
    end

    resources :notes, only: %i[update destroy]
  end
end
