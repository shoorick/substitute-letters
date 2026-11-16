use strict;
use warnings;
use utf8;
use open ':std', ':encoding(UTF-8)';

use Test::More;
use Text::UnicodeStyle qw( stylize styles );

my @STYLES = qw(
    bold bold_fraktur bold_italic bold_script
    doublestruck fraktur fullwidth italic monospace
    sans_serif sans_serif_bold sans_serif_bold_italic sans_serif_italic
    script
);

subtest 'styles()' => sub {
    is_deeply [ styles() ], [ sort @STYLES ], 'returns all style names sorted';
};

subtest 'stylize() argument handling' => sub {
    my $s = 'abc';
    stylize($s, 'monospace');
    is $s, 'abc', 'input string is not modified';

    eval { stylize('x', 'no_such_style') };
    like $@, qr/Unknown style/, 'dies on unknown style';
};

subtest 'non-letters are preserved' => sub {
    for my $style (styles()) {
        is stylize('a1_ Z!', $style),
            stylize('a', $style) . '1_ ' . stylize('Z', $style) . '!',
            "$style: digits, underscore, space and punctuation untouched";
    }
};

subtest 'every style maps the full alphabet to non-ASCII' => sub {
    my $alpha = join '', 'a' .. 'z', 'A' .. 'Z';

    for my $style (styles()) {
        my $out = stylize($alpha, $style);
        is length($out), 52, "$style: length preserved";
        unlike $out, qr/[A-Za-z]/, "$style: no ASCII letters remain";
    }
};

subtest 'base code points' => sub {
    is stylize('A', 'monospace'), chr(0x1D670), 'monospace A';
    is stylize('a', 'monospace'), chr(0x1D68A), 'monospace a';
    is stylize('A', 'fullwidth'),  chr(0xFF21),   'fullwidth A';
    is stylize('a', 'fullwidth'),  chr(0xFF41),   'fullwidth a';
    is stylize('A', 'italic'),     chr(0x1D434),  'italic A';
    is stylize('A', 'bold'),       chr(0x1D400),  'bold A';
};

subtest 'script exceptions' => sub {
    is stylize('BEFHILMR', 'script'),
        "\x{212C}\x{2130}\x{2131}\x{210B}\x{2110}\x{2112}\x{2133}\x{211B}",
        'script uppercase holes use letterlike forms';
    is stylize('ego', 'script'),
        "\x{212F}\x{210A}\x{2134}",
        'script lowercase holes use letterlike forms';
    is stylize('ACXZ', 'script'),
        "\x{1D49C}\x{1D49E}\x{1D4B3}\x{1D4B5}",
        'script contiguous-range letters';
};

subtest 'italic exception' => sub {
    is stylize('h', 'italic'), chr(0x210E), 'italic h -> U+210E';
    is stylize('xyz', 'italic'),
        join('', map { chr(0x1D44E + ord($_) - ord('a')) } split //, 'xyz'),
        'italic contiguous lowercase';
};

subtest 'fraktur exceptions' => sub {
    is stylize('CHIRZ', 'fraktur'),
        "\x{212D}\x{210C}\x{2111}\x{211C}\x{2128}",
        'fraktur uppercase holes use letterlike forms';
};

subtest 'doublestruck exceptions' => sub {
    is stylize('CHNPQRZ', 'doublestruck'),
        "\x{2102}\x{210D}\x{2115}\x{2119}\x{211A}\x{211D}\x{2124}",
        'doublestruck uppercase holes use letterlike forms';
};

done_testing;
