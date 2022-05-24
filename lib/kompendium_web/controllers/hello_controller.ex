defmodule KompendiumWeb.HelloController do
  use KompendiumWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end