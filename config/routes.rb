Rails.application.routes.draw do
  root to: "blog_posts#index"
  devise_for :users
  resources :blog_posts
end
