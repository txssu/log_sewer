defmodule LogSewerWeb.Router do
  use LogSewerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug LogSewerWeb.NaiveAuthPlug
  end

  scope "/api", LogSewerWeb do
    pipe_through :api

    get "/health", HealthController, :index

    post "/logs", LogController, :create
  end

  # Enable LiveDashboard in development
  if Application.compile_env(:log_sewer, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: LogSewerWeb.Telemetry
    end
  end
end
