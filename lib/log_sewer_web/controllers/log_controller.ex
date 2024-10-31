defmodule LogSewerWeb.LogController do
  use LogSewerWeb, :controller

  def create(conn, params) do
    LogSewer.Sewer.handle(params)

    render(conn, :success)
  end
end
