package Text::UnicodeStyle::Doublestruck;
use strict;
use warnings;

sub table {
    return {
        upper => 0x1D538,
        lower => 0x1D552,
        digit => 0x1D7D8,
        fix => {
            C => 0x2102,
            H => 0x210D,
            N => 0x2115,
            P => 0x2119,
            Q => 0x211A,
            R => 0x211D,
            Z => 0x2124,
        },
    };
}

1;
