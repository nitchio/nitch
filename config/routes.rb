NitchApp::Application.routes.draw do
  get "comments/show"

  get "posts/show"

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
    resources :posts, name_prefix: nil, path_prefix: nil, controller: 'nitch/posts'
    resources :comments, name_prefix: nil, path_prefix: nil, controller: 'nitch/comments'

    match 'a/:archive_key/:archive_slug/:post_key/:post_slug/:key' => 'nitch/comments#show', as: :comment
    match 'a/:archive_key/:archive_slug/:key/:slug' => 'nitch/posts#show', as: :post
    match 'a/:key/:slug' => 'nitch/archives#show', as: :archive
    match 'a' => 'nitch/archives#index', as: :all_archives

    match 'follow' => 'nitch#follow', as: 'follow_nitch'

    root to: 'nitch#show', as: :nitch
  end
end
