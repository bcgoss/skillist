Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      get '/search', to: 'search#create'
    end
  end
<<<<<<< Updated upstream
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
=======
>>>>>>> Stashed changes
end
