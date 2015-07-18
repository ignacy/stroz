defmodule Stroz.EventController do
  use Stroz.Web, :controller
  alias Stroz.Event

  def index(conn, _params) do
    events = Repo.all(Event)
    render conn, events: events
  end
end
