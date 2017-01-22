defmodule SrobPhoenix.Contacto do
  use SrobPhoenix.Web, :model

  schema "contacto" do
    field :nombre, :string, virtual: true
    field :email, :string, virtual: true
    field :mensaje, :string, virtual: true
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:nombre, :email, :mensaje])
    |> validate_required([:nombre, :email, :mensaje])
    |> validate_format(:email, ~r/@/)
  end
end
