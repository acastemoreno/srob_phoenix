defmodule SrobPhoenix.Repo.Migrations.CreateUsuario do
  use Ecto.Migration

  def change do
    create table(:usuarios) do
      add :nombre, :string
      add :email, :string
      add :roles, :string

      timestamps()
    end

  end
end
