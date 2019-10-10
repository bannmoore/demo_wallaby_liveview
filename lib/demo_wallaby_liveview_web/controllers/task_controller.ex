defmodule DemoWallabyLiveviewWeb.TaskController do
  use DemoWallabyLiveviewWeb, :controller

  alias DemoWallabyLiveview.ToDoLists
  alias DemoWallabyLiveview.ToDoLists.Task

  def index(conn, _params) do
    # tasks = ToDoLists.list_tasks()
    # render(conn, "index.html", tasks: tasks)

    render(conn, "index.html")
  end

  def new(conn, _params) do
    changeset = ToDoLists.change_task(%Task{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"task" => task_params}) do
    case ToDoLists.create_task(task_params) do
      {:ok, task} ->
        conn
        |> put_flash(:info, "Task created successfully.")
        |> redirect(to: Routes.task_path(conn, :show, task))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    task = ToDoLists.get_task!(id)
    render(conn, "show.html", task: task)
  end

  def edit(conn, %{"id" => id}) do
    task = ToDoLists.get_task!(id)
    changeset = ToDoLists.change_task(task)
    render(conn, "edit.html", task: task, changeset: changeset)
  end

  def update(conn, %{"id" => id, "task" => task_params}) do
    task = ToDoLists.get_task!(id)

    case ToDoLists.update_task(task, task_params) do
      {:ok, task} ->
        conn
        |> put_flash(:info, "Task updated successfully.")
        |> redirect(to: Routes.task_path(conn, :show, task))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", task: task, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    task = ToDoLists.get_task!(id)
    {:ok, _task} = ToDoLists.delete_task(task)

    conn
    |> put_flash(:info, "Task deleted successfully.")
    |> redirect(to: Routes.task_path(conn, :index))
  end
end
