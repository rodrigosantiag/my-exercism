defmodule FileSniffer do
  @media_type_exe "application/octet-stream"
  @media_type_bmp "image/bmp"
  @media_type_png "image/png"
  @media_type_jpg "image/jpg"
  @media_type_gif "image/gif"
  @error_message "Warning, file format and file extension do not match."

  @spec type_from_extension(String.t()) :: String.t() | nil
  def type_from_extension("exe"), do: @media_type_exe
  def type_from_extension("bmp"), do: @media_type_bmp
  def type_from_extension("png"), do: @media_type_png
  def type_from_extension("jpg"), do: @media_type_jpg
  def type_from_extension("gif"), do: @media_type_gif
  def type_from_extension(_), do: nil

  @spec type_from_binary(binary()) :: String.t() | nil
  def type_from_binary(binary_file) do
    case binary_file do
      <<0x7F, 0x45, 0x4C, 0x46, _::binary>> -> @media_type_exe
      <<0x42, 0x4D, _::binary>> -> @media_type_bmp
      <<0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A, _::binary>> -> @media_type_png
      <<0xFF, 0xD8, 0xFF, _::binary>> -> @media_type_jpg
      <<0x47, 0x49, 0x46, _::binary>> -> @media_type_gif
      _ -> nil
    end
  end

  @spec verify(binary(), String.t()) :: {:ok, String.t()} | {:error, String.t()}
  def verify(file_binary, extension),
    do: do_verify(type_from_binary(file_binary), type_from_extension(extension))

  defp do_verify(nil, nil), do: {:error, @error_message}
  defp do_verify(type, type), do: {:ok, type}
  defp do_verify(_type, _another_type), do: {:error, @error_message}
end
