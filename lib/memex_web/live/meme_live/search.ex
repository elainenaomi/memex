defmodule MemexWeb.MemeLive.Search do
  # use Phoenix.LiveView
  use MemexWeb, :live_view

  alias Memex.Memes

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, query: "", memes: [])}
  end

  @impl true
  def handle_event("search", %{"query" => query}, socket) do
    memes = Memes.search_memes(query)
    {:noreply, assign(socket, query: query, memes: memes)}
  end
end
