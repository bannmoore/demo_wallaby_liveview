defmodule DemoWallabyLiveviewWeb.Browser.HappyTest do
  use DemoWallabyLiveviewWeb.FeatureCase, async: false

  import Wallaby.Query, only: [link: 1]

  @moduletag :ui

  test "should navigate to the home page", %{session: session} do
    session
    |> visit("/")

    assert page_source(session) =~ "Listing Tasks"
  end

  test "should navigate to the counter page", %{session: session} do
    session
    |> visit("/")
    |> click(link("Counter"))

    assert page_source(session) =~ "Counter"
  end
end
