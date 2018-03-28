Rails.application.routes.draw do
  get 'movies/comingsoon', to: 'movies#comingsoon'
  get 'movies/hot', to: 'movies#hot'
  get 'movies/weekly', to: 'movies#weekly'

  post '/', to: 'movies#index'

  get '*path' => redirect('/')

  root 'movies#index'
end
