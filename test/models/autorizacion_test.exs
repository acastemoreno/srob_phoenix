defmodule SrobPhoenix.AutorizacionTest do
  use SrobPhoenix.ModelCase

  alias SrobPhoenix.Autorizacion

  @valid_attrs %{expired_at: 42, provider: "some content", refresh_token: "some content", token: "some content", uid: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Autorizacion.changeset(%Autorizacion{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Autorizacion.changeset(%Autorizacion{}, @invalid_attrs)
    refute changeset.valid?
  end
end
