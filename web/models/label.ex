defmodule Ink.Label do
  use Ink.Web, :model

  schema "labels" do
    field :name, :string
    belongs_to :user, Ink.User
    many_to_many :posts, Ink.Post, join_through: "labels_posts"

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :user_id])
    |> validate_required([:name, :user_id])
  end
end