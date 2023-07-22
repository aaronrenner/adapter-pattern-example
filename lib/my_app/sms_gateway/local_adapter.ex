defmodule MyApp.SMSGateway.LocalAdapter do
  @moduledoc false

  @behaviour MyApp.SMSGateway.Adapter

  require Logger

  @impl true
  def send_sms(phone_number, message) do
    Logger.info("""
    SMS would be sent to #{phone_number}.

    #{message}
    """)

    {:ok, random_id()}
  end

  defp random_id do
    Base.encode64(:crypto.strong_rand_bytes(20))
  end
end
