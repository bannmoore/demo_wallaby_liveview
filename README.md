# DemoWallabyLiveview

This repository demonstrates an issue with Wallaby and a certain type of LiveView component: namely, one that interacts with the database in its `mount` function.

Prerequisites: Your machine needs to have Elixir, Erlang, Node, PostgreSQL, and Phoenix. If you've never run a Phoenix app locally, check out [this installation guide](https://hexdocs.pm/phoenix/installation.html).

First, get the code and run first-time setup:

```
git clone git@github.com:bannmoore/demo_wallaby_liveview.git
cd demo_wallaby_liveview
mix deps.get
mix ecto.setup
cd assets && npm install
```

Then, run the Wallaby tests:

```
mix test --only ui
```

While these tests should always pass, they will intermittently flash a `DBConnection.Holder.checkout` error:

```
.15:53:55.266 [error] GenServer #PID<0.548.0> terminating
** (stop) exited in: DBConnection.Holder.checkout(#PID<0.537.0>, [log: #Function<11.92802362/1 in Ecto.Adapters.SQL.with_log/3>, source: "tasks", timeout: 15000, pool_size: 10, pool: DBConnection.Ownership])
    ** (EXIT) shutdown: "owner #PID<0.536.0> exited"
    (db_connection) lib/db_connection/holder.ex:87: DBConnection.Holder.checkout/2
    (db_connection) lib/db_connection/holder.ex:68: DBConnection.Holder.checkout/2
    (db_connection) lib/db_connection.ex:1030: DBConnection.checkout/3
    (db_connection) lib/db_connection.ex:1340: DBConnection.run/6
    (db_connection) lib/db_connection.ex:596: DBConnection.execute/4
    (ecto_sql) lib/ecto/adapters/postgres/connection.ex:80: Ecto.Adapters.Postgres.Connection.execute/4
    (ecto_sql) lib/ecto/adapters/sql.ex:580: Ecto.Adapters.SQL.execute!/4
    (ecto_sql) lib/ecto/adapters/sql.ex:562: Ecto.Adapters.SQL.execute/5
    (ecto) lib/ecto/repo/queryable.ex:177: Ecto.Repo.Queryable.execute/4
    (ecto) lib/ecto/repo/queryable.ex:17: Ecto.Repo.Queryable.all/3
    (demo_wallaby_liveview) lib/demo_wallaby_liveview_web/live/live_tasks.ex:17: DemoWallabyLiveviewWeb.LiveTasks.mount/2
    (phoenix_live_view) lib/phoenix_live_view/view.ex:520: Phoenix.LiveView.View.maybe_call_mount!/3
    (phoenix_live_view) lib/phoenix_live_view/channel.ex:501: Phoenix.LiveView.Channel.verified_mount/4
    (phoenix_live_view) lib/phoenix_live_view/channel.ex:28: Phoenix.LiveView.Channel.handle_info/2
    (stdlib) gen_server.erl:637: :gen_server.try_dispatch/4
    (stdlib) gen_server.erl:711: :gen_server.handle_msg/6
    (stdlib) proc_lib.erl:249: :proc_lib.init_p_do_apply/3
Last message: {:mount, Phoenix.LiveView.Channel}
15:53:55.266 [error] exited in: DBConnection.Holder.checkout(#PID<0.537.0>, [log: #Function<11.92802362/1 in Ecto.Adapters.SQL.with_log/3>, source: "tasks", timeout: 15000, pool_size: 10, pool: DBConnection.Ownership])
    ** (EXIT) shutdown: "owner #PID<0.536.0> exited"
.
```

## Commands Used to Build This App

```
mix phx.new demo_wallaby_liveview
cd demo_wallaby_liveview

mix deps.get
mix ecto.setup
cd assets && npm install
cd ..

mix phx.gen.html ToDoLists Task tasks name:string
```