defmodule Servy.Api.BearController do
  def put_resp_content_type(conv, new_type) do
    new_resp_headers = Map.put(conv.resp_headers, "Content-Type", new_type)
    %{conv | resp_headers: new_resp_headers}
  end

  def index(conv) do
    json =
      Servy.Wildthings.list_bears()
      |> Poison.encode!()

    conv = put_resp_content_type(conv, "application/json")
    %{conv | status: 200, resp_body: json}
  end

  def create(conv, %{"name" => name, "type" => type}) do
    %{conv | status: 201, resp_body: "Created a #{type} bear named #{name}!"}
  end
end
