defmodule MemexWeb.MemeHTML do
  use MemexWeb, :html

  embed_templates "meme_html/*"

  @doc """
  Renders a meme form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def meme_form(assigns)
end
