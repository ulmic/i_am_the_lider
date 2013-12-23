IAmTheLider::Application.routes.draw do
  root to: 'welcome#index'

  mount Ckeditor::Engine => '/ckeditor'

  resources :news, only: [ :show, :index ]
  resource :session, only: [:new, :create, :destroy]
  resources :users do
    member do
      resources :reports
      resources :blog_posts
    end
  end
  resource :welcome, only: :index do
    collection do
      get "first_stage" => "welcome#first_stage"
      get "second_stage" => "welcome#second_stage"
      get "third_stage" => "welcome#third_stage"
      get "competition" => "welcome#competition"
    end
  end
  resource :errors do
    collection do
      get "not_found"
    end
  end
  namespace :admin do
    root to: "admin/welcome#index"
    resource :session, only: [ :new, :create, :destroy ]
    resources :welcome, only: [ :index ]
    resources :blog_posts, except: [:create, :new]
    resources :news
    resources :users
    resources :reports, only: [ :edit, :update, :destroy ]
  end
end
