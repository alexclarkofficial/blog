defmodule StringGen do
  def random_string(length) do
    :crypto.strong_rand_bytes(length)
    |> Base.url_encode64
    |> binary_part(0, length)
  end
end

defmodule PhoenixBlog.PostTest do
  use PhoenixBlog.ModelCase

  alias PhoenixBlog.Post

  @valid_attrs %{content: StringGen.random_string(1000), title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes is valid" do
    changeset = Post.changeset(%Post{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes is not valid" do
    changeset = Post.changeset(%Post{}, @invalid_attrs)
    refute changeset.valid?
  end
end
