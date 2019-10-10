defmodule DemoWallabyLiveviewWeb.FeatureCase do
  @moduledoc """
  This module provides the configuration options for Wallaby.
  """
  use ExUnit.CaseTemplate

  using do
    quote do
      use Wallaby.DSL

      alias DemoWallabyLiveview.Repo
      import Ecto
      import Ecto.Changeset
      import Ecto.Query

      import DemoWallabyLiveviewWeb.Router.Helpers
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(DemoWallabyLiveview.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(DemoWallabyLiveview.Repo, {:shared, self()})
    end

    metadata = Phoenix.Ecto.SQL.Sandbox.metadata_for(DemoWallabyLiveview.Repo, self())
    {:ok, session} = Wallaby.start_session(metadata: metadata)
    {:ok, session: session}
  end
end
