defmodule SrobPhoenix.PageController do
  use SrobPhoenix.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
