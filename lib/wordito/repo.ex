defmodule Wordito.Repo do
  use Ecto.Repo,
    otp_app: :wordito,
    adapter: Ecto.Adapters.Postgres
end
