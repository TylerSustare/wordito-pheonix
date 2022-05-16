defmodule WorditoWeb.PageController do
  require IEx
  use WorditoWeb, :controller

  def index(conn, _params) do
    IEx.pry()
    render(conn, "index.html")
  end
end
