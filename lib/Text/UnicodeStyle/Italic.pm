package Text::UnicodeStyle::Italic;
use strict;
use warnings;

sub table {
    return {
        upper => 0x1D434,
        lower => 0x1D44E,
        fix => {
            h => 0x210E,
        },
    };
}

1;
