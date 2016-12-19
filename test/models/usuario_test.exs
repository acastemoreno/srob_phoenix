defmodule SrobPhoenix.UsuarioTest do
  use SrobPhoenix.ModelCase

  alias SrobPhoenix.Usuario

  @valid_attrs %{email: "some content", nombre: "some content", roles: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Usuario.changeset(%Usuario{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Usuario.changeset(%Usuario{}, @invalid_attrs)
    refute changeset.valid?
  end
end
