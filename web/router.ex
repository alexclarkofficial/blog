defmodule PhoenixBlog.Router do
  use PhoenixBlog.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhoenixBlog do
    pipe_through :browser # Use the default browser stack

    get "/", PostController, :index
    get "/login", SessionController, :new
    post "/login", SessionController, :create
    delete "/logout", SessionController, :delete

    resources "/posts", PostController
  end
end
