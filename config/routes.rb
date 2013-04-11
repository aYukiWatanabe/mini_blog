MiniBlog::Application.routes.draw do

  # seee http://guides.rubyonrails.org/routing.html

  root to: redirect('/blogs')

  scope format: 'html' do

    # mount proc { [200, {'Content-Type' => 'text/plain'}, ['Hello, world']] } => 'hello_world'

    resources :blogs do
      resources :comments, only: [:create, :edit, :update, :destroy]
    end
  end
end
