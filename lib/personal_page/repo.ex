defmodule PersonalPage.Repo do
  use Ecto.Repo,
    otp_app: :personal_page,
    adapter: Ecto.Adapters.Postgres
end
