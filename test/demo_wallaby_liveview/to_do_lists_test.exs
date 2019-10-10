defmodule DemoWallabyLiveview.ToDoListsTest do
  use DemoWallabyLiveview.DataCase

  alias DemoWallabyLiveview.ToDoLists

  describe "tasks" do
    alias DemoWallabyLiveview.ToDoLists.Task

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def task_fixture(attrs \\ %{}) do
      {:ok, task} =
        attrs
        |> Enum.into(@valid_attrs)
        |> ToDoLists.create_task()

      task
    end

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert ToDoLists.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert ToDoLists.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      assert {:ok, %Task{} = task} = ToDoLists.create_task(@valid_attrs)
      assert task.name == "some name"
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ToDoLists.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      assert {:ok, %Task{} = task} = ToDoLists.update_task(task, @update_attrs)
      assert task.name == "some updated name"
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = ToDoLists.update_task(task, @invalid_attrs)
      assert task == ToDoLists.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = ToDoLists.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> ToDoLists.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = ToDoLists.change_task(task)
    end
  end
end
