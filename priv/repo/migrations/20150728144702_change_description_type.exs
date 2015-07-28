defmodule Stroz.Repo.Migrations.ChangeDescriptionType do
  use Ecto.Migration

  def change do
    alter table(:events) do
      modify :details, :text
    end
  end
end
