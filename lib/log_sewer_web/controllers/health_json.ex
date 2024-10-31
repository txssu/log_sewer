defmodule LogSewerWeb.HealthJSON do
  @spec success(any()) :: map()
  def success(_assigns) do
    %{error: nil, value: %{success: true}}
  end
end
