defmodule Memex.MemesTest do
  use Memex.DataCase

  alias Memex.Memes

  describe "memes" do
    alias Memex.Memes.Meme

    import Memex.MemesFixtures

    @invalid_attrs %{name: nil, link: nil, description: nil}

    test "list_memes/0 returns all memes" do
      meme = meme_fixture()
      assert Memes.list_memes() == [meme]
    end

    test "get_meme!/1 returns the meme with given id" do
      meme = meme_fixture()
      assert Memes.get_meme!(meme.id) == meme
    end

    test "create_meme/1 with valid data creates a meme" do
      valid_attrs = %{name: "some name", link: "some link", description: "some description"}

      assert {:ok, %Meme{} = meme} = Memes.create_meme(valid_attrs)
      assert meme.name == "some name"
      assert meme.link == "some link"
      assert meme.description == "some description"
    end

    test "create_meme/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Memes.create_meme(@invalid_attrs)
    end

    test "update_meme/2 with valid data updates the meme" do
      meme = meme_fixture()
      update_attrs = %{name: "some updated name", link: "some updated link", description: "some updated description"}

      assert {:ok, %Meme{} = meme} = Memes.update_meme(meme, update_attrs)
      assert meme.name == "some updated name"
      assert meme.link == "some updated link"
      assert meme.description == "some updated description"
    end

    test "update_meme/2 with invalid data returns error changeset" do
      meme = meme_fixture()
      assert {:error, %Ecto.Changeset{}} = Memes.update_meme(meme, @invalid_attrs)
      assert meme == Memes.get_meme!(meme.id)
    end

    test "delete_meme/1 deletes the meme" do
      meme = meme_fixture()
      assert {:ok, %Meme{}} = Memes.delete_meme(meme)
      assert_raise Ecto.NoResultsError, fn -> Memes.get_meme!(meme.id) end
    end

    test "change_meme/1 returns a meme changeset" do
      meme = meme_fixture()
      assert %Ecto.Changeset{} = Memes.change_meme(meme)
    end
  end
end
