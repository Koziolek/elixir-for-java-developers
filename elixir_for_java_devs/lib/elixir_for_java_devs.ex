defmodule ElixirForJavaDevs do
  @moduledoc """
  Documentation for ElixirForJavaDevs.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ElixirForJavaDevs.hello
      :world

  """
  def hello do
    :world
  end

  def listen do
     receive do
        {:ok, "hello"} -> IO.puts "World"
      end
      listen()
  end

  def listen2 do
    receiv1
  end

  def run do
      {pid, ref} = spawn_monitor(ElixirForJavaDevs, :listen2, [])
      receive do
        {:DOWN, ref, :process, from_pid, reason} -> IO.puts "Exit reason: #{reason}"
      end
  end

end

defmodule SumModule do
    def sum(list) when is_list(list), do: _sum(list, 0)
    defp _sum([], acc), do: acc
    defp _sum([head|tail], acc), do: _sum(tail, acc+head)
end