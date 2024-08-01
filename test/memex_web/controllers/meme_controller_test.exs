defmodule MemexWeb.MemeControllerTest do
  use MemexWeb.ConnCase

  import Memex.MemesFixtures

  @create_attrs %{name: "some name", link: "some link", description: "some description"}
  @update_attrs %{name: "some updated name", link: "some updated link", description: "some updated description"}
  @invalid_attrs %{name: nil, link: nil, description: nil}

  describe "index" do
    test "lists all memes", %{conn: conn} do
      conn = get(conn, ~p"/memes")
      assert html_response(conn, 200) =~ "Listing Memes"
    end
  end

  describe "new meme" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/memes/new")
      assert html_response(conn, 200) =~ "New Meme"
    end
  end

  describe "create meme" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/memes", meme: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/memes/#{id}"

      conn = get(conn, ~p"/memes/#{id}")
      assert html_response(conn, 200) =~ "Meme #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/memes", meme: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Meme"
    end
  end

  describe "edit meme" do
    setup [:create_meme]

    test "renders form for editing chosen meme", %{conn: conn, meme: meme} do
      conn = get(conn, ~p"/memes/#{meme}/edit")
      assert html_response(conn, 200) =~ "Edit Meme"
    end
  end

  describe "update meme" do
    setup [:create_meme]

    test "redirects when data is valid", %{conn: conn, meme: meme} do
      conn = put(conn, ~p"/memes/#{meme}", meme: @update_attrs)
      assert redirected_to(conn) == ~p"/memes/#{meme}"

      conn = get(conn, ~p"/memes/#{meme}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, meme: meme} do
      conn = put(conn, ~p"/memes/#{meme}", meme: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Meme"
    end
  end

  describe "delete meme" do
    setup [:create_meme]

    test "deletes chosen meme", %{conn: conn, meme: meme} do
      conn = delete(conn, ~p"/memes/#{meme}")
      assert redirected_to(conn) == ~p"/memes"

      assert_error_sent 404, fn ->
        get(conn, ~p"/memes/#{meme}")
      end
    end
  end

  defp create_meme(_) do
    meme = meme_fixture()
    %{meme: meme}
  end
end
