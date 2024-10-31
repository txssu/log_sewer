defmodule LogSewerWeb.HealthController do
  use LogSewerWeb, :controller

  @spec index(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def index(conn, _params) do
    render(conn, :success)
  end
end
