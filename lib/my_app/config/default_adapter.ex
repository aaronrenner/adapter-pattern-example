defmodule MyApp.Config.DefaultAdapter do
  @moduledoc false

  @behaviour MyApp.Config.Adapter

  @impl true
  def sms_gateway do
    Application.get_env(:my_app, :sms_adapter, MyApp.SMSGateway.DefaultAdapter)
  end
end
