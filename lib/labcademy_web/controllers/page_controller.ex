defmodule LabcademyWeb.PageController do
  use LabcademyWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
