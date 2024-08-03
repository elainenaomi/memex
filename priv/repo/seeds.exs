# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Memex.Repo.insert!(%Memex.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Memex.Repo
alias Memex.Memes.Meme

Repo.insert! %Meme{
  name: "Alguém pode tirar a senhora da foto pra mim?",
  link: "https://x.com/claalbuquerque/status/1818427887667593552",
  description: "Montagem de fotos com a Rebeca Andrade e reporter Clara"
}

Repo.insert! %Meme{
  name: "Foto do Gabriel Medina nas Olimpíadas",
  link: "https://x.com/timebrasil/status/1818009999873831157",
  description: "Gabriel Medina no ar com a prancha"
}

Repo.insert! %Meme{
  name: "Meme Medina e Tilibra",
  link: "https://x.com/feitosafut/status/1818018002673213737",
  description: "Capa do caderno da Tilibra com Gabriel Medina"
}

Repo.insert! %Meme{
  name: "Meme Medina Rayssa Ginástica Bala Loka",
  link: "https://x.com/timebrasil/status/1818642504067019086",
  description: "Skate Surf Ginástica BMX"
}

Repo.insert! %Meme{
  name: "Meme Bia Medina Rayssa Ginástica Rebeca Caio Hugo Larissa William",
  link: "https://x.com/zedmartins/status/1819403943711019389",
  description: "Skate Surf Ginástica BMX Futebol Judô Tênis de mesa"
}
