defmodule Memex.MemesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Memex.Memes` context.
  """

  @doc """
  Generate a meme.
  """
  def meme_fixture(attrs \\ %{}) do
    {:ok, meme} =
      attrs
      |> Enum.into(%{
        description: "some description",
        link: "some link",
        name: "some name"
      })
      |> Memex.Memes.create_meme()

    meme
  end
end
