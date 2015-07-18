defmodule Stroz.EventController do
  use Stroz.Web, :controller
  alias Stroz.Event

  plug :scrub_params, "event" when action in [:create]

  def index(conn, _params) do
    events = Repo.all(Event)
    render conn, events: events
  end

  def create(conn, %{"event" => event_params}) do
    event = %Event{
      type: event_params["type"],
      message: event_params["message"],
      details: event_params["details"]
    }

    Repo.insert!(event)

    render conn, event: event
  end
end
