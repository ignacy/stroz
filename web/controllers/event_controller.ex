defmodule Stroz.EventController do
  use Stroz.Web, :controller
  alias Stroz.Event
  import Ecto.Query

  plug :scrub_params, "event" when action in [:create]

  def index(conn, _params) do
    query = from e in Event, order_by: [desc: e.inserted_at]
    events = Repo.all(query)
    render conn, events: events
  end

  def show(conn, %{"id" => id}) do
    case Repo.get(Event, String.to_integer(id)) do
      event when is_map(event) ->
        render conn, "show.html", event: event
      _ ->
        redirect conn, to: home_path(conn, :index)
    end
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
