defmodule DemoWallabyLiveviewWeb.PageControllerTest do
  use DemoWallabyLiveviewWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Listing Tasks"
  end
end
