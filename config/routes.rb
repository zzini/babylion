Rails.application.routes.draw do
  devise_for :users

  root 'posts#index' # posts/index -> post#index

  get 'posts/new' => 'posts#new'

  post 'posts/create' => 'posts#create'

  get 'posts/show/:id' => 'posts#show', as: 'post'

  get 'posts/edit/:id' => 'posts#edit'

  post 'posts/update/:id' => 'posts#update'

  delete 'posts/destroy/:id' => 'posts#destroy'

  post 'comments/create' => 'comments#create'

  post 'comments/destroy/:id' => 'comments#destroy'

  post 'posts/like/:id' => 'posts#like', as: 'post_like' # post_like_path
  post 'posts/dislike/:id' => 'posts#dislike', as: 'post_dislike' # post_dislike_path

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
