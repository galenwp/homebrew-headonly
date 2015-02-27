require 'formula'

class Urbit < Formula

    homepage "https://urbit.org"
    head "https://github.com/urbit/urbit.git"

    depends_on 'gmp'
    depends_on 'libsigsegv'
    depends_on 'openssl'

    def install
        ENV.deparallelize
        system "make", "LIB=#{lib}/urb"

        bin.install 'bin/vere'
        mkdir_p lib/'urb/zod'
        (lib/'urb').cp stage/'urb/urbit.pill'
        (lib/'urb/zod').cp Dir[stage/'urb/zod/*']
    end

    test do
        system 'vere'
    end
end