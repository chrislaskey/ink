defmodule Ink.Label do
  use Ink.Web, :model

  schema "labels" do
    field :name, :string
    field :color, :string
    belongs_to :user, Ink.User
    many_to_many :posts, Ink.Note, join_through: "labels_posts"

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:color, :name, :user_id])
    |> validate_required([:name, :user_id])
  end
end
