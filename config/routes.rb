Rails.application.routes.draw do
  resources :book_activities
  resources :books

  root 'book_activities#index'
end
