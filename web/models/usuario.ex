defmodule SrobPhoenix.Usuario do
  use SrobPhoenix.Web, :model

  schema "usuarios" do
    field :nombre, :string
    field :email, :string
    field :roles, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:nombre, :email, :roles])
    |> validate_required([:nombre, :email, :roles])
  end
end
