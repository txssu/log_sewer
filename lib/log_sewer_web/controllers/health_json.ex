defmodule LogSewerWeb.HealthJSON do
  def success(_assigns) do
    %{error: nil, value: %{success: true}}
  end
end
