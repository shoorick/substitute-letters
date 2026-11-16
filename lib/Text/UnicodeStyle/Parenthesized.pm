package Text::UnicodeStyle::Parenthesized;
use strict;
use warnings;

sub table {
    return {
        upper => 0x1F110,
        lower => 0x249C,
        digit => 0x2473,
        fix => {
            '0' => 0x30,
        },
    };
}

1;
