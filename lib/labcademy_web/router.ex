defmodule LabcademyWeb.Router do
  use LabcademyWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LabcademyWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/form", FormController, :index
    post "/form", FormController, :create

    get "/users", UserController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", LabcademyWeb do
  #   pipe_through :api
  # end
end
