IAmTheLider::Application.routes.draw do
  
  root :to => 'welcome#index'
  
  match "/404" => "errors#not_found"
  match "admin" => "admins#login"

  mount Ckeditor::Engine => '/ckeditor'
  resources :news
  resources :blog_posts do
    collection do
      delete "destroy" => "blog_posts#destroy"
    end
  end
  
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
      post "login"
      get "logout" => "admins#logout"
      get "panel" => "admins#panel"
    end
  end
end
