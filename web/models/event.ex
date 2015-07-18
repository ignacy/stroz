defmodule Stroz.Event do
  use Ecto.Model

  schema "events" do
    field :type
    field :message
    field :details

    timestamps
  end
end
