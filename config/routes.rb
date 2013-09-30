IAmTheLider::Application.routes.draw do

  root to: 'welcome#index'

  match "admin" => "admins#login"

  mount Ckeditor::Engine => '/ckeditor'

  resources :news

  resources :users do
    member do
      resources :reports
      resources :blog_posts
    end
    collection do
      get "login"
      post "login"
      put "logout"
      get "office" => "users#show"
    end
  end

  resource :welcome do
    collection do
      get "index" => "welcome#index"
      get "first_stage" => "welcome#first_stage"
      get "second_stage" => "welcome#second_stage"
      get "third_stage" => "welcome#third_stage"
      get "competition" => "welcome#competition"
    end
  end

  resources :admins do
    collection do
      post "login"
      get "logout" => "admins#logout"
      get "panel" => "admins#panel"
    end
  end

  resource :errors do
    collection do
      get "not_found"
    end
  end
end
