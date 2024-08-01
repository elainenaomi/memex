defmodule Memex.Memes.Meme do
  use Ecto.Schema
  import Ecto.Changeset

  schema "memes" do
    field :name, :string
    field :link, :string
    field :description, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(meme, attrs) do
    meme
    |> cast(attrs, [:name, :link, :description])
    |> validate_required([:name, :link, :description])
  end
end
