Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      get '/search', to: 'search#create'
    end
  end
end
