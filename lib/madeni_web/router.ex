defmodule MadeniWeb.Router do
  use MadeniWeb, :router

  import MadeniWeb.UserAuth

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {MadeniWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :fetch_current_user
  end

  pipeline :admin do
    plug MadeniWeb.AdminPlug
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MadeniWeb do
    pipe_through :browser

    get "/", PageController, :home
  end

  # Other scopes may use custom stacks.
  # scope "/api", MadeniWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:madeni, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: MadeniWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end

  ## Authentication routes

  scope "/", MadeniWeb do
    pipe_through [:browser]

    scope "/users" do
      pipe_through [:redirect_if_user_is_authenticated]
      get "/register", UserRegistrationController, :new
      post "/register", UserRegistrationController, :create
      get "/log_in", UserSessionController, :new
      post "/log_in", UserSessionController, :create
      get "/reset_password", UserResetPasswordController, :new
      post "/reset_password", UserResetPasswordController, :create
      get "/reset_password/:token", UserResetPasswordController, :edit
      put "/reset_password/:token", UserResetPasswordController, :update
    end

    scope "/admin" do
      pipe_through [:admin]
      get "/", AdminController, :index

      resources "/products", ProductController
    end
  end

  scope "/", MadeniWeb do
    pipe_through [:browser, :require_authenticated_user]

    get "/users/settings", UserSettingsController, :edit
    put "/users/settings", UserSettingsController, :update
    get "/users/settings/confirm_email/:token", UserSettingsController, :confirm_email
  end

  scope "/", MadeniWeb do
    pipe_through [:browser]

    delete "/users/log_out", UserSessionController, :delete
    get "/users/confirm", UserConfirmationController, :new
    post "/users/confirm", UserConfirmationController, :create
    get "/users/confirm/:token", UserConfirmationController, :edit
    post "/users/confirm/:token", UserConfirmationController, :update
  end
end
