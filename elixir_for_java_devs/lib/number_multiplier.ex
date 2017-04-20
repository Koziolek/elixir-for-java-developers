defmodule NumberMultiplier do
  @moduledoc false
  use GenStage
  require Integer

  def start_link do
    GenStage.start_link(__MODULE__, :state_doesnt_matter, name: __MODULE__)
  end

  @doc """
    Now we have module that is consumer and producer.
  """
  def init(state) do
    {:producer_consumer, state, subscribe_to: [NumberProducer]}
  end

  @doc """
    Our business logic is to multiply number by themself.
  """
  def handle_events(events, _from, state) do
    numbers =
      events
      |> Enum.map( fn n -> n * n end)

    {:noreply, numbers, state}
  end
end