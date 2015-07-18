defmodule Stroz.Event do
  use Ecto.Model

  schema "events" do
    field :type
    field :message
    field :details

    timestamps
  end

  @required_fields ~w(type message details)
  @optional_fields ~w()
end
