Rails.application.routes.draw do
  root 'recipes#index'

  resources :recipes, param: :slug do
    resources :tags, only: [:create, :destroy]
  end
end
