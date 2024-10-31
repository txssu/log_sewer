defmodule LogSewerWeb.LogController do
  use LogSewerWeb, :controller

  @spec create(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def create(conn, params) do
    LogSewer.Sewer.handle(params)

    render(conn, :success)
  end
end
