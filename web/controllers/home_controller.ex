defmodule SrobPhoenix.HomeController do
  use SrobPhoenix.Web, :controller

  def index(conn, _params) do
    render conn, "index.html", css: true, js: true
  end

  def nosotros(conn, _params) do
    render conn, "nosotros.html", css: true
  end

  def directiva(conn, _params) do
    render conn, "directiva.html", css: true
  end
end
