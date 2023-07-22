Mox.defmock(MyApp.ConfigMock, for: MyApp.Config.Adapter)
Application.put_env(:my_app, :config_adapter, MyApp.ConfigMock)

ExUnit.start()
