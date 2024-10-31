defmodule LogSewerWeb.LogJSON do
  @spec success(any()) :: map()
  def success(_assigns) do
    %{error: nil, value: %{success: true}}
  end
end
