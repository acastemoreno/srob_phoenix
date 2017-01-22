defmodule SrobPhoenix.HomeController do
  use SrobPhoenix.Web, :controller
  alias SrobPhoenix.Contacto
  alias SrobPhoenix.Mailer

  def index(conn, _params) do
    render conn, "index.html", css: true, js: true
  end

  def nosotros(conn, _params) do
    render conn, "nosotros.html", css: true
  end

  def directiva(conn, _params) do
    render conn, "directiva.html", css: true
  end

  def contacto(conn, _params) do
    changeset = Contacto.changeset(%Contacto{})
    render conn, "contacto.html", changeset: changeset, css: true
  end

  def contacto_post(conn, %{"contacto" => %{"email" => email, "mensaje" => mensaje, "nombre" => nombre} = contacto_params}) do
    changeset = %{Contacto.changeset(%Contacto{}, contacto_params) | action: :insert}
    IO.inspect changeset
    case changeset.valid? do
      true ->
        SrobPhoenix.Email.contacto_email(email, mensaje, nombre)
          |> Mailer.deliver_later
        conn
        |> put_flash(:info, "Correo enviado exitosamente.")
        |> redirect(to: home_path(conn, :contacto))
      false ->
        render conn, "contacto.html", changeset: changeset, css: true
    end
  end
end
