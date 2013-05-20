IAmTheLider::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :news
  resources :blog_posts
  resources :reports
  resources :projects
  
  resources :users do
    collection do
      get "login"
      post "login"
      get "office" => "users#show"
    end
  end
  
  resources :welcome do
    collection do
      get "first_stage"
      get "second_stage"
      get "third_stage"
    end
  end

  match "logout" => "users#logout"
  match "create_project" => "projects#new"
  match "create_report" => "reports#new"
  match "competition" => "welcome#competition"
  match "admin" => "admins#login"
  match "admins_logout" => "admins#logout"

  root :to => 'welcome#index'
end
