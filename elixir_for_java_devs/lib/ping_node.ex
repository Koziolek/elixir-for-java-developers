defmodule PingNode do
  @moduledoc false

    def ping do
       pid = Node.spawn_link :"foo@localhost", fn -> listen() end
   end

   def listen() do
    receive do
      {:ping, client} -> IO.puts("ping!!!")
                         IO.inspect(client)
                         send client, {:pong, self()}
    end
    listen()
  end
end

defmodule PongNode do
  @moduledoc false

    def pong do
       pid = Node.spawn_link :"bar@localhost", fn -> listen() end
   end

   def listen() do
    receive do
      {:pong, client} -> IO.puts("pong!!!")
                         IO.inspect(client)
                         send client, {:ping, self()}
    end
    listen()
  end
end