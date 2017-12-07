use v6.c;
unit module Net::LibIDN2::Native;

use NativeCall;

constant IDN2 = 'idn2';

our sub idn2_to_ascii_4i(Str is encoded('utf32'), size_t, Pointer[Str] is encoded('ascii') is rw, int32 --> int32) is native(IDN2) { !!! }
our sub idn2_to_ascii_4z(Str is encoded('utf32'), Pointer[Str] is encoded('ascii') is rw, int32 --> int32) is native(IDN2) { !!! }
our sub idn2_to_ascii_8z(Str, Pointer[Str] is encoded('ascii') is rw, int32 --> int32) is native(IDN2) { * }
our sub idn2_to_ascii_lz(Str, Pointer[Str] is encoded('ascii') is rw, int32 --> int32) is native(IDN2) { * }
our sub idn2_to_unicode_44i(Str is encoded('utf32'), size_t, Pointer[Str] is encoded('utf32') is rw, size_t is rw, int32 --> int32) is native(IDN2) { !!! }
our sub idn2_to_unicode_4z4z(Str is encoded('utf32'), Pointer[Str] is encoded('utf32') is rw, int32 --> int32) is native(IDN2) { !!! }
our sub idn2_to_unicode_8z4z(Str, Pointer[Str] is encoded('utf32') is rw, int32 --> int32) is native(IDN2) { !!! }
our sub idn2_to_unicode_8z8z(Str, Pointer[Str] is rw, int32 --> int32) is native(IDN2) { * }
our sub idn2_to_unicode_8zlz(Str, Pointer[Str] is rw, int32 --> int32) is native(IDN2) { * }
our sub idn2_to_unicode_lzlz(Str, Pointer[Str] is rw, int32 --> int32) is native(IDN2) { * }
our sub idn2_lookup_u8(Str, Pointer[Str] is rw, int32 --> int32) is native(IDN2) { * }
our sub idn2_lookup_ul(Str, Pointer[Str] is rw, int32 --> int32) is native(IDN2) { * }
our sub idn2_register_u8(Str, Str, Pointer[Str] is rw, int32 --> int32) is native(IDN2) { * }
our sub idn2_register_ul(Str, Str, Pointer[Str] is rw, int32 --> int32) is native(IDN2) { * }

our sub idn2_strerror(int32 --> Str) is native(IDN2) { * }
our sub idn2_strerror_name(int32 --> Str) is native(IDN2) { * }
our sub idn2_free(Pointer[Str]) is native(IDN2) { * }
our sub idn2_check_version(Str --> Str) is native(IDN2) { * }
