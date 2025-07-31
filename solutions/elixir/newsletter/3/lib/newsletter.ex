defmodule Newsletter do
  @spec read_emails(String.t()) :: [String.t()]
  def read_emails(path) do
    File.read!(path) |> String.split("\n", trim: true)
  end

  @spec open_log(String.t()) :: pid()
  def open_log(path), do: File.open!(path, [:write])

  @spec log_sent_email(pid(), String.t()) :: :ok
  def log_sent_email(pid, email), do: IO.puts(pid, email)

  @spec close_log(pid()) :: :ok
  def close_log(pid), do: File.close(pid)

  @spec send_newsletter(String.t(), String.t(), (String.t() -> :ok | {:error, any()})) :: :ok
  def send_newsletter(emails_path, log_path, send_fun) do
    log_pid = open_log(log_path)

    Enum.each(read_emails(emails_path), fn email ->
      case send_fun.(email) do
        :ok -> log_sent_email(log_pid, email)
        _ -> nil
      end
    end)

    close_log(log_pid)
  end
end
