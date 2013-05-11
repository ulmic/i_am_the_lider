IAmTheLider::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :news
  resources :blog_posts
  resources :reports
  resources :projects
  resources :users

  match "office" => "users#login"
  match "logout" => "users#logout"
  match "create_project" => "projects#new"
  match "create_report" => "reports#new"
  match "stages" => "welcome#stages"
  match "competition" => "welcome#competition"

  root :to => 'welcome#index'
end
