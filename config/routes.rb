Rails.application.routes.draw do
  devise_for :users

  root 'posts#index'

  get 'posts/new' => 'posts#new'

  post 'posts/create' => 'posts#create'

  get 'posts/show/:id' => 'posts#show'

  get 'posts/edit/:id' => 'posts#edit'

  post 'posts/update/:id' => 'posts#update'

  delete 'posts/destroy/:id' => 'posts#destroy'

  post 'comments/create' => 'comments#create'

  delete 'comments/destroy/:id' => 'comments#destroy'

  post 'post/:post_id/like' => 'posts#like_toggle'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
