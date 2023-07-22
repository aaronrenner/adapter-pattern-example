defmodule MyApp.SMSGateway.DeliveryError do
  @moduledoc """
  Indicates there was a problem delivering a SMS
  """

  defexception [:reason]

  defdelegate new(opts), to: __MODULE__, as: :exception

  def message(error) do
    """
    an error occurred when attempting to deliver a SMS:

    #{inspect(error.reason)}
    """
  end
end
