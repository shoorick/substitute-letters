package Text::UnicodeStyle;
use strict;
use warnings;
use utf8;

use Exporter 'import';
our @EXPORT_OK = qw( styles stylize );
our %EXPORT_TAGS = ( all => \@EXPORT_OK );

my %STYLE_MODS = (
    doublestruck => 'Text::UnicodeStyle::Doublestruck',
    fraktur      => 'Text::UnicodeStyle::Fraktur',
    fullwidth    => 'Text::UnicodeStyle::Fullwidth',
    monospace    => 'Text::UnicodeStyle::Monospace',
    script       => 'Text::UnicodeStyle::Script',
);

my %TABLES;

sub _module_for {
    my ($style) = @_;
    return $STYLE_MODS{$style};
}

sub _table {
    my ($style) = @_;
    my $mod = _module_for($style)
        or die "Unknown style '$style'. Available: " . join(', ', styles()) . "\n";
    $TABLES{$style} //= do {
        eval "require $mod" or die $@;
        $mod->table;
    };
    return $TABLES{$style};
}

sub styles {
    return sort keys %STYLE_MODS;
}

sub stylize {
    my ($s, $style) = @_;
    my $t = _table($style);

    my $out = $s;
    $out =~ s{
        ([A-Za-z])
    }{
        my $c = $1;
        if ($t->{fix} && exists $t->{fix}{$c}) {
            chr $t->{fix}{$c};
        }
        elsif ($c le 'Z') {
            chr($t->{upper} + ord($c) - ord('A'));
        }
        else {
            chr($t->{lower} + ord($c) - ord('a'));
        }
    }gex;

    return $out;
}

1;

__END__

=head1 NAME

Text::UnicodeStyle - replace Latin letters with lookalike characters
from other Unicode ranges (mathematical alphanumeric symbols, etc.)

=head1 SYNOPSIS

    use Text::UnicodeStyle qw( stylize styles );

    say stylize('route_id', 'monospace');   # 𝐫𝐨𝐮𝐭𝐞_𝐢𝐝
    say join ', ', styles();                # doublestruck, fraktur, ...

=head1 DESCRIPTION

C<stylize> returns a copy of the input string where every ASCII letter
C<A-Z> and C<a-z> is replaced by the corresponding character of the
requested style. All other characters (digits, underscores, spaces,
already non-ASCII text) are left untouched.

Each style is defined by a base code point for uppercase and lowercase
letters plus an optional C<fix> table of exceptions (letters whose
Unicode position does not follow the contiguous range). Style tables
live in L<Text::UnicodeStyle::*> modules and are loaded lazily.

=head1 FUNCTIONS

=head2 stylize($string, $style)

Returns a new string with letters substituted. Dies on unknown style.
The input string is not modified.

=head2 styles()

Returns the sorted list of available style names.

=head1 STYLES

=over

=item monospace

=item script

=item fraktur

=item doublestruck

=back

=head1 SEE ALSO

L<example.pl> in the project repository for a runnable demo.

=cut
