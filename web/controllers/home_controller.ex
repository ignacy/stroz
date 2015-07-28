defmodule Stroz.HomeController do
  use Stroz.Web, :controller
  alias Stroz.Event

  def index(conn, _params) do
    query = from e in Event, order_by: [desc: e.inserted_at]
    events = Repo.all(query)
    render conn, "index.html", events: events
  end
end
