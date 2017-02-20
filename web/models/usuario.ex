defmodule SrobPhoenix.Usuario do
  use SrobPhoenix.Web, :model

  schema "usuarios" do
    field :nombre, :string
    field :email, :string
    field :roles, :string
    field :password, :string, virtual: true
    has_many :autorizaciones, SrobPhoenix.Autorizacion

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset_identity_new(struct, params \\ %{}) do
    struct
    |> cast(params, [:nombre, :email, :roles, :password])
    |> validate_required([:nombre, :email, :roles, :password])
  end
end
