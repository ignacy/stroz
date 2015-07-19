defmodule Stroz.HomeController do
  use Stroz.Web, :controller
  alias Stroz.Event

  def index(conn, _params) do
    events = Repo.all(Event)
    render conn, "index.html", events: events
  end
end
