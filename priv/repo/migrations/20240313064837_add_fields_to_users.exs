defmodule Madeni.Repo.Migrations.AddFieldsToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :first_name, :citext, null: false
      add :last_name, :citext, null: false
      add :id_number, :string, null: false
      add :gender, :string
      add :phone_number, :string, null: false
    end

    create index(:users, [:id_number], unique: true)
    create index(:users, [:phone_number])
  end
end
