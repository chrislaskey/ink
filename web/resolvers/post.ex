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

  def create(params, _info) do
    %Post{}
    |> Post.changeset(params)
    |> Repo.insert
  end

  def update(%{id: id, post: post_params}, _info) do
    Repo.get!(Post, id)
    |> Post.changeset(post_params)
    |> Repo.update
  end

  def delete(%{id: id}, _info) do
    post = Repo.get!(Post, id)
    Repo.delete(post)
  end
end
