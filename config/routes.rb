Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get 'pages/about', as: 'about'
  
  # Routes principale pour Users et leur pets
  resources :users do
    resources :pets, shallow: true
  end
  
  # Routes pour les vétérinaires
  resources :vets do
    resources :vet_appointments, shallow: true
  end
  
  # Routes imbriquées pour les pets et leurs données associées
  resources :pets do
    resources :vaccinations
    resources :treatments
    resources :physical_records
    resources :nutritions
    resources :activities
    resources :vet_appointments
  end
  

  # Route pour les erreurs 404
  match '/404', to: 'errors#not_found', via: :all
  
  # Rediriger toutes les autres routes non trouvées vers la page 404
  match '*path', to: 'errors#not_found', via: :all
end




