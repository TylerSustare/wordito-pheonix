defmodule Wordito.Repo do
  use Ecto.Repo,
    otp_app: :wordito,
    adapter: Ecto.Adapters.SQLite3
end
