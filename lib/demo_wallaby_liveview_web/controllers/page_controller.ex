defmodule DemoWallabyLiveviewWeb.PageController do
  use DemoWallabyLiveviewWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
