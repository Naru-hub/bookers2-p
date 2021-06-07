Rails.application.routes.draw do
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only:[:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get "followings" => "relationships#followings", as: 'followings'
    get "followers" => "relationships#followers", as: 'followers'
  end


  resources :books, only:[:index, :show, :create, :edit, :update, :destroy] do
    resources :book_comments, only:[:create, :destroy]
    resource :favorite, only:[:create, :destroy]
  end
end
