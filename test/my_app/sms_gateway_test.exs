defmodule MyApp.SMSGatewayTest do
  use ExUnit.Case, async: true

  import ExUnit.CaptureLog

  alias MyApp.SMSGateway

  describe "with local adapter" do
    setup do
      Mox.stub(MyApp.ConfigMock, :sms_gateway, fn -> MyApp.SMSGateway.LocalAdapter end)

      :ok
    end

    test "successfully sending a message" do
      {result, log} =
        with_log(fn ->
          SMSGateway.send_sms("+15551239876", "Hello world")
        end)

      assert {:ok, _message_id} = result
      assert log =~ "Hello world"
    end
  end

  describe "with default adapter" do
    setup do
      Mox.stub(MyApp.ConfigMock, :sms_gateway, fn -> MyApp.SMSGateway.DefaultAdapter end)

      :ok
    end

    test "successfully sending a message"
  end
end
