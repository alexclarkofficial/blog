defmodule PhoenixBlog.SessionController do
  use PhoenixBlog.Web, :controller

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, %{"session" => session_params}) do
    case PhoenixBlog.Session.login(session_params, PhoenixBlog.Repo) do
      {:ok, user} ->
        conn
        |> put_session(:current_user, user.id)
        |> put_flash(:info, "Welcome")
        |> redirect(to: "/")
      :error ->
        conn
        |> put_flash(:info, "Wrong password bruh")
        |> render("new.html")
    end
  end

  def delete(conn, _) do
    conn
    |> delete_session(:current_user)
    |> put_flash(:info, "Logged out bro!")
    |> redirect(to: "/")
  end
end
