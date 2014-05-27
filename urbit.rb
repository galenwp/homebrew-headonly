require 'formula'

class Urbit < Formula

    homepage "https://urbit.org"
    head "https://github.com/urbit/urbit.git"

    depends_on 'gmp'
    depends_on 'libsigsegv'
    depends_on 'openssl'

    def install 
        system 'make'
        bin.install 'bin/vere'
    end
end

