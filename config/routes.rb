Rails.application.routes.draw do
  root 'recipes#index'

  resources :recipes do
    resources :tags, only: [:create, :destroy]
  end
end
