use v6.c;
use Net::LibIDN2::Native;
use Test;

ok Net::LibIDN2::Native::idn2_check_version('2.0.0'), 'LibIDN2 v2.0.0 or greater must be installed!';

done-testing;
