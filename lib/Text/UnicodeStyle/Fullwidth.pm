package Text::UnicodeStyle::Fullwidth;
use strict;
use warnings;

sub table {
    return {
        upper => 0xFF21,
        lower => 0xFF41,
        digit => 0xFF10,
        punct => 0xFEE0,
    };
}

1;
