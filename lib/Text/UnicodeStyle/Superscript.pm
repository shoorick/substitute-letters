package Text::UnicodeStyle::Superscript;
use strict;
use warnings;

sub table {
    return {
        fix => {
            '0' => 0x2070, '1' => 0x00B9, '2' => 0x00B2, '3' => 0x00B3,
            '4' => 0x2074, '5' => 0x2075, '6' => 0x2076, '7' => 0x2077,
            '8' => 0x2078, '9' => 0x2079,
            '+' => 0x207A, '-' => 0x207B, '=' => 0x207C,
            '(' => 0x207D, ')' => 0x207E,
            A => 0x1D2C, B => 0x1D2E, D => 0x1D30, E => 0x1D31,
            G => 0x1D33, H => 0x1D34, I => 0x1D35, J => 0x1D36,
            K => 0x1D37, L => 0x1D38, M => 0x1D39, N => 0x1D3A,
            O => 0x1D3C, P => 0x1D3E, R => 0x1D3F, T => 0x1D40,
            U => 0x1D41, W => 0x1D42,
            a => 0x1D43, b => 0x1D47, d => 0x1D48, e => 0x1D49,
            g => 0x1D4D, i => 0x2071, k => 0x1D4F, m => 0x1D50,
            n => 0x207F, o => 0x1D52, p => 0x1D56, t => 0x1D57,
            u => 0x1D58, v => 0x1D5B,
        },
    };
}

1;

=head1 NAME

Text::UnicodeStyle::Superscript - superscript digits, signs and letters

=head1 DESCRIPTION

Style table for L<Text::UnicodeStyle>: see its documentation for
details on the C<table()> format and the C<stylize()> function.

Only a subset of characters has superscript forms; everything else is
left unchanged.

=head1 SEE ALSO

L<Text::UnicodeStyle>

=cut
