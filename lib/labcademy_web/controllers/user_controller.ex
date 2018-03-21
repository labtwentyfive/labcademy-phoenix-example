defmodule LabcademyWeb.UserController do
    use LabcademyWeb, :controller

    alias Labcademy.User
    alias Labcademy.Repo

    def index(conn, _params) do
        users = Repo.all User

        render(conn, "index.html", [users: users])    
    end
end