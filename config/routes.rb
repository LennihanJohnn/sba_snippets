Rails.application.routes.draw do
  root 'snippets#index'

  devise_for :users

  resources :snippets do
    resources :comments, only: [:create]
    collection do
      get '/autocomplete', to: 'snippets#autocomplete'
    end
  end

end
