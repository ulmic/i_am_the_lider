IAmTheLider::Application.routes.draw do
  root to: 'welcome#index'

  mount Ckeditor::Engine => '/ckeditor'

  resources :news, only: [ :show, :index ]
  resource :session, only: [:new, :create, :destroy]
  resources :users do
    member do
      resources :reports
      resources :blog_posts
      resource :works, except: [ :index, :show ]
    end
  end
  resource :welcome, only: :index do
    collection do
      get "first_stage" => "welcome#first_stage"
      get "second_stage" => "welcome#second_stage"
      get "third_stage" => "welcome#third_stage"
      get "competition" => "welcome#competition"
      get "reg_end" => "welcome#reg_end"
    end
  end
  resource :errors do
    collection do
      get "not_found"
    end
  end
  namespace :admin do
    resource :session, only: [ :new, :create, :destroy ]
    resources :welcome, only: [ :index ]
    resources :blog_posts, except: [:create, :new]
    resources :news, except: [ :index, :show ]
    resources :users do
      member do
        put :accept
        put :reserve
        put :move_next_stage
        resource :reserve_reason, except: [ :index, :show ]
      end
    end
    resources :reports, only: [ :edit, :update, :destroy ]
    resources :jurors, except: [:show, :new]
    resources :stages do
      member do
        resources :criterions, except: :show
        resources :jurors, only: [:new]
        resources :ratings, only: :index
      end
    end
  end
  get "admin" => "admin/welcome#index"
  namespace :juror do
    resource :session, only: [ :new, :create, :destroy ]
    resources :welcome, only: :index
    resources :users, only: :index do
      member do
        resources :ratings, only: :new
      end
    end
    resources :ratings, only: [:create, :edit, :update]
  end
  get "juror" => "juror/welcome#index"
end
