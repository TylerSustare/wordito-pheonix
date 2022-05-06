defmodule WorditoWeb.PageController do
  import Ecto.Query, only: [from: 2]
  alias Wordito.Repo
  alias Wordito.Word
  use WorditoWeb, :controller

  def index(conn, _params) do
    Word.changeset(%Word{}, %{word: "soup", characters: 4})
    |> Repo.insert()

    query =
      from w in Word,
        where: w.word == "soup",
        select: w.word,
        limit: 1

    word = Repo.one(query)

    number = Repo.one(from w in Word, select: count())
    render(conn, "index.html", word: word, number: number)
  end
end
