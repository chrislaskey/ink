defmodule Ink.Resolver.Post do
  alias Ink.Repo
  alias Ink.Post

  def all(_args, _info) do
    {:ok, Repo.all(Post)}
  end

  def find(%{id: id}, _info) do
    case Repo.get(Post, id) do
      nil -> {:error, "Post id #{id} not found"}
      post -> {:ok, post}
    end
  end

  def create(args, _info) do
    %Post{}
    |> Post.changeset(args)
    |> Repo.insert
  end

  def update(%{id: id, post: params}, _info) do
    Repo.get!(Post, id)
    |> Post.changeset()
    |> Repo.update
  end
end
