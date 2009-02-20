#!/usr/bin/env perl

use strict;
use Test::More tests => 6;

use_ok('Number::Phone::CountryCode') or exit 1;

# make sure api works like it should
my $pc = Number::Phone::CountryCode->new('AF');
isa_ok $pc, 'Number::Phone::CountryCode';
is $pc->country, 'AF';
is $pc->country_code, '93';
is $pc->ndd_prefix, '0';
is $pc->idd_prefix, '00';

