defmodule LogSewer.Sewer do
  @moduledoc false

  def handle(params) do
    Task.async(fn ->
      app_name = params["app_name"]
      message = params["message"]

      message = """
      App: `#{app_name}`
      ```plaintext
      #{message}
      ```
      """

      LogSewer.TelegramClient.send_message(message)
    end)
  end
end
