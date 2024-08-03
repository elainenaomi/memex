defmodule MemexWeb.MemeLive do
  # In Phoenix v1.6+ apps, the line is typically: use MyAppWeb, :live_view
  use Phoenix.LiveView

  alias Memex.Memes

  def render(assigns) do
    ~H"""
      <div class="flex items-center flex-col">
        <form phx-submit="search">
          <input type="text" name="query" value={@query} placeholder="Search for memes..."/>
          <button type="submit">Search</button>
        </form>
        <ul class="pt-5">
          <%= for meme <- @memes do %>
            <li>
              <strong><%= meme.name %></strong> - <%= meme.description %>
              <%= if meme.link do %>
                [<a href={meme.link} target="_blank">Link</a>]
              <% end %>
            </li>
          <% end %>
        </ul>
      </div>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, query: "", memes: [])}
  end

  def handle_event("search", %{"query" => query}, socket) do
    memes = Memes.search_memes(query)
    {:noreply, assign(socket, query: query, memes: memes)}
  end
end
