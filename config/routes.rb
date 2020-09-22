Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "cocktails#index"
  
  resources :cocktails, only: [:index, :show, :new, :create] do
    resources :doses, only: [:update, :delete]
  end

  post "doses", to: "doses#create"
  get "ingredients/:id/new", to: "doses#new", as: :new_dose
  
end
