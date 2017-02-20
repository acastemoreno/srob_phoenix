defmodule SrobPhoenix.AuthController do
  use SrobPhoenix.Web, :controller
  plug Ueberauth
  alias Ueberauth.Strategy.Helpers
  alias SrobPhoenix.Usuario
  alias Ueberauth.Auth
  alias SrobPhoenix.UserFromAuth
  import Ecto.Changeset, only: [add_error: 3, change: 2]

  def request(conn, _params) do
    changeset = Usuario.changeset_identity_new(%SrobPhoenix.Usuario{})
    conn
      |> put_layout(false)
      |> render("login.html", callback_url: Helpers.callback_url(conn), changeset: changeset)
  end

  def callback(%{assigns: %{ueberauth_failure: _fails}} = conn, _params) do
    conn
    |> put_flash(:error, "Fallo en Autenticar.")
    |> redirect(to: auth_path(conn, :request, "login"))
  end

  def callback(%{assigns: %{ueberauth_auth: %Auth{provider: :identity} = auth}} = conn, %{"usuario" => user_param}) do
    case UserFromAuth.find(auth) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Correctamente logueado.")
        |> put_session(:current_user, user)
        |> redirect(to: "/")
      {:error, reason} ->
        changeset = Usuario.changeset_identity_new(%Usuario{}, user_param)
          |> add_error(:email, "Error")
          |> add_error(:password, "Error")
        changeset = %{changeset | action: :insert}
        IO.inspect changeset
        conn
        |> put_layout(false)
        |> put_flash(:danger, reason)
        |> render("login.html", callback_url: Helpers.callback_url(conn), changeset: changeset)
    end
  end

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    case UserFromAuth.find_or_create(auth) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Correctamente logueado.")
        |> put_session(:current_user, user)
        |> redirect(to: "/")
      {:error, reason} ->
        conn
        |> put_flash(:error, reason)
        |> redirect(to: "/")
    end
  end
end
