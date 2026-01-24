#!/usr/bin/perl -CS

use utf8;
use 5.010;
use strict;
use warnings;

my %styles = (
    monospace => {
        A => 0x1D670,
        a => 0x1D68A,
    },

    script => {
        A => 0x1D49C,
        a => 0x1D4B6,
        fix => {
            A => 0x1D49C, C => 0x1D49E, D => 0x1D49F,
            G => 0x1D4A2, J => 0x1D4A5, K => 0x1D4A6,
            N => 0x1D4A9, O => 0x1D4AA, P => 0x1D4AB,
            Q => 0x1D4AC, S => 0x1D4AE, T => 0x1D4AF,
            U => 0x1D4B0, V => 0x1D4B1, W => 0x1D4B2,
            X => 0x1D4B3, Y => 0x1D4B4, Z => 0x1D4B5,
        },
    },

    fraktur => {
        A => 0x1D504,
        a => 0x1D51E,
        fix => {
            H => 0x210C,
            I => 0x2111,
            R => 0x211C,
            Z => 0x2128,
        },
    },

    doublestruck => {
        A => 0x1D538,
        a => 0x1D552,
        fix => {
            C => 0x2102,
            H => 0x210D,
            N => 0x2115,
            P => 0x2119,
            Q => 0x211A,
            R => 0x211D,
            Z => 0x2124,
        },
    },
);

sub stylize {
    my ($s, $style) = @_;
    my $cfg = $styles{$style} or die "Unknown style";

    $s =~ s{
        ([A-Za-z])
    }{
        my $c = $1;
        if ($cfg->{fix} && exists $cfg->{fix}{$c}) {
            chr $cfg->{fix}{$c};
        }
        elsif ($c ge 'A' && $c le 'Z') {
            chr($cfg->{A} + ord($c) - ord('A'));
        }
        else {
            chr($cfg->{a} + ord($c) - ord('a'));
        }
    }gex;

    return $s;
}

say stylize('route_id', 'monospace');
say stylize('route_short_name', 'monospace');
say stylize('ABCXYZ',   'script');
say stylize('CHRNZ',    'doublestruck');
