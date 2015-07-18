defmodule Stroz.EventView do
  use Stroz.Web, :view

  def render("index.json", %{events: events}) do
    events
  end
end
