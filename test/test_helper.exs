ExUnit.start

defmodule Stroz.Case do
  use ExUnit.CaseTemplate
  alias Ecto.Adapters.SQL
  alias Stroz.Repo

  setup do
    SQL.restart_test_transaction(Repo)
    :ok
  end

  using do
    quote do
      alias Stroz.Repo
      alias Stroz.Event
      use Plug.Test

      # Remember to change this from `defp` to `def` or it can't be used in your
      # tests.
      def send_request(conn) do
        conn
        |> put_private(:plug_skip_csrf_protection, true)
        |> Stroz.Endpoint.call([])
      end
    end
  end

end


# Create the database, run migrations, and start the test transaction.
Mix.Task.run "ecto.create", ["--quiet"]
Mix.Task.run "ecto.migrate", ["--quiet"]
Ecto.Adapters.SQL.begin_test_transaction(Stroz.Repo)
