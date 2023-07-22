defmodule MyApp.SMSGateway.DefaultAdapter do
  @moduledoc false

  alias MyApp.SMSGateway.DeliveryError

  @behaviour MyApp.SMSGateway.Adapter

  @impl true
  def send_sms(phone_number, message) do
    case TwilioClient.send_message(phone_number, message) do
      {:ok, %{message_id: message_id}} ->
        {:ok, message_id}

      {:error, reason} ->
        {:error, DeliveryError.new(reason: reason)}
    end
  end
end
