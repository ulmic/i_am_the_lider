IAmTheLider::Application.routes.draw do
  root to: 'welcome#index'
  get "admin" => "sessions#new"
  resource :session, only: [:new, :create, :destroy]
  mount Ckeditor::Engine => '/ckeditor'
  resources :news
  resources :users do
    member do
      resources :reports
      resources :blog_posts
    end
    collection do
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
      get "panel" => "admins#panel"
    end
  end
  resource :errors do
    collection do
      get "not_found"
    end
  end
  namespace :admin do
    resource :session, only: [ :new, :create, :destroy ]
  end
end
