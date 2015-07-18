defmodule Stroz.EventController do
  use Stroz.Web, :controller
  alias Stroz.Event

  plug :scrub_params, "event" when action in [:create]

  def index(conn, _params) do
    events = Repo.all(Event)
    render conn, events: events
  end

  def create(conn, %{"event" => event_params}) do
    event = Event.changeset(%Event{}, event_params)
    if event.valid? do
      Repo.insert!(event)
      render conn, event: event
    else
      render conn, event: event
    end
  end
end
