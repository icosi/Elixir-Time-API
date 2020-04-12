defmodule TimeApi.Endpoint do
  use Plug.Router
  import DateTime

  plug(Plug.Logger)
  plug(:match)
  plug(Plug.Parsers, parsers: [:json], json_decoder: Jason)
  plug(:dispatch)

  get "/time" do
    send_resp(conn, 200, Jason.encode!(DateTime.utc_now()))
  end

  match _ do
    send_resp(conn, 404, "oops... Nothing here :(")
  end
end
