MiniBlog::Application.routes.draw do
  # seee http://guides.rubyonrails.org/routing.html

  root to: redirect('/blogs')

  scope format: 'html' do
    devise_for :users
    resources :blogs do
      resources :comments, only: [:create, :edit, :update, :destroy]
    end
  end
end
