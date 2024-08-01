defmodule MemeSearch do
  use Phoenix.Component

  def search(assigns) do
     ~H"""
    <div>
      <h1>Search Memes</h1>
      <form phx-submit="search">
        <input type="text" name="query" value={@query} placeholder="Search for memes..."/>
        <button type="submit">Search</button>
      </form>
      <ul>
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
end
