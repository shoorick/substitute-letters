# substitute-letters

A Perl module and CLI utility that replaces Latin letters with lookalike
characters from other Unicode ranges — mathematical alphanumeric symbols
(monospace, script, fraktur, doublestruck, sans-serif and their variants),
fullwidth, and more. For example, `ABC` → `𝙰𝙱𝙲` (monospace) or `𝒜ℬ𝒞` (script).

Digits, spaces, `_` and other non-letters are left unchanged.

> Russian documentation: [russian.md](russian.md)

## Features

- `Text::UnicodeStyle` — API: `stylize($string, $style)` and `styles()`
- `bin/substitute-letters` — CLI wrapper built on `Getopt::Long`
- 14 styles: `bold`, `bold_fraktur`, `bold_italic`, `bold_script`,
  `doublestruck`, `fraktur`, `fullwidth`, `italic`, `monospace`,
  `sans_serif`, `sans_serif_bold`, `sans_serif_bold_italic`,
  `sans_serif_italic`, `script`

## CLI usage

```sh
# text as arguments (joined with spaces)
bin/substitute-letters --style script 'Hello, World!'
bin/substitute-letters -s fraktur route_id

# or via stdin
echo 'route_short_name' | bin/substitute-letters -s monospace

# list available styles
bin/substitute-letters --list

# help
bin/substitute-letters --help
```

Options: `-s/--style STYLE` (default `monospace`), `-l/--list`,
`-h/-?/--help`.

## Module usage

```perl
use lib 'lib';
use Text::UnicodeStyle qw( stylize styles );

say stylize('route_id', 'monospace');   # 𝐫𝐨𝐮𝐭𝐞_𝐢𝐝
say join ', ', styles();
```

`stylize` returns a new string; the input is not modified.

## Tests

```sh
prove -Ilib t/
```

`t/stylize.t` covers the API and the conversion tables, `t/cli.t` —
CLI behavior (including exit codes and help output).

## Example

`example.pl` — a demo script using the module.

## Layout

```
lib/Text/UnicodeStyle.pm    # module API
lib/Text/UnicodeStyle/*.pm  # style tables (lazy load)
bin/substitute-letters      # CLI
t/                          # tests (Test::More + prove)
example.pl                  # example
```
