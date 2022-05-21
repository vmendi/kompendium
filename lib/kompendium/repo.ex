defmodule Kompendium.Repo do
  use Ecto.Repo,
    otp_app: :kompendium,
    adapter: Ecto.Adapters.Postgres
end
