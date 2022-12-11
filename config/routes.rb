Rails.application.routes.draw do
  root 'home#top'
  namespace :users do
    resource :dash_boards, only: :show, as: :root
    resources :articles

  end
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }
  
  


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
