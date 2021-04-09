Rails.application.routes.draw do
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
  devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}

namespace :admins do
    get "/" => "users#index"
    resources :users, only: [:index, :show, :edit, :update]

    resources :genres, only: [:index, :create, :edit, :update, :destroy]

  end

scope module: :users do
    root to: "homes#top"
    get "/about" => "homes#about"
    get "/users/my_page" => "users#show"
    get "/users/unsubscribe" => "users#unsubscribe"
    patch "/users/withdraw" => "users#withdraw"
    get "/users/my_page/edit" => "users#edit"
    patch "/users/update" => "users#update"

    resources :posts, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :favorites, only: [:index]
      resources :post_comments, only: [:index, :new, :create, :edit, :update, :destroy]
    end
  end

end
