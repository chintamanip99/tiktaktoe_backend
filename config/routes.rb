Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users ,controllers: {
    sessions: 'overrides/login'
  }
  mount ActionCable.server => '/cable'
  post :auth, to: 'authentication#create'
  get  '/auth' => 'authentication#fetch'
  resource :game
  resource :move
  get '/fetch_moves' => 'moves#fetch_moves'
  get '/fetch_game' => 'games#fetch_game'
  get '/fetch_games' => 'games#fetch_games'
  post '/users/signup' => 'registration#create'
end
