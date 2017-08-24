defmodule Hello.Default.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias Hello.Default.Post


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
end
