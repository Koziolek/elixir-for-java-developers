defmodule PingNode do
  @moduledoc false

    def ping do
       pid = Node.spawn_link :"wro@BKuczynski-NB", fn ->
         receive do
           {:ping, client} -> IO.puts(:ping)
                              send client, :pong
         end
       end
   end
end

defmodule PongNode do
  @moduledoc false

    def pong do
       pid = Node.spawn_link :"szcz@BKuczynski-NB", fn ->
         receive do
           {:pong, client} -> IO.puts(:pong)
                              send client, :ping
         end
       end
   end
end