# substitute-letters

A Perl module and CLI utility that replaces Latin letters with lookalike
characters from other Unicode ranges — mathematical alphanumeric symbols
(monospace, script, fraktur, doublestruck, sans-serif and their variants),
fullwidth, and more. For example, `ABC` → `𝙰𝙱𝙲` (monospace) or `𝒜ℬ𝒞` (script).

Digits, spaces, `_` and other non-letters are left unchanged —
except that the `bold`, `doublestruck`, `monospace`, `sans_serif` and
`sans_serif_bold` styles also substitute digits `0-9`.

Russian documentation: [russian.md](russian.md)

Repository: <https://github.com/shoorick/substitute-letters> —
bug reports and other issues are welcome at
<https://github.com/shoorick/substitute-letters/issues>

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
echo mkdir folder_name | bin/substitute-letters -s monospace

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

say stylize('something_id', 'monospace');   # 𝚜𝚘𝚖𝚎𝚝𝚑𝚒𝚗𝚐_𝚒𝚍
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

## License

[MIT](LICENSE)

## Author

Alexander Sapozhnikov <shoorick@cpan.org> <http://shoorick.ru>

## Support the project

If you find this project useful, you can support its development via [PayPal](https://paypal.me/shoorick77).


