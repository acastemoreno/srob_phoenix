defmodule SrobPhoenix.UserFromAuth do
  alias Ueberauth.Auth
  alias SrobPhoenix.Usuario
  alias SrobPhoenix.Repo
  alias SrobPhoenix.Autorizacion
  import Ecto, only: [assoc: 2]
  import Ecto.Query, only: [where: 2]

  def find(auth) do
    Repo.get_by(Usuario, email: String.downcase(auth.info.email))
    |> existe_usuario?
    |> autorizacion?(auth.credentials.other.password)
  end

  def existe_usuario?(nil), do: {:error, "Usuario y contraseña no corresponden"}
  def existe_usuario?(user), do: {:ok, user}

  def autorizacion?({:error, _} = error, _password), do: error
  def autorizacion?({:ok, user}, password) do
    user
      |> assoc(:autorizaciones)
      |> where(provider: "identity")
      |> Repo.one
      |> verificar_password(password)
  end

  def verificar_password(nil, _password), do: {:error, "No tiene contraseña vinculada"}
  def verificar_password(%Autorizacion{}=autorizacion) do

  end

end
