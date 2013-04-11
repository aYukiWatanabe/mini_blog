MiniBlog::Application.routes.draw do
  root to: redirect('/blogs')

  scope format: 'html' do

    # mount proc { [200, {'Content-Type' => 'text/plain'}, ['Hello, world']] } => 'hello_world'
    # get 'hello_world' => 'greeting#hello_world'

    resources :blogs do
      resources :comments, only: [:create, :edit, :update, :destroy]
    end
  end
end
