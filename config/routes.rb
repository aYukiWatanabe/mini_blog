MiniBlog::Application.routes.draw do
  devise_for :users

  # seee http://guides.rubyonrails.org/routing.html

  root to: redirect('/blogs')

  scope format: 'html' do
    resources :blogs do
      resources :comments, only: [:create, :edit, :update, :destroy]
    end
  end
end
