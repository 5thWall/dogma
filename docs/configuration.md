Configuration
=============

Dogma can be configured to have different behaviours via your project's Mix
config. You can select a rule set to use as your base configuration, and then
apply additional configuration on top of the set.

Here's an example configuration.

```elixir
# config/config.exs

config :dogma,
  rule_set: Dogma.RuleSet.All,

  exclude: [
    ~r(\Alib/vendor/),
  ],

  # Override an existing rule set.
  override: %{ LineLength => [ max_length: 120 ] }
```

## rule_set

The `rule_set` key takes the name of a rule set module, which contains the
list of rules to use as well as their configuration. It defaults to
`Dogma.RuleSet.All`.


## exclude

The `exclude` key takes a list of regexes, and checks these against the paths
of files in the project directory. Any files that match any of the regexes
supplied will not be checked by Dogma.

For example, if my regex was `~r(\Alib/vendor/)`, a file at `lib/vendor/foo.ex`
would be ignored by Dogma.
