defmodule LogSewerWeb.NaiveAuthPlug do
  @moduledoc false

  @behaviour Plug

  import Plug.Conn

  @impl Plug
  def init(opts), do: opts

  @impl Plug
  def call(conn, _opts) do
    with [token] <- get_req_header(conn, "x-log-sewer-token"),
         true <- verify(token) do
      conn
    else
      _ ->
        body = Jason.encode!(%{error: "UNAUTHORIZED", value: nil})

        conn
        |> put_resp_header("Content-Type", "application/json")
        |> send_resp(200, body)
        |> halt()
    end
  end

  defp verify(token), do: token == reference()

  defp reference, do: Application.fetch_env!(:log_sewer, __MODULE__)[:token]
end
