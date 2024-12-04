defmodule PersonalPageWeb.PageController do
  use PersonalPageWeb, :controller

  def home(conn, _params) do
    render(conn, :home, layout: false)
  end

  def knowledge_hub(conn, _params) do
    render(conn, :knowledge_hub, layout: false)
  end
end
