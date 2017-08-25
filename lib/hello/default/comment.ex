defmodule Hello.Default.Comment do
  use Ecto.Schema
  import Ecto.Changeset
  alias Hello.Default.Comment


  schema "comments" do
    field :content, :string
    field :name, :string
    belongs_to :post, Hello.Default.Post, foreign_key: :post_id #field :post_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Comment{} = comment, attrs \\ %{}) do
    comment
    |> cast(attrs, [:name, :content, :post_id])
    |> validate_required([:name, :content])
  end
end
