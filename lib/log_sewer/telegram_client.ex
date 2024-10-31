defmodule LogSewer.TelegramClient do
  @moduledoc false
  def send_message(message) do
    ExGram.send_message(chat_id(), message, token: token(), parse_mode: "MarkdownV2")
  end

  defp token do
    config()[:token]
  end

  defp chat_id do
    config()[:chat_id]
  end

  defp config do
    Application.fetch_env!(:log_sewer, __MODULE__)
  end
end
