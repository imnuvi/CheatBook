defmodule DbConnector do
  use GenServer

  @impl true
  def init(initializer) do
    {:ok, initializer}
  end

  def start_link(state) do
    GenServer.start_link(__MODULE__, state, name: :dbconnector)
  end

  @impl true
  def handle_cast({:connect, connection_string}, _state) do
    # assume the connection and the database actions happen here
    {:noreply, connection_string}
  end

end


# children = [  %{ id: DbConnector, start: {DbConnector, :start_link, [[:hello]]} } ]
# {:ok, pid} = Supervisor.start_link(children, strategy: :one_for_one)
# Process.whereis(:dbconnector)
