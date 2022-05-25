defmodule KompendiumWeb.HelloController do
  use KompendiumWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def who(conn, %{"who" => who} = params) do
    render(conn, "who.html", who: who)
  end
end