defmodule WorditoWeb.GameLive do
  use WorditoWeb, :live_view
  alias Wordito.Repo
  alias Wordito.Word
  import Ecto.Query, only: [from: 2]

  def mount(params, _session, socket) do
    chars = String.to_integer(params["chars"])

    # get nieve date time now
    today = NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second)
    # get beginning of day
    beginning_of_today = Timex.beginning_of_day(today)
    # get end of day
    end_of_today = Timex.end_of_day(today)

    # make query for word of the day
    word_of_the_day = get_word_between_dates(chars, beginning_of_today, end_of_today)

    if is_nil(word_of_the_day) do
      # if no word of the day, get the next word without a date
      query =
        from w in Word,
          where: w.characters == ^chars and is_nil(w.used_on),
          select: {w.word, w.id},
          limit: 1

      {word, word_id} = Repo.one(query)

      # if no word reset all records with characters to nil

      update_word = Repo.get!(Word, word_id)
      update_word = Ecto.Changeset.change(update_word, used_on: today)

      case Repo.update(update_word) do
        # Updated with success
        {:ok, _struct} ->
          socket = assign(socket, :word, word)
          {:ok, socket}

        # Something went wrong
        {:error, _changeset} ->
          socket = assign(socket, :word, "ERROR")
          put_flash(socket, :error, "Error getting word")
          {:ok, socket}
      end
    else
      socket = assign(socket, :word, word_of_the_day)
      {:ok, socket}
    end
  end

  def render(assigns) do
    Phoenix.View.render(WorditoWeb.PageView, "game.html", assigns)
  end

  defp get_word_between_dates(chars, beginning_of_day, end_of_day) do
    query =
      from w in Word,
        where:
          w.used_on >= ^beginning_of_day and
            w.used_on <= ^end_of_day and
            w.characters == ^chars,
        select: w.word,
        limit: 1

    Repo.one(query)
  end
end
