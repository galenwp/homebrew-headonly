require 'formula'

class Urbit < Formula
    homepage "https://urbit.org"
    head "https://github.com/urbit/urbit.git"

    depends_on 'gmp'
    depends_on 'libsigsegv'
    depends_on 'openssl'

    depends_on 'libtool'  => :build
    depends_on 'autoconf' => :build
    depends_on 'automake' => :build
    depends_on 'cmake'    => :build

    def install
        ENV.deparallelize
        system "make", "LIB=#{share}"
        bin.install 'bin/urbit'
        mkdir share
        mkdir share/'zod'
        cp   'urb/urbit.pill', share
        cp_r 'urb/zod/.', share/'zod'
    end

    test do
        system 'urbit'
    end
end
