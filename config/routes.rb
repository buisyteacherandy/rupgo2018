  Rails.application.routes.draw do
  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  get 'uploads/create'
  post 'uploads' => 'uploads#create'
  resources :regions
  get "/route", to: "payments#route"
  delete "/route", to: "payments#destroy"
  get "/buys", to: "payments#buys"	
  get "payments/express"
  get "transactions/checkout"
  resources :payments
  resources :searches

  scope ":locale", locale: /#{I18n.available_locales.join("|")}/ do
    resources :deals do
      resources :questions, only: [:create, :destroy, :update]  
    end
    match '*path', to: redirect("/#{I18n.default_locale}/%{path}"), via: :get
    match '', to: redirect("/#{I18n.default_locale}"), via: :get
  end    
      
  
  resources :categories 
  resources :destinations do
    resources :comments, only: [:create, :destroy, :update] 
  end
 get 'welcome/index'
 root 'destinations#index'

 get "/dashboard", to: "welcome#dashboard"

 put "/destinations/:id/publish", to: "destinations#publish"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

