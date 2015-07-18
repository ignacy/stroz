defmodule Stroz.Event do
  use Ecto.Model

  schema "events" do
    field :message
    field :event_type
    field :details

    timestamps
  end

  @required_params ~w(message event_type details)
  @optional_params ~w()

  def changeset(model, params) do
    model
    |> cast(params, @required_params, @optional_params)
  end
end
