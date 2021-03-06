defmodule DemoWallabyLiveviewWeb.Router do
  use DemoWallabyLiveviewWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :put_layout, {DemoWallabyLiveviewWeb.LayoutView, :app}
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", DemoWallabyLiveviewWeb do
    pipe_through :browser

    get "/", TaskController, :index
    live("/counter", LiveCounter)

    resources "/tasks", TaskController
  end

  # Other scopes may use custom stacks.
  # scope "/api", DemoWallabyLiveviewWeb do
  #   pipe_through :api
  # end
end
