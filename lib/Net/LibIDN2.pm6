use v6.c;
unit module Net::LibIDN2:ver<0.0.1>:auth<Ben Davies (kaiepi@outlook.com)>;

=begin pod

=head1 NAME

Net::LibIDN2 - Perl6 bindings for GNU LibIDN2

=head1 SYNOPSIS

=begin code

	use Net::LibIDN2;

	my Int $code;
	my $lookup = Net::LibIDN2::idn2_lookup_u8('test', Net::LibIDN2::IDN2_NFC_INPUT, $code);
	say "$lookup $code"; # test 0

	# TODO: finish writing documentation

=end code

=head1 DESCRIPTION

Net::LibIDN2 is a port of the Perl5 Net::LibIDN2 library by Thomas Jacob.

=head1 AUTHOR

Ben Davies <kaiepi@outlook.com>

=head1 COPYRIGHT AND LICENSE

Copyright 2017 Ben Davies

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod

use NativeCall;
use Net::LibIDN2::Native;

constant IDN2_VERSION is export = Net::LibIDN2::Native::idn2_check_version('2.0.0');
constant IDN2_VERSION_NUMBER is export = :16(sprintf '%02x%02x%04x', map { :16(.Str) }, values IDN2_VERSION ~~ / ^(\d+)\.(\d+)\.(\d+)$ /);
constant IDN2_VERSION_MAJOR is export = IDN2_VERSION_NUMBER +& 0xFF000000 +> 24;
constant IDN2_VERSION_MINOR is export = IDN2_VERSION_NUMBER +& 0x00FF0000 +> 16;
constant IDN2_VERSION_PATCH is export = IDN2_VERSION_NUMBER +& 0x0000FFFF;

constant IDN2_LABEL_MAX_LENGTH is export = 63;
constant IDN2_DOMAIN_MAX_LENGTH is export = 255;

constant IDN2_NFC_INPUT is export = 1;
constant IDN2_ALABEL_ROUNDTRIP is export = 2;
constant IDN2_TRANSITIONAL is export = 4;
constant IDN2_NONTRANSITIONAL is export = 8;
constant IDN2_ALLOW_UNASSIGNED is export = 16;
constant IDN2_USE_STD3_ASCII_RULES is export = 32;

constant IDN2_OK is export(:ALL) = 0;
constant IDN2_MALLOC is export(:ALL) = -100;
constant IDN2_NO_CODESET is export(:ALL) = -101;
constant IDN2_ICONV_FAIL is export(:ALL) = -102;
constant IDN2_ENCODING_ERROR is export(:ALL) = -200;
constant IDN2_NFC is export(:ALL) = -201;
constant IDN2_PUNYCODE_BAD_INPUT is export(:ALL) = -202;
constant IDN2_PUNYCODE_BIG_OUTPUT is export(:ALL) = -203;
constant IDN2_PUNYCODE_OVERFLOW is export(:ALL) = -204;
constant IDN2_TOO_BIG_DOMAIN is export(:ALL) = -205;
constant IDN2_TOO_BIG_LABEL is export(:ALL) = -206;
constant IDN2_INVALID_ALABEL is export(:ALL) = -207;
constant IDN2_UALABEL_MISMATCH is export(:ALL) = -208;
constant IDN2_INVALID_FLAGS is export(:ALL) = -209;
constant IDN2_NOT_NFC is export(:ALL) = -300;
constant IDN2_2HYPHEN is export(:ALL) = -301;
constant IDN2_HYPHEN_STARTEND is export(:ALL) = -302;
constant IDN2_LEADING_COMBINING is export(:ALL) = -303;
constant IDN2_DISALLOWED is export(:ALL) = -304;
constant IDN2_CONTEXTJ is export(:ALL) = -305;
constant IDN2_CONTEXTJ_NO_RULE is export(:ALL) = -306;
constant IDN2_CONTEXTO is export(:ALL) = -307;
constant IDN2_CONTEXTO_NO_RULE is export(:ALL) = -308;
constant IDN2_UNASSIGNED is export(:ALL) = -309;
constant IDN2_BIDI is export(:ALL) = -310;
constant IDN2_DOT_IN_LABEL is export(:ALL) = -311;
constant IDN2_INVALID_TRANSITIONAL is export(:ALL) = -312;
constant IDN2_INVALID_NONTRANSITIONAL is export(:ALL) = -313;

proto idn2_to_ascii_4i(Str, Int $?, Int $? --> Str) { !!! }
multi sub idn2_to_ascii_4i(Str $input, Int $flags = 0 --> Str) { !!! }
multi sub idn2_to_ascii_4i(Str $input, Int $flags, Int $code is rw --> Str) { !!! }

proto idn2_to_ascii_4z(Str, Int $?, Int $? --> Str) { !!! }
multi sub idn2_to_ascii_4z(Str $input, Int $flags = 0 --> Str) { !!! }
multi sub idn2_to_ascii_4z(Str $input, Int $flags, Int $code is rw --> Str) { !!! }

our proto idn2_to_ascii_8z(Str, Int $?, Int $? --> Str) { * }

our multi sub idn2_to_ascii_8z(Str $input, Int $flags = 0 --> Str) {
	my $output := Pointer[Str].new;
	my $code := Net::LibIDN2::Native::idn2_to_ascii_8z($input, $output, $flags);
	return '' if $code !== IDN2_OK;

	my $res := $output.deref;
	Net::LibIDN2::Native::idn2_free($output);
	$res;
}

our multi sub idn2_to_ascii_8z(Str $input, Int $flags, Int $code is rw --> Str) {
	my $output := Pointer[Str].new;
	$code = Net::LibIDN2::Native::idn2_to_ascii_8z($input, $output, $flags);
	return '' if $code !== IDN2_OK;

	my $res := $output.deref;
	Net::LibIDN2::Native::idn2_free($output);
	$res;
}

our proto idn2_to_ascii_lz(Str, Int $?, Int $? --> Str) { * }

our multi sub idn2_to_ascii_lz(Str $input, Int $flags = 0 --> Str) {
	my $output := Pointer[Str].new;
	my $code := Net::LibIDN2::Native::idn2_to_ascii_lz($input, $output, $flags);
	return '' if $code !== IDN2_OK;

	my $res := $output.deref;
	Net::LibIDN2::Native::idn2_free($output);
	$res;
}

our multi sub idn2_to_ascii_lz(Str $input, Int $flags, Int $code is rw --> Str) {
	my $output := Pointer[Str].new;
	$code = Net::LibIDN2::Native::idn2_to_ascii_lz($input, $output, $flags);
	return '' if $code !== IDN2_OK;

	my $res := $output.deref;
	Net::LibIDN2::Native::idn2_free($output);
	$res;
}

proto idn2_to_unicode_44i(Str, Int $?, Int $? --> Str) { !!! }
multi sub idn2_to_unicode_44i(Str $input, Int $flags = 0 --> Str) { !!! }
multi sub idn2_to_unicode_44i(Str $input, Int $flags, Int $code is rw) { !!! }

proto idn2_to_unicode_4z4z(Str, Int $?, Int $? --> Str) { !!! }
multi sub idn2_to_unicode_4z4z(Str $input, Int $flags = 0 --> Str) { !!! }
multi sub idn2_to_unicode_4z4z(Str $input, Int $flags, Int $code is rw) { !!! }

proto idn2_to_unicode_8z4z(Str, Int $?, Int $? --> Str) { !!! }
multi sub idn2_to_unicode_8z4z(Str $input, Int $flags = 0 --> Str) { !!! }
multi sub idn2_to_unicode_8z4z(Str $input, Int $flags, Int $code is rw) { !!! }

our proto idn2_to_unicode_8z8z(Str, Int $?, Int $? --> Str) { * }

our multi sub idn2_to_unicode_8z8z(Str $input, Int $flags = 0 --> Str) {
	my $output := Pointer[Str].new;
	my $code := Net::LibIDN2::Native::idn2_to_unicode_8z8z($input, $output, $flags);
	return '' if $code !== IDN2_OK;

	my $res := $output.deref;
	Net::LibIDN2::Native::idn2_free($output);
	$res;
}

our multi sub idn2_to_unicode_8z8z(Str $input, Int $flags, Int $code is rw --> Str) {
	my $output := Pointer[Str].new;
	$code = Net::LibIDN2::Native::idn2_to_unicode_8z8z($input, $output, $flags);
	return '' if $code !== IDN2_OK;

	my $res := $output.deref;
	Net::LibIDN2::Native::idn2_free($output);
	$res;
}

our proto idn2_to_unicode_8zlz(Str, Int $?, Int $? --> Str) { * }

our multi sub idn2_to_unicode_8zlz(Str $input, Int $flags = 0 --> Str) {
	my $output := Pointer[Str].new;
	my $code := Net::LibIDN2::Native::idn2_to_unicode_8zlz($input, $output, $flags);
	return '' if $code !== IDN2_OK;

	my $res := $output.deref;
	Net::LibIDN2::Native::idn2_free($output);
	$res;
}

our multi sub idn2_to_unicode_8zlz(Str $input, Int $flags, Int $code is rw --> Str) {
	my $output := Pointer[Str].new;
	$code = Net::LibIDN2::Native::idn2_to_unicode_8zlz($input, $output, $flags);
	return '' if $code !== IDN2_OK;

	my $res := $output.deref;
	Net::LibIDN2::Native::idn2_free($output);
	$res;
}

our proto idn2_to_unicode_lzlz(Str, Int $?, Int $? --> Str) { * }

our multi sub idn2_to_unicode_lzlz(Str $input, Int $flags = 0 --> Str) {
	my $output := Pointer[Str].new;
	my $code := Net::LibIDN2::Native::idn2_to_unicode_lzlz($input, $output, $flags);
	return '' if $code !== IDN2_OK;

	my $res := $output.deref;
	Net::LibIDN2::Native::idn2_free($output);
	$res;
}

our multi sub idn2_to_unicode_lzlz(Str $input, Int $flags, Int $code is rw --> Str) {
	my $output := Pointer[Str].new;
	$code = Net::LibIDN2::Native::idn2_to_unicode_8zlz($input, $output, $flags);
	return '' if $code !== IDN2_OK;

	my $res := $output.deref;
	Net::LibIDN2::Native::idn2_free($output);
	$res;
}

our proto idn2_lookup_u8(Str, Int $?, Int $? --> Str) is export(:ALL) { * }

our multi sub idn2_lookup_u8(Str $input, Int $flags = 0 --> Str) is export(:ALL) {
	my $output := Pointer[Str].new;
	my $code := Net::LibIDN2::Native::idn2_lookup_u8($input, $output, $flags);
	return '' if $code !== IDN2_OK;

	my $res := $output.deref;
	Net::LibIDN2::Native::idn2_free($output);
	$res;
}

our multi sub idn2_lookup_u8(Str $input, Int $flags, Int $code is rw --> Str) is export(:ALL) {
	my $output := Pointer[Str].new;
	$code = Net::LibIDN2::Native::idn2_lookup_u8($input, $output, $flags);
	return '' if $code !== IDN2_OK;

	my $res := $output.deref;
	Net::LibIDN2::Native::idn2_free($output);
	$res;
}

our proto idn2_lookup_ul(Str, Int $?, Int $? --> Str) is export(:ALL) { * }

our multi sub idn2_lookup_ul(Str $input, Int $flags = 0 --> Str) is export(:ALL) {
	my $output := Pointer[Str].new;
	my $code := Net::LibIDN2::Native::idn2_lookup_ul($input, $output, $flags);
	return '' if $code !== IDN2_OK;

	my $res := $output.deref;
	Net::LibIDN2::Native::idn2_free($output);
	$res;
}

our multi sub idn2_lookup_ul(Str $input, Int $flags, Int $code is rw --> Str) is export(:ALL) {
	my $output := Pointer[Str].new;
	$code = Net::LibIDN2::Native::idn2_lookup_ul($input, $output, $flags);
	return '' if $code !== IDN2_OK;

	my $res := $output.deref;
	Net::LibIDN2::Native::idn2_free($output);
	$res;
}

our proto idn2_register_u8(Str, $?, Int $?, Int $? --> Str) is export(:ALL) { * }

our multi sub idn2_register_u8(Str $uinput, $ainput?, Int $flags = 0 --> Str) is export(:ALL) {
	my $output := Pointer[Str].new;
	my $code := Net::LibIDN2::Native::idn2_register_u8($uinput, $ainput, $output, $flags);
	return '' if $code !== IDN2_OK;

	my $res := $output.deref;
	Net::LibIDN2::Native::idn2_free($output);
	$res;
}

our multi sub idn2_register_u8(Str $uinput, $ainput, Int $flags, Int $code is rw --> Str) is export(:ALL) {
	my $output := Pointer[Str].new;
	$code = Net::LibIDN2::Native::idn2_register_u8($uinput, $ainput, $output, $flags);
	return '' if $code !== IDN2_OK;

	my $res := $output.deref;
	Net::LibIDN2::Native::idn2_free($output);
	$res;
}

our proto idn2_register_ul(Str, $?, Int $?, Int $? --> Str) is export(:ALL) { * }

our multi sub idn2_register_ul(Str $uinput, $ainput?, Int $flags = 0 --> Str) is export(:ALL) {
	my $output := Pointer[Str].new;
	my $code := Net::LibIDN2::Native::idn2_register_ul($uinput, $ainput, $output, $flags);
	return '' if $code !== IDN2_OK;

	my $res := $output.deref;
	Net::LibIDN2::Native::idn2_free($output);
	$res;
}

our multi sub idn2_register_ul(Str $uinput, $ainput, Int $flags, Int $code is rw --> Str) is export(:ALL) {
	my $output := Pointer[Str].new;
	$code = Net::LibIDN2::Native::idn2_register_ul($uinput, $ainput, $output, $flags);
	return '' if $code !== IDN2_OK;

	my $res := $output.deref;
	Net::LibIDN2::Native::idn2_free($output);
	$res;
}

our sub idn2_strerror(int32 $code --> Str) is export(:ALL) {
	Net::LibIDN2::Native::idn2_strerror($code) || '';
}

our sub idn2_strerror_name(int32 $code --> Str) is export(:ALL) {
	Net::LibIDN2::Native::idn2_strerror_name($code) || '';
}

our sub idn2_check_version(Str $version? --> Str) is export(:ALL) {
	Net::LibIDN2::Native::idn2_check_version($version) || '';
}
