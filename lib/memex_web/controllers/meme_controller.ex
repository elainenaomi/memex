defmodule MemexWeb.MemeController do
  use MemexWeb, :controller

  alias Memex.Memes
  alias Memex.Memes.Meme

  def index(conn, _params) do
    memes = Memes.list_memes()
    render(conn, :index, memes: memes)
  end

  def new(conn, _params) do
    changeset = Memes.change_meme(%Meme{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"meme" => meme_params}) do
    case Memes.create_meme(meme_params) do
      {:ok, meme} ->
        conn
        |> put_flash(:info, "Meme created successfully.")
        |> redirect(to: ~p"/memes/#{meme}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    meme = Memes.get_meme!(id)
    render(conn, :show, meme: meme)
  end

  def edit(conn, %{"id" => id}) do
    meme = Memes.get_meme!(id)
    changeset = Memes.change_meme(meme)
    render(conn, :edit, meme: meme, changeset: changeset)
  end

  def update(conn, %{"id" => id, "meme" => meme_params}) do
    meme = Memes.get_meme!(id)

    case Memes.update_meme(meme, meme_params) do
      {:ok, meme} ->
        conn
        |> put_flash(:info, "Meme updated successfully.")
        |> redirect(to: ~p"/memes/#{meme}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, meme: meme, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    meme = Memes.get_meme!(id)
    {:ok, _meme} = Memes.delete_meme(meme)

    conn
    |> put_flash(:info, "Meme deleted successfully.")
    |> redirect(to: ~p"/memes")
  end
end
