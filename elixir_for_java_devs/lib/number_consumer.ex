defmodule NumberConsumer do
  @moduledoc false
 use GenStage

  def start_link do
    GenStage.start_link(__MODULE__, :state_doesnt_matter)
  end

    @doc """
        And this is consumer.
    """
  def init(state) do
    {:consumer, state, subscribe_to: [{NumberMultiplier,  max_demand: 5}]}
  end

  def handle_events(events, _from, state) do
    for event <- events do
      IO.inspect {self(), event, state}
    end
    Process.sleep(1000)
    # As a consumer we never emit events
    {:noreply, [], state}
  end
end