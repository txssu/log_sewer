defmodule LogSewerWeb.HealthController do
  use LogSewerWeb, :controller

  def index(conn, _params) do
    render(conn, :success)
  end
end
