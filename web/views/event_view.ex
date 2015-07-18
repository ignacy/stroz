defmodule Stroz.EventView do
  use Stroz.Web, :view

  def render("index.json", %{events: events}) do
    events
  end

  def render("create.json", %{event: event}) do
    event
  end
end
