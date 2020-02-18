Rails.application.routes.draw do
  devise_for :users
  root 'items#home', as: 'home'

  get 'cart' => 'items#cart', as: 'cart'

  resources :items do
    resources :comments
    get :upvote, on: :member
    get :expensive, on: :collection
    get :cheap, on: :collection
    get :find, on: :collection
  end

  get 'admin/users_count' => 'admin#users_count'#, as: 'admin/user_count'

end
