defmodule DemoWallabyLiveviewWeb.LiveTasks do
  @moduledoc """
  """

  alias DemoWallabyLiveviewWeb.TaskView
  alias DemoWallabyLiveview.ToDoLists

  use Phoenix.LiveView

  @impl true
  def render(assigns) do
    TaskView.render("index.live.html", assigns)
  end

  @impl true
  def mount(%{tasks: tasks}, socket) do
    state = %{
      tasks: tasks
    }

    {:ok, assign(socket, state)}
  end
end
