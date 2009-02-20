package Number::Phone::CountryCode;

use strict;
use base qw(Class::Accessor);

__PACKAGE__->mk_ro_accessors(qw(country
                                country_code
                                idd_prefix
                                ndd_prefix));

our $VERSION = '0.01';

# Codes hash
# ISO code maps to 3 element array containing:
# Country prefix
# IDD prefix
# NDD prefix

my %Codes = (
    AF => [ '93',   '00',    '0'],     # Afghanistan
    AL => ['355',   '00',    '0'],     # Albania
    DZ => ['213',   '00',    '7'],     # Algeria
    AS => ['684',   '00',  undef],     # American Samoa
    AD => ['376',   '00',  undef],     # Andorra
    AO => ['244',   '00',    '0'],     # Angola
    AI => [  '1',  '011',    '1'],     # Anguilla
    AQ => ['672',  undef,  undef],     # Antarctica
    AG => [  '1',  '011',    '1'],     # Antigua and Barbuda
    AN => ['599',  undef,  undef],     # Netherlands Antilles
    AR => [ '54',   '00',    '0'],     # Argentina
    AM => ['374',   '00',    '0'],     # Armenia
    AW => ['297',   '00',  undef],     # Aruba
    AU => [ '61', '0011',  undef],     # Australia
    AT => [ '43',   '00',    '0'],     # Austria
    AZ => ['994',   '00',    '0'],     # Azerbaijan
    BS => [  '1',  '011',    '1'],     # Bahamas
    BH => ['973',   '00',  undef],     # Bahrain
    BD => ['880',   '00',    '0'],     # Bangladesh
    BB => [  '1',  '011',    '1'],     # Barbados
    AG => [  '1',  '011',    '1'],     # Antigua and Barbuda
    BY => ['375',  '810',    '8'],     # Belarus (IDD really 8**10)
    BE => [ '32',   '00',    '0'],     # Belgium
    BZ => ['501',   '00',    '0'],     # Belize
    BJ => ['229',   '00',  undef],     # Benin
    BM => [  '1',  '011',    '1'],     # Bermuda
    BT => ['975',   '00',  undef],     # Bhutan
    BO => ['591',   '00',    '0'],     # Bolivia
    BA => ['387',   '00',    '0'],     # Bosnia and Herzegovina
    BW => ['267',   '00',  undef],     # Botswana
    BR => [ '55',   '00',    '0'],     # Brazil
    BN => ['673',   '00',    '0'],     # Brunei Darussalam
    BG => ['359',   '00',    '0'],     # Bulgaria
    BF => ['226',   '00',  undef],     # Burkina Faso
    BI => ['257',   '90',  undef],     # Burundi
    KH => ['855',  '001',    '0'],     # Cambodia
    CM => ['237',   '00',  undef],     # Cameroon
    CA => [  '1',  '011',    '1'],     # Canada
    CV => ['238',    '0',  undef],     # Cape Verde Islands
    KY => [  '1',  '011',    '1'],     # Cayman Islands
    CF => ['236',   '00',  undef],     # Central African Republic
    EC => ['235',   '15',  undef],     # Ecuador
    CL => [ '56',   '00',    '0'],     # Chile
    TW => [ '86',   '00',    '0'],     # Taiwan, Province of China
    CX => [ '61', '0011',    '0'],     # Christmas Island
    TC => [ '61', '0011',    '0'],     # Turks and Caicos Islands
    CO => [ '57',  '009',   '09'],     # Colombia
    KM => ['269',   '00',  undef],     # Comoros
    MN => ['242',   '00',  undef],     # Mongolia
    CD => ['243',   '00',  undef],     # Congo (Dem. Rep. of / Zaire)
    TC => ['682',   '00',   '00'],     # Turks and Caicos Islands
    CR => ['506',   '00',  undef],     # Costa Rica
    CI => ['225',   '00',    '0'],     # Cote D'Ivoire
    HR => ['385',   '00',    '0'],     # Croatia
    EC => [ '53',  '119',    '0'],     # Ecuador
    CY => ['357',   '00',  undef],     # Cyprus
    CZ => ['420',   '00',  undef],     # Czech Republic
    DK => [ '45',   '00',  undef],     # Denmark
    DJ => ['253',   '00',  undef],     # Djibouti
    DO => [  '1',  '011',  undef],     # Dominican Republic
    DO => [  '1',  '011',  undef],     # Dominican Republic
    TL => ['670',   '00',  undef],     # Timor-Leste
    EC => ['593',   '00',    '0'],     # Ecuador
    EG => [ '20',   '00',    '0'],     # Egypt
    SV => ['503',   '00',  undef],     # El Salvador
    GQ => ['240',   '00',  undef],     # Equatorial Guinea
    ER => ['291',   '00',  undef],     # Eritrea
    EE => ['372',   '00',  undef],     # Estonia
    ET => ['251',   '00',    '0'],     # Ethiopia
    FK => ['500',   '00',  undef],     # Falkland Islands (Malvinas)
    FO => ['298',   '00',  undef],     # Faroe Islands
    FJ => ['679',   '00',  undef],     # Fiji
    FI => ['358',   '00',    '0'],     # Finland
    FR => [ '33',   '00',  undef],     # France
    GF => ['594',   '00',  undef],     # French Guiana
    PF => ['689',   '00',  undef],     # French Polynesia
    GA => ['241',   '00',  undef],     # Gabonese Republic
    GM => ['220',   '00',  undef],     # Gambia
    GS => ['995',  '810',    '8'],     # South Georgia and the South Sandwich Islands (IDD really 8**10)
    DE => [ '49',   '00',    '0'],     # Germany
    GH => ['233',   '00',  undef],     # Ghana
    GI => ['350',   '00',  undef],     # Gibraltar
    GR => [ '30',   '00',  undef],     # Greece
    GL => ['299',   '00',  undef],     # Greenland
    GD => [  '1',  '011',    '4'],     # Grenada
    GP => ['590',   '00',  undef],     # Guadeloupe
    GM => [  '1',  '011',    '1'],     # Gambia
    GT => ['502',   '00',  undef],     # Guatemala
    PG => ['224',   '00',    '0'],     # Papua New Guinea
    GW => ['245',   '00',  undef],     # Guinea-Bissau
    GF => ['592',  '001',    '0'],     # French Guiana
    HT => ['509',   '00',    '0'],     # Haiti
    HN => ['504',   '00',    '0'],     # Honduras
    HK => ['852',  '001',  undef],     # Hong Kong
    HU => [ '36',   '00',   '06'],     # Hungary
    IE => ['354',   '00',    '0'],     # Ireland
    IO => [ '91',   '00',    '0'],     # British Indian Ocean Territory
    ID => [ '62',  '001',  undef],     # Indonesia
    IO => [ '98',   '00',    '0'],     # British Indian Ocean Territory
    IR => ['964',   '00',    '0'],     # Iran, Islamic Republic of
    IL => ['972',   '00',  undef],     # Israel
    IT => [ '39',   '00',  undef],     # Italy
    JM => [  '1',  '011',    '1'],     # Jamaica
    JP => [ '81',  '001',  undef],     # Japan
    JO => ['962',   '00',    '0'],     # Jordan
    KZ => [  '7',  '810',    '8'],     # Kazakhstan (IDD really 8**10)
    KE => ['254',  '000',  undef],     # Kenya
    KI => ['686',   '00',    '0'],     # Kiribati
    KP => ['850',   '00',    '0'],     # Korea, Democratic People's Republic of
    KR => [ '82',  '001',  undef],     # Korea (South)
    KW => ['965',   '00',    '0'],     # Kuwait
    KG => ['996',   '00',    '0'],     # Kyrgyzstan
    MY => ['856',   '14',    '0'],     # Malaysia
    LV => ['371',   '00',    '8'],     # Latvia
    LB => ['961',   '00',  undef],     # Lebanon
    LS => ['266',   '00',    '0'],     # Lesotho
    LR => ['231',   '00',   '22'],     # Liberia
    LY => ['218',   '00',    '0'],     # Libyan Arab Jamahiriya
    LI => ['423',   '00',  undef],     # Liechtenstein
    LT => ['370',   '00',    '8'],     # Lithuania
    LU => ['352',   '00',  undef],     # Luxembourg
    MO => ['853',   '00',    '0'],     # Macao
    MK => ['389',   '00',    '0'],     # Macedonia, the Former Yugoslav Republic of
    MG => ['261',   '00',    '0'],     # Madagascar
    MW => ['265',   '00',  undef],     # Malawi
    MY => [ '60',   '00',    '0'],     # Malaysia
    MV => ['960',   '00',    '0'],     # Maldives
    LY => ['223',   '00',    '0'],     # Libyan Arab Jamahiriya
    SO => ['356',   '00',    '0'],     # Somalia
    MH => ['692',  '011',    '1'],     # Marshall Islands
    MQ => ['596',   '00',    '0'],     # Martinique
    MR => ['222',   '00',    '0'],     # Mauritania
    MU => ['230',   '00',    '0'],     # Mauritius
    YT => ['269',   '00',  undef],     # Mayotte
    MX => [ '52',   '00',   '01'],     # Mexico
    FM => ['691',  '011',    '1'],     # Micronesia, Federated States of
    MD => ['373',   '00',    '0'],     # Moldova, Republic of
    MC => ['377',   '00',    '0'],     # Monaco
    MN => ['976',  '001',    '0'],     # Mongolia
    MS => [  '1',  '011',  undef],     # Montserrat
    MA => ['212',   '00',  undef],     # Morocco
    MZ => ['258',   '00',    '0'],     # Mozambique
    NA => ['264',   '09',    '0'],     # Namibia
    NR => ['674',   '00',    '0'],     # Nauru
    SN => ['977',   '00',    '0'],     # Senegal
    NL => [ '31',   '00',    '0'],     # Netherlands
    AN => ['599',   '00',    '0'],     # Netherlands Antilles
    KN => [  '1',  '011',    '1'],     # Saint Kitts and Nevis
    NC => ['687',   '00',    '0'],     # New Caledonia
    NZ => [ '64',   '00',    '0'],     # New Zealand
    NI => ['505',   '00',    '0'],     # Nicaragua
    NE => ['227',   '00',    '0'],     # Niger
    NG => ['234',  '009',    '0'],     # Nigeria
    NU => ['683',   '00',    '0'],     # Niue
    NF => ['672',   '00',  undef],     # Norfolk Island
    MP => [  '1',  '011',    '1'],     # Northern Mariana Islands
    NO => [ '47',   '00',  undef],     # Norway
    SB => ['968',   '00',    '0'],     # Solomon Islands
    PK => [ '92',   '00',    '0'],     # Pakistan
    PW => ['680',  '011',  undef],     # Palau
    PS => ['970',   '00',    '0'],     # Palestinian Territory, Occupied
    PA => ['507',   '00',  undef],     # Panama
    PG => ['675',   '05',  undef],     # Papua New Guinea
    PY => ['595',  '002',    '0'],     # Paraguay
    PE => [ '51',   '00',    '0'],     # Peru
    PH => [ '63',   '00',    '0'],     # Philippines
    PL => [ '48',   '00',    '0'],     # Poland
    PT => ['351',   '00',  undef],     # Portugal
    PR => [  '1',  '011',    '1'],     # Puerto Rico
    QA => ['974',    '0',    '0'],     # Qatar
    RE => ['262',   '00',    '0'],     # Reunion
    RO => [ '40',   '00',    '0'],     # Romania
    BN => [  '7',  '810',  undef],     # Brunei Darussalam (IDD really 8**10)
    RW => ['250',   '00',    '0'],     # Rwanda
    SH => ['290',   '00',  undef],     # Saint Helena
    KN => [  '1',  '011',    '1'],     # Saint Kitts and Nevis
    LC => [  '1',  '011',    '1'],     # Saint Lucia
    PM => ['508',   '00',    '0'],     # Saint Pierre and Miquelon
    VC => [  '1',  '011',    '1'],     # Saint Vincent and the Grenadines
    WS => ['685',    '0',  undef],     # Samoa (Western)
    SM => ['378',   '00',    '0'],     # San Marino
    ST => ['239',   '00',    '0'],     # Sao Tome and Principe
    SA => ['966',   '00',    '0'],     # Saudi Arabia
    SN => ['221',   '00',    '0'],     # Senegal
    RS => ['381',   '99',    '0'],     # Serbia
    SC => ['248',   '00',    '0'],     # Seychelles
    SL => ['232',   '00',    '0'],     # Sierra Leone
    SG => [ '65',  '001',  undef],     # Singapore
    SK => ['421',   '00',    '0'],     # Slovakia
    SI => ['386',   '00',    '0'],     # Slovenia
    SB => ['677',   '00',  undef],     # Solomon Islands
    SO => ['252',   '00',  undef],     # Somalia
    ZA => [ '27',   '09',    '0'],     # South Africa
    PM => [ '34',   '00',  undef],     # Saint Pierre and Miquelon
    LK => [ '94',   '00',    '0'],     # Sri Lanka
    SD => ['249',   '00',    '0'],     # Sudan
    SR => ['597',   '00',  undef],     # Suriname
    SZ => ['268',   '00',  undef],     # Swaziland
    SE => [ '46',   '00',    '0'],     # Sweden
    CH => [ '41',   '00',    '0'],     # Switzerland
    AT => ['963',   '00',  undef],     # Austria
    TW => ['886',  '002',  undef],     # Taiwan, Province of China
    TJ => ['992',  '810',    '8'],     # Tajikistan (IDD really 8**10)
    TZ => ['255',  '000',  undef],     # Tanzania, United Republic of
    TH => [ '66',  '001',  undef],     # Thailand
    TG => ['228',   '00',  undef],     # Togo
    TK => ['690',   '00',  undef],     # Tokelau
    EE => ['676',   '00',  undef],     # Estonia
    TT => [  '1',  '011',    '1'],     # Trinidad and Tobago
    TN => ['216',   '00',    '0'],     # Tunisia
    TR => [ '90',   '00',    '0'],     # Turkey
    TM => ['993',  '810',    '8'],     # Turkmenistan (IDD really 8**10)
    TC => [  '1',  '011',    '1'],     # Turks and Caicos Islands
    TV => ['688',   '00',  undef],     # Tuvalu
    UG => ['256',  '000',  undef],     # Uganda
    UA => ['380',  '810',    '8'],     # Ukraine (IDD really 8**10)
    AE => ['971',   '00',  undef],     # United Arab Emirates
    GB => [ '44',   '00',    '0'],     # United Kingdom
    US => [  '1',  '011',    '1'],     # United States
    UY => ['598',   '00',    '0'],     # Uruguay
    PG => [  '1',  '011',    '1'],     # Papua New Guinea
    UZ => ['998',  '810',    '8'],     # Uzbekistan (IDD really 8**10)
    VU => ['678',   '00',  undef],     # Vanuatu
    VA => ['379',   '00',  undef],     # Holy See (Vatican City State)
    VE => [ '58',   '00',  undef],     # Venezuela
    VN => [ '84',   '00',    '0'],     # Viet Nam
    VG => [  '1',  '011',    '1'],     # Virgin Islands, British
    VI => [  '1',  '011',    '1'],     # Virgin Islands, U.S.
    WF => ['681',   '19',  undef],     # Wallis and Futuna Islands
    EH => ['685',    '0',  undef],     # Western Sahara
    YE => ['967',   '00',    '0'],     # Yemen
    GM => ['260',   '00',    '0'],     # Gambia
    ZW => ['263',  '110',    '0']      # Zimbabwe
);

=head1 NAME

Number::Phone::CountryCode - Country phone dialing prefixes

=head1 SYNOPSIS

 use Number::Phone::CountryCode;

 # retrieve object of United Kingdom codes.
 my $pc = Number::Phone::CountryCode->new('GB');

 print $pc->country;       # ISO 3166 code, e.g: GB
 print $pc->country_code;  # country prefix
 print $pc->idd_prefix;    # IDD prefix
 print $pc->ndd_prefix;    # NDD prefix

 # get list of supported ISO 3166 codes
 my @countries = Number::Phone::CountryCode->countries;

See below for description of the country/IDD/NDD prefixes.

=head1 DESCRIPTION

This module provides an interface to lookup country specific dialing prefixes.
These prefixes are useful when working with phone numbers from different
countries.  The follwing codes are available for each country:

=head2 Country Code

This is the national prefix to be used with dialing B<to> a country B<from>
another country.

=head2 National Direct Dialing Prefix (NDD)

This is the prefix used to make a call B<within a country> from one city to
another.  This prefix may not be necessary when calling another city in the
same vicinity.  This is followed by the city or area code for the place you are
calling.  For example, in the US, the NDD prefix is "1", so you must dial 1
before the area code to place a long distance call within the country.

=head2 International Direct Dialing Prefix (IDD)

This is the prefix needed to make a call B<from a country> to another country.
This is followed by the country code for the country you are calling.  For
example, when calling another country from the US, you must dial 011.

=cut

=head1 CONSTRUCTOR

=over 4

=item new($country)

Constructs a new Number::Phone::CountryCode object.  C<$country> is the two
digit ISO 3166 country code for the country you wish to look up.  Returns
C<undef> if the country code did not match one of the supported countries.

=back

=cut

sub new {
    my ($class, $country) = @_;

    $country = uc $country;

    my $data = $Codes{$country};

    # return nothing if no data for this country code.
    return unless defined $data;

    return $class->SUPER::new({
        country      => $country,
        country_code => $data->[0],
        idd_prefix   => $data->[1],
        ndd_prefix   => $data->[2]
    });
}

=head1 METHODS

The following methods are available

=over 4

=item country

the ISO 3166 country code for this country

=item country_code

The national prefix for this country

=item ndd_prefix

The NDD prefix for this country. Note that this might be undef if no prefix is
necessary.

=item idd_prefix

The IDD prefix for this country.  Note that this might be undef if no prefix is
necessary.

=back

=cut

=head1 CLASS METHODS

The following class methods are available (may be called without constructing
an object).

=over 4

=item countries

Returns a list of all ISO 3166 country codes supported by this module.

=cut

sub countries {
    return sort keys %Codes;
}

=item is_supported($country)

Returns true if the given country is supported, false otherwise.  C<$country>
is a 2 character ISO 3166 country code.

=cut

sub is_supported {
    my ($class, $code) = @_;

    $code = uc $code;

    return defined $Codes{$code} ? 1 : 0;
}

=back

=cut

1;

__END__

=head1 SOURCE

You can contribute to or fork this project via github:

http://github.com/mschout/number-phone-countrycode/tree/master

 git clone git://github.com/mschout/number-phone-countrycode.git

=head1 BUGS / FEEDBACK

Please report any bugs or feature requests to
bug-number-phone-countrycode@rt.cpan.org, or through the web interface at
http://rt.cpan.org

I welcome feedback, and additions/corrections to the country code data
contained within this module.

=head1 AUTHOR

Michael Schout, E<lt>mschout@gkg.net<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2009 by Michael Schout

This library is free software; you can redistribute it and/or modify it under
the same terms as Perl itself, either Perl version 5.8.0 or, at your option,
any later version of Perl 5 you may have available.

=cut
