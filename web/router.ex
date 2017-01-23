defmodule SrobPhoenix.Router do
  use SrobPhoenix.Web, :router

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

  scope "/", SrobPhoenix do
    pipe_through :browser # Use the default browser stack

    get "/", HomeController, :index
    get "/nosotros", HomeController, :nosotros
    get "/directiva", HomeController, :directiva
    get "/contacto", HomeController, :contacto
    post "/contacto", HomeController, :contacto_post
  end

  scope "/auth", SrobPhoenix do
    pipe_through :browser

    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback
    post "/login/callback", AuthController, :identity_callback
  end

  # Other scopes may use custom stacks.
  # scope "/api", SrobPhoenix do
  #   pipe_through :api
  # end
end
