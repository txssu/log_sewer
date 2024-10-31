defmodule LogSewerWeb.LogJSON do
  def success(_assigns) do
    %{error: nil, value: %{success: true}}
  end
end
