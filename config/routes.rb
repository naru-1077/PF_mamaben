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



    resources :users, only: [:index, :show, :edit, :update] do
      member do
        get 'post_histories' #   get "/users/:id/post_histories" => 'users#post_histories'
        get 'posts_by_own_comments' #   get "/users/:id/posts_by_own_comments" => 'users#posts_by_own_comments'
      end
    end

    resources :genres, only: [:index, :create, :edit, :update, :destroy]

  end

scope module: :users do
    root to: "homes#top"
    get "/about" => "homes#about"
    get "/users/my_page" => "users#show"
    get "/users/unsubscribe" => "users#unsubscribe"
    patch "/users/withdraw" => "users#withdraw"
    get "/users/my_page/edit" => "users#edit"
    get "/users/:id/" => "users#post_histories", as: "users_post_histories"
    patch "/users/update" => "users#update"
    get "/posts/:id/favorites" => "favorites#index", as: "post_favorite"
    get "my_comments" => "post_comments#my_comments"

    resources :posts, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:index, :new, :create, :edit, :update, :destroy]
    end
  end

end
