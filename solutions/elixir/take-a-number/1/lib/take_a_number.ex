defmodule TakeANumber do
  def start() do
    spawn(fn -> send(self(), {:message, })
    end)
  end
end

receive do
  {:message_type, value} ->

end
