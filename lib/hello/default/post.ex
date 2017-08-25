defmodule Hello.Default.Post do
  use Ecto.Schema
  alias Hello.Default.Post
  import Ecto.Query
  import Ecto.Changeset

  schema "posts" do
    field :body, :string
    field :title, :string

    has_many :comments, Hello.Default.Comment
    timestamps()
  end

  @doc false
  def changeset(%Post{} = post, attrs) do
    post
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
  end

  def count_comments(query) do
    from p in query,
      group_by: p.id,
      left_join: c in assoc(p, :comments),
      select: {p, count(c.id)}
  end
end
