defmodule Dogma.Rule.StringMatching do
  @moduledoc """
  Rule that disallows string matching using binary patterns.

  Instead you should use string concatination.

  Example

  Invalid:
      <<"my"::_utf8, _rest>> = "my string"

  Valid:
      "my" <> _rest = "my string"
  """

  @behaviour Dogma.Rule
  alias Dogma.Script
  alias Dogma.Error

  def test(script, _options),
  do: test(script)

  def test(script) do
  end
end
