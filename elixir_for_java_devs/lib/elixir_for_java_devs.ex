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
        _ -> exit(:kboom)
    end
    listen2()
  end
end
