Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  
  resources :docs
  authenticated :user do
    root "docs#index", as: "authenticated_root" # this is another root in case that user sign in, they can see their docs and not all the docs
  end
  root 'welcome#index'
end
