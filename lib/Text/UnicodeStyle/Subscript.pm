package Text::UnicodeStyle::Subscript;
use strict;
use warnings;

sub table {
    return {
        digit => 0x2080,
        fix => {
            '+' => 0x208A, '-' => 0x208B, '=' => 0x208C,
            '(' => 0x208D, ')' => 0x208E,
            a => 0x2090, e => 0x2091, h => 0x2095, i => 0x1D62,
            k => 0x2096, l => 0x2097, m => 0x2098, n => 0x2099,
            o => 0x2092, p => 0x209A, r => 0x1D63, s => 0x209B,
            t => 0x209C, u => 0x1D64, v => 0x1D65, x => 0x2093,
        },
    };
}

1;

=head1 NAME

Text::UnicodeStyle::Subscript - subscript digits, signs and letters

=head1 DESCRIPTION

Style table for L<Text::UnicodeStyle>: see its documentation for
details on the C<table()> format and the C<stylize()> function.

Only a subset of characters has subscript forms; everything else is
left unchanged.

=head1 SEE ALSO

L<Text::UnicodeStyle>

=cut
