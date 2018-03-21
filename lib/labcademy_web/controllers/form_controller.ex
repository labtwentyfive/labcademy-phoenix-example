defmodule LabcademyWeb.FormController do
  use LabcademyWeb, :controller

  alias Labcademy.User
  alias Labcademy.Repo

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def create(conn, params) do
    user = %User{name: params["user_name"], email: params["user_mail"]}
    Repo.insert user

    conn
    |> put_flash(:info, "Folgende daten wurden gesendet: #{inspect params}")
    |> render("index.html")
  end

  def create(conn, %{"user_name" => user_name}) do
    conn
    |> put_flash(:info, "Super, danke #{user_name}")
    |> render("index.html", asdfasdf: DateTime.utc_now, foo: "bar")
  end
end
