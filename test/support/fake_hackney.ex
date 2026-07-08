defmodule FakeHackney do
  use TestAgent,
    request: fn method, url, headers, body, options ->
      [method, url, headers, body, options]
    end,
    body: fn reference ->
      {:ok, reference}
    end

  def request(method, url, headers, body, options) do
    get(__MODULE__, :request).(method, url, headers, body, options)
  end

  def body(reference) do
    get(__MODULE__, :body).(reference)
  end
end
