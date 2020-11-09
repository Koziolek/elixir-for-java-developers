defmodule NumberProducer do
  @moduledoc false

    use GenStage

    @doc """
        Start module as element of GenStage.
    """
    def start_link(inital \\ 0 ) do
      GenStage.start_link(__MODULE__, inital, name: __MODULE__)
    end

    @doc """
        Initialize module. Mark them as producer and setup initial state.
    """
    def init(counter), do: {:producer, counter}

    @doc """
        Handle request. We produce `demand` number of events. Default is 1000.
    """
    def handle_demand(demand, state) do
        events = Enum.to_list(state..state + demand - 1)
        IO.inspect(events)
        {:noreply, events, (state + demand)}
    end

end