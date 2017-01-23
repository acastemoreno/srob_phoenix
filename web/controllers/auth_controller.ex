defmodule SrobPhoenix.AuthController do
  use SrobPhoenix.Web, :controller
  plug Ueberauth
  alias Ueberauth.Strategy.Helpers

  def request(conn, _params) do
    conn
      |> put_layout(false)
      |> render "login.html", callback_url: Helpers.callback_url(conn)
  end
end
