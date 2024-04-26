Rails.application.routes.draw do
  get 'search', to: "search#index"
  devise_for :users
  root 'home#index'

  #/posts/1/comments/2
  resources :posts do
    resources :comments
  end

end
