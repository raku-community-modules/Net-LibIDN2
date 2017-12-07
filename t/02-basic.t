use v6.c;

use NativeCall;
use Net::LibIDN2 :ALL;
use Test;

{
	my $input := 'test';
	my $flags := IDN2_NFC_INPUT;
	my Int $code;
	is idn2_lookup_u8($input, $flags, $code), $input;
	is $code, IDN2_OK;
	is idn2_lookup_ul($input, $flags, $code), $input;
	is $code, IDN2_OK;
}

{
	my $uinput := "m\xFC\xDFli";
	my $ainput := 'xn--mli-5ka8l';
	my $flags := IDN2_NFC_INPUT;
	my Int $code;
	is idn2_register_u8($uinput, $ainput, $flags, $code), $ainput;
	is $code, IDN2_OK;
}

{
	is idn2_strerror(IDN2_OK), 'success';
	is idn2_strerror_name(IDN2_OK), 'IDN2_OK';
	is idn2_check_version(), IDN2_VERSION;
	is idn2_check_version('255.255.65525'), '';
}

done-testing;
