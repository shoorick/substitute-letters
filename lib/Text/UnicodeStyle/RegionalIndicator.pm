package Text::UnicodeStyle::RegionalIndicator;
use strict;
use warnings;

sub table {
    return {
        upper => 0x1F1E6,
        lower => 0x1F1E6,
    };
}

1;

=head1 NAME

Text::UnicodeStyle::RegionalIndicator - regional indicator symbols

=head1 DESCRIPTION

Style table for L<Text::UnicodeStyle>: see its documentation for
details on the C<table()> format and the C<stylize()> function.

Regional indicators are caseless: both uppercase and lowercase ASCII
letters map to the same symbol range U+1F1E6..U+1F1FF. Pairs of
regional indicators form flag emoji, e.g. C<US> becomes the flag of
the United States.

=head1 SEE ALSO

L<Text::UnicodeStyle>

=cut
