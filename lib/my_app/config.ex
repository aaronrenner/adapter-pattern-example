defmodule MyApp.Config do
  @moduledoc """
  API for accessing the app's configuration
  """

  @spec sms_gateway :: module
  def sms_gateway do
    Application.get_env(:my_app, :sms_adapter, MyApp.SMSGateway.DefaultAdapter)
  end
end
