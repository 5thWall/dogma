defmodule Dogma.Rule.StringMatchingTest do
  use ShouldI

  alias Dogma.Rule.StringMatching
  alias Dogma.Script
  alias Dogma.Error

  defp lint(script) do
    script
    |> Script.parse("foo.ex")
    |> StringMatching.test
  end

  should "not return an error when string matched by concatination" do
    errors = """
    "my" <> _rest = "my string"
    """ |> lint

    assert errors == []
  end

  should "return an error when string matched by binary pattern" do
    errors = """
    <<"my"::_utf8, _rest>> = "my string"
    """ |> lint

    assert errors == [
      %Error{
        line: 1,
        message: "Don't patern match on strings using binary patterns",
        rule: StringMatching
      }
    ]
  end
end
