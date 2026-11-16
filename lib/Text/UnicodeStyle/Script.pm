package Text::UnicodeStyle::Script;
use strict;
use warnings;

sub table {
    return {
        upper => 0x1D49C,
        lower => 0x1D4B6,
        fix => {
            A => 0x1D49C, C => 0x1D49E, D => 0x1D49F,
            G => 0x1D4A2, J => 0x1D4A5, K => 0x1D4A6,
            N => 0x1D4A9, O => 0x1D4AA, P => 0x1D4AB,
            Q => 0x1D4AC, S => 0x1D4AE, T => 0x1D4AF,
            U => 0x1D4B0, V => 0x1D4B1, W => 0x1D4B2,
            X => 0x1D4B3, Y => 0x1D4B4, Z => 0x1D4B5,
        },
    };
}

1;
