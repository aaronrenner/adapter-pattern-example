defmodule MyApp.SMSGateway do
  @moduledoc """
  Main API for sending SMS
  """

  alias MyApp.SMSGateway.DeliveryError

  @type phone_number :: String.t()
  @type message :: String.t()
  @type message_id :: String.t()

  @behaviour MyApp.SMSGateway.Adapter

  @doc """
  Send a SMS
  """
  @impl true
  @spec send_sms(phone_number, message) :: {:ok, message_id} | {:error, DeliveryError.t()}
  def send_sms(phone_number, message) do
    adapter().send_sms(phone_number, message)
  end

  defp adapter do
    Application.get_env(:my_app, :sms_adapter, MyApp.SMSGateway.DefaultAdapter)
  end
end
