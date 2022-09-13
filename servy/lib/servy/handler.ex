defmodule Servy.Handler do

  @moduledoc "Handles HTTP requests."

  alias Servy.Conv
  alias Servy.BearController

  @pages_path Path.expand("../../pages", __DIR__)

  import Servy.FileHandler, only: [handle_file: 2]
  import Servy.Plugins, only: [rewrite_path: 1, log: 1, track: 1]
  import Servy.Parser, only: [parse: 1]

  @doc "Transforms the request into a response."
  def handle(request) do
    request
    |> parse
    |> rewrite_path
    |> log
    |> route
    |> emojify
    |> track
    |> put_content_length
    |> format_response
  end

  def route(%Conv{ method: "GET", path: "/wildthings" } = conv) do
    %{ conv | status: 200, resp_body: "Bears, Lions, Tigers" }
  end

  def route(%Conv{ method: "GET", path: "/api/bears" } = conv) do
    Servy.Api.BearController.index(conv)
  end

  def route(%Conv{ method: "GET", path: "/bears" } = conv) do
    BearController.index(conv)
  end

  def route(%Conv{ method: "GET", path: "/bears/new" } = conv) do
    @pages_path
    |> Path.join("form.html")
    |> File.read
    |> handle_file(conv)
  end

  def route(%Conv{ method: "GET", path: "/pages/" <> file } = conv) do
    @pages_path
    |> Path.join(file <> ".html")
    |> File.read
    |> handle_file(conv)
  end

  def route(%Conv{ method: "GET", path: "/bears/" <> id } = conv) do
    params = Map.put(conv.params, "id", id)
    BearController.show(conv, params)
  end

  def route(%Conv{method: "POST", path: "/bears"} = conv) do
    BearController.create(conv, conv.params)
  end

  def route(%Conv{ method: "DELETE", path: "/bears/" <> _id } = conv ) do
    BearController.delete(conv)
  end

  def route(%Conv{method: "GET", path: "/about"} = conv) do
      @pages_path
      |> Path.join("about.html")
      |> File.read
      |> handle_file(conv)
  end

  def route(%Conv{ path: path } = conv) do
    %{ conv | status: 404, resp_body: "No #{path} here!"}
  end

  def emojify(%Conv{ status: 200 } = conv) do
    emojies = String.duplicate("🎉", 5)
    body = emojies <> "\r\n" <> conv.resp_body <> "\r\n" <> emojies
    %{ conv | resp_body: body}
  end

  def emojify(%Conv{} = conv), do: conv

  def put_content_length(conv) do
    new_resp_headers = Map.put(conv.resp_headers, "Content-Length", byte_size(conv.resp_body))
    %{ conv | resp_headers: new_resp_headers }
  end

  def format_response_headers(conv) do
    conv.resp_headers
    |> Enum.map(fn {k, v} -> "#{k}: #{v}" end)
    |> Enum.sort()
    |> Enum.reverse()
    |> Enum.join("\r\n")
  end

  def format_response(%Conv{} = conv) do
    """
    HTTP/1.1 #{Conv.full_status(conv)}\r
    #{format_response_headers(conv)}\r
    \r
    #{conv.resp_body}
    """
  end
end
