defmodule Stroz.PageController do
  use Stroz.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
