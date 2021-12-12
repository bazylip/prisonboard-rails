Rails.application.routes.draw do
  root "main#index"

  get "/", to: "main#index"
  resources :companies do
    resources :job_offers
  end
  resources :inmates
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
