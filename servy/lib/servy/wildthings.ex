defmodule Servy.Wildthings do
  alias Servy.Bear

  @db_path Path.expand("../../db", __DIR__)

  import Servy.FileHandler, only: [read_file: 1]

  def list_bears() do
    @db_path
    |> Path.join("bears.json")
    |> read_file
    |> Poison.decode!(as: %{"bears" => [%Bear{}]})
    |> Map.get("bears")
  end

  def get_bear(id) when is_integer(id) do
    Enum.find(list_bears(), fn b -> b.id == id end)
  end

  def get_bear(id) when is_binary(id) do
    id |> String.to_integer() |> get_bear
  end
end
