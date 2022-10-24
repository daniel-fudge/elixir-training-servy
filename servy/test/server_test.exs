defmodule ServerTest do
  use ExUnit.Case, async: true
  doctest Servy.HttpServer

  import Servy.HttpClient
  import Servy.HttpServer

  alias Servy.HttpClient
  alias Servy.HttpServer

  test "GET /wildthings" do
    request = """
    GET /wildthings HTTP/1.1\r
    Host: example.com\r
    User-Agent: ExampleBrowser/1.0\r
    Accept: */*\r
    \r
    """

    spawn(fn -> start(4000) end)

    response = send_request(request)

    # response = handle(request)

    assert response == """
           HTTP/1.1 200 OK\r
           Content-Type: text/html\r
           Content-Length: 64\r
           \r
           🎉🎉🎉🎉🎉\r
           Bears, Lions, Tigers\r
           🎉🎉🎉🎉🎉
           """
  end
end
