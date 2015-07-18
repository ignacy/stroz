defmodule Stroz.EventControllerTest do
  use Stroz.Case, async: false

  test "/index returns a list of contacts" do
    events_as_json =
      %Event{ type: "error", message: "Something went wrong", details: "Some info" }
    |> Repo.insert!
    |> List.wrap
    |> Poison.encode!

    response = conn(:get, "/api/events") |> send_request

    assert response.status == 200
    assert response.resp_body == events_as_json
  end
end
