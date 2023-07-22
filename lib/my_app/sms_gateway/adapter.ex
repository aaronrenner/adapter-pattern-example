defmodule MyApp.SMSGateway.Adapter do
  @moduledoc false

  alias MyApp.SMSGateway
  alias MyApp.SMSGateway.DeliveryError

  @callback send_sms(SMSGateway.phone_number(), SMSGateway.message()) ::
              {:ok, SMSGateway.message_id()} | {:error, DeliveryError.t()}
end
