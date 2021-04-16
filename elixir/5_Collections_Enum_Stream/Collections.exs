defmodule Countdown do
  def sleep(seconds) do
    receive do
      after(seconds*1000) -> nil
    end
  end
  
  def say(text) do
    spawn fn -> :os.cmd('say #{text}') end
  end
end
