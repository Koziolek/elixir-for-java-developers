defmodule GenStageExample do
  @moduledoc false

    def main(args \\ []) do
      start(:doesnt, :care)
      :timer.sleep(:timer.seconds(2))
    end

    def start(_type, _args) do
      import Supervisor.Spec, warn: false

      children = [
        worker(NumberProducer, [0]),
        worker(NumberMultiplier, []),
        worker(NumberConsumer, []),
      ]

      opts = [strategy: :one_for_one, name: GenstageExample.Supervisor]
      Supervisor.start_link(children, opts)
    end
end