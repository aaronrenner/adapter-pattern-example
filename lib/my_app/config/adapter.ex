defmodule MyApp.Config.Adapter do
  @moduledoc false

  @callback sms_gateway :: module
end
