NitchApp::Application.routes.draw do
  resources :sessions

  match 'login' => 'user_session#new', as: :login
  match 'logout' => 'user_session#destroy', as: :logout

  match 'join' => 'nitch#join', as: 'join_nitch'

  root :to => 'nitch#home', as: 'home'
end
