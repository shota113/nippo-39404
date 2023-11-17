Rails.application.routes.draw do
  devise_for :users
  root to: "diaries#index"
  resources :diaries, only: [:index, :create, :new, :show, :edit, :update, :destroy]
end
