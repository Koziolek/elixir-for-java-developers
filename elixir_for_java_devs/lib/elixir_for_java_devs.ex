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
    receive do
        {:ok, "Hi"} -> IO.puts "HI!"
        {:ok, "Hello"} -> IO.puts "Hello!"
        _ -> exit(:kboom)
    end
    listen2()
  end

  def run do
      {pid, ref} = spawn_monitor(ElixirForJavaDevs, :listen2, [])
      receive do
        {:DOWN, ref, :process, from_pid, reason} -> IO.puts "Exit reason: #{reason}"
      end
  end

end
