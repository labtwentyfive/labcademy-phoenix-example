defmodule LabcademyWeb.UserController do
    use LabcademyWeb, :controller

    alias Labcademy.User
    alias Labcademy.Repo

    import Ecto.Query

    def index(conn, _params) do
        users = Repo.all(from(u in User))

        render(conn, "index.html", [users: users])
    end

    def show(conn, params) do
        id    = params["id"]

        users = Repo.all(from(u in User, where: u.id == ^id))
        user  = List.first(users)

        render(conn, "show.html", [user: user])
    end

    def delete(conn, params) do
        id = params["id"]

        user = Repo.get!(User, id)
        case Repo.delete(user) do
            {:ok, _struct} ->
                conn
                |> put_flash(:info, "Eintrag gelöscht")
                |> redirect(to: "/users")

            {:error, _changeset} ->
                conn
                |> put_flash(:error, "Eintrag löschen hat nicht geklappt")
                |> redirect(to: "/users")
        end
    end
end
