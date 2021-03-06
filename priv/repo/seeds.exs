# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Wordito.Repo.insert!(%Wordito.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

Wordito.Repo.delete_all(Wordito.Word)

Wordito.Repo.insert!(%Wordito.Word{word: "hello", characters: 5})
Wordito.Repo.insert!(%Wordito.Word{word: "dogs", characters: 4})
Wordito.Repo.insert!(%Wordito.Word{word: "cat", characters: 3})
