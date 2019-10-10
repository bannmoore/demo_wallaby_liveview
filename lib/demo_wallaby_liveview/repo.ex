defmodule DemoWallabyLiveview.Repo do
  use Ecto.Repo,
    otp_app: :demo_wallaby_liveview,
    adapter: Ecto.Adapters.Postgres
end
