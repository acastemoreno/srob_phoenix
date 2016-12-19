defmodule SrobPhoenix.Repo.Migrations.CreateAutorizacion do
  use Ecto.Migration

  def change do
    create table(:autorizaciones) do
      add :provider, :string
      add :uid, :string
      add :token, :string
      add :refresh_token, :string
      add :expired_at, :integer
      add :usuario_id, references(:usuarios, on_delete: :nothing)

      timestamps()
    end
    create index(:autorizaciones, [:usuario_id])

  end
end
