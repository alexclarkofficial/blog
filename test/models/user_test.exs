defmodule PhoenixBlog.UserTest do
  use PhoenixBlog.ModelCase

  alias PhoenixBlog.User

  @valid_attrs %{password: "some content", email: "test@test.test"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
