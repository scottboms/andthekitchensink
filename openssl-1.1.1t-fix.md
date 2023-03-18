# For ARM Macs (e.g. M1)


STEP 1:
Edit line 1582 in Configurations/10-main.conf:

	"darwin64-x86_64-cc" => {
	    inherit_from     => [ "darwin-common", asm("x86_64_asm") ],
	    CFLAGS           => add("-Wall"),
	    cflags           => add("-arch arm64 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk"),
	    lib_cppflags     => add("-DL_ENDIAN"),
	    bn_ops           => "SIXTY_FOUR_BIT_LONG",
	    perlasm_scheme   => "macosx",
	},

STEP 2:
Add 
#include <string.h>

to line 16 in tests/v3ext.c

STEP 3:

./configure --prefix=/usr/local/custom/openssl-1.1.1q shared enable-rc5 zlib darwin64-arm64-cc no-asm

STEP 4:
make -j8

STEP 5: 

sudo make install

# For Intel Macs

STEP 1:
Edit line 1581 in Configurations/10-main.conf:

    "darwin64-x86_64-cc" => {
        inherit_from     => [ "darwin-common", asm("x86_64_asm") ],
        CFLAGS           => add("-Wall"),
        cflags           => add("-arch x86_64 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk"),
        lib_cppflags     => add("-DL_ENDIAN"),
        bn_ops           => "SIXTY_FOUR_BIT_LONG",
        perlasm_scheme   => "macosx",
    },
		
STEP 2:
Add 

	#include <string.h>

to line 16 in tests/v3ext.c

STEP 3:

./configure --prefix=/usr/local/custom/openssl-1.1.1t shared enable-rc5 zlib darwin64-x86_64-cc no-asm

STEP 4:
make -j8

STEP 5: 

sudo make install
