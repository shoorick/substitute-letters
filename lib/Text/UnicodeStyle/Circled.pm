package Text::UnicodeStyle::Circled;
use strict;
use warnings;

sub table {
    return {
        upper => 0x24B6,
        lower => 0x24D0,
        digit => 0x245F,
        fix => {
            '0' => 0x24EA,
        },
    };
}

1;
