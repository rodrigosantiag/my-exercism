defmodule DNA do
  def encode_nucleotide(code_point) do
    case code_point do
      ?A -> 0b0001
      ?C -> 0b0010
      ?G -> 0b0100
      ?T -> 0b1000
      ?\s -> 0b0000
      true -> nil
    end
  end

  def decode_nucleotide(encoded_code) do
    case encoded_code do
      0b0001 -> ?A
      0b0010 -> ?C
      0b0100 -> ?G
      0b1000 -> ?T
      0b0000 -> ?\s
      true -> nil
    end
  end

  def encode(dna) do
    do_encode(dna, <<>>)
  end

  def decode(dna) do
    do_decode(dna, ~c"")
  end

  defp do_encode([], encoded), do: encoded
  defp do_encode([head | tail], encoded) do
    encoded_head = encode_nucleotide(head)
    do_encode(tail, <<encoded::bitstring, encoded_head::size(4)>>)
  end

  defp do_decode(<<>>, decoded), do: decoded
  defp do_decode(<<head::size(4), tail::bitstring>>, decoded) do
    decoded_head = decode_nucleotide(head)
    do_decode(tail, decoded ++ [decoded_head])
  end
end
