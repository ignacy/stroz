defmodule Stroz.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :type
      add :message
      add :details
      timestamps
    end
  end
end
