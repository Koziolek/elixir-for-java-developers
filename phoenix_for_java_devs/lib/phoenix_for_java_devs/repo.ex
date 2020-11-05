defmodule PhoenixForJavaDevs.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_for_java_devs,
    adapter: Ecto.Adapters.Postgres
end
