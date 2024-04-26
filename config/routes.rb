Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  #/posts/1/comments/2
  resources :posts do
    resources :comments
  end

end
