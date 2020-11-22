defmodule GetawaysWeb.AuthToken do
  @user_salt "user auth salt"

  def sign(user) do
    Phoenix.Token.sign(GetawaysWeb.Endpoint, @user_salt, %{id: user.id})
  end

  def verify(token) do
    Phoenix.Token.verify(GetawayWeb.Endpoint, @user_salt, token, [
      max_age: 365 * 24 * 3600
    ])
  end
end
