defmodule ExrestWeb.PostController do
  use ExrestWeb, :controller
  alias Exrest.Posts
  alias Exrest.Posts.Post
  alias ExrestWeb.Utils
  def ping(conn, _params) do
    render(conn, "ack.json", %{success: true, message: "pong"})
  end

  def create(conn, params) do
    IO.inspect(params)
    res = params |> Posts.create_post()
    case res do
      {:ok, %Post{}=_post} ->
          render(conn, "ack.json", %{success: true, message: "post created"})
      {:error, %Ecto.Changeset{} = changeset} ->
        IO.inspect(changeset)
        render(conn, "errors.json", %{errors: Utils.format_changeset_errors(changeset)})

      _ -> conn |> render("error", %{error: Utils.internal_server_error()})
    end
  end

  def get_all(conn, _params) do
    render(conn,"data.json", %{success: true, data: Posts.list_posts()})
  end
end
