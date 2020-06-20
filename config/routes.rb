Rails.application.routes.draw do
  root 'homes#top'
  get 'home/about' => 'homes#about'
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show, :index, :edit,:create,:update]
  resources :books, only: [:show, :index, :edit,:create,:update]
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
  
 
end
