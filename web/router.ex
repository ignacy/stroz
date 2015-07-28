defmodule Stroz.Router do
  use Stroz.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Stroz do
    pipe_through :browser # Use the default browser stack

    get "/", HomeController, :index
    get "/event/:id", EventController, :show
  end


  scope "/api", Stroz do
    pipe_through :api

    resources "/events", EventController
  end
end
