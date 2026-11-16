package Text::UnicodeStyle::Fraktur;
use strict;
use warnings;

sub table {
    return {
        upper => 0x1D504,
        lower => 0x1D51E,
        fix => {
            C => 0x212D,
            H => 0x210C,
            I => 0x2111,
            R => 0x211C,
            Z => 0x2128,
        },
    };
}

1;
