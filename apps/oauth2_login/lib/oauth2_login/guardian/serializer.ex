defmodule OAuth2Login.Guardian.Serializer do
  @behaviour Guardian.Serializer
 
  alias OAuth2Login.Repo
  alias OAuth2Login.User
 
  def for_token(user = %User{}), do: { :ok, "User:#{user.id}" }
  def for_token(_), do: { :error, "Unknown resource type" }
 
  def from_token("User:" <> id), do: { :ok, Repo.get(User, id) }
  def from_token(_), do: { :error, "Unknown resource type" }
end
