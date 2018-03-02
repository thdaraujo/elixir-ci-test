defmodule Csv.ImportTest do
  use ExUnit.Case
  alias Csv.Schemas.Site
  alias Csv.Repo

  test "imports records of a csv file" do
    Repo.start_link # This line starts our agent
    options = [schema: Site, headers: [:name, :url]]

    "test/fixtures/sites.csv" |> Csv.Import.call(options)

    assert [
      %Site{name: "Elixir Language", url: "https://elixir-lang.org"},
      %Site{name: "Semaphore Blog", url: "https://semaphoreci.com/blog"}
    ] = Repo.all
  end
end
