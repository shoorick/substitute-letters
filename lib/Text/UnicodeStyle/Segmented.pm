package Text::UnicodeStyle::Segmented;
use strict;
use warnings;

sub table {
    return {
        digit => 0x1FBF0,
    };
}

1;

=head1 NAME

Text::UnicodeStyle::Segmented - segmented digits

=head1 DESCRIPTION

Style table for L<Text::UnicodeStyle>: see its documentation for
details on the C<table()> format and the C<stylize()> function.

This style only defines digits (U+1FBF0..U+1FBF9); letters are left
unchanged.

=head1 SEE ALSO

L<Text::UnicodeStyle>

=cut
