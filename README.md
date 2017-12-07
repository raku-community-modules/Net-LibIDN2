NAME
====

Net::LibIDN2 - Perl6 bindings for GNU LibIDN2

SYNOPSIS
========

	use Net::LibIDN2;

	my Int $code;
	my $lookup = Net::LibIDN2::idn2_lookup_u8('test', Net::LibIDN2::IDN2_NFC_INPUT, $code);
	say "$lookup $code"; # test 0

	# TODO: finish writing documentation

DESCRIPTION
===========

Net::LibIDN2 is a port of the Perl5 Net::LibIDN2 library by Thomas Jacob.

COPYRIGHT AND LICENSE
=====================

Copyright 2017 Ben Davies

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.
