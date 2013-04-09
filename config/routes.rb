MiniBlog::Application.routes.draw do
  root to: redirect('/blogs')

  scope format: 'html' do
    resources :blogs do
      resources :comments, only: [:create, :edit, :update, :destroy]
    end
  end
end
