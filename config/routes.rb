IAmTheLider::Application.routes.draw do
  match "/404" => "errors#not_found"

  mount Ckeditor::Engine => '/ckeditor'
  resources :news
  resources :blog_posts
  resources :reports
  resources :projects
  
  resources :users do
    collection do
      get "login"
      post "login"
      put "logout"
      get "office" => "users#show"
    end
  end
  
  resources :welcome do
    collection do
      get "first_stage"
      get "second_stage"
      get "third_stage"
      get "competition"
    end
  end

  resources :admins do
    collection do
      get "admin" => "admins#login"
      put "logout"
    end
  end

  root :to => 'welcome#index'
end
