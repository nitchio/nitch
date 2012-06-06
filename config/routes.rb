NitchApp::Application.routes.draw do
  constraints(subdomain: 'www') do
    resources :sessions, controller: 'user_sessions'
    resources :users

    match 'signup' => 'users#new', as: :signup
    match 'login' => 'user_sessions#new', as: :login
    match 'logout' => 'user_sessions#destroy', as: :logout

    match 'bar/:nitch_name'   => 'dashboard#bar', as: :nitch_bar
    root to: 'dashboard#index', as: :dashboard
  end

  constraints(subdomain: /.*/) do
    resources :archives, name_prefix: nil, path_prefix: nil, controller: 'nitch/archives'

    match 'a/:username/:slug' => 'nitch/archives#show', as: :archive
    match 'a/:username' => 'nitch/archives#index', as: :user_archives
    match 'a' => 'nitch/archives#index', as: :all_archives

    match 'follow' => 'nitch#follow', as: 'follow_nitch'

    root to: 'nitch#index', as: :nitch
  end
end
