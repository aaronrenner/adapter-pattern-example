defmodule MyApp.Config do
  @moduledoc """
  API for accessing the app's configuration
  """

  @behaviour MyApp.Config.Adapter

  @impl true
  def sms_gateway do
    adapter.sms_gateway()
  end

  defp adapter do
    Application.get_env(:my_app, :config_adapter, MyApp.Config.DefaultAdapter)
  end
end
