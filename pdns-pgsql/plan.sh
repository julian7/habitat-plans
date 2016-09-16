pkg_name=pdns
pkg_origin=js
pkg_version="4.0.1"
pkg_shasum=d191eed4a6664430e85969f49835c59e810ecbb7b3eb506e64c6b2734091edd7
pkg_maintainer="Balazs Nagy <julsevern@gmail.com>"
pkg_license=('GPL-2.0')

pkg_source="https://downloads.powerdns.com/releases/${pkg_name}-${pkg_version}.tar.bz2"
pkg_lib_dirs=(lib/pdns)
pkg_deps=(
    core/openssl
    core/postgresql
)
pkg_build_deps=(
    core/make
    core/gcc
    core/openssl
    core/postgresql
    core/boost
    core/file
    core/diffutils
)

pkg_expose=(53 53/udp 8001)

do_prepare() {
    ln -fs $(command -v file) /usr/bin/file
}
do_build() {
    ./configure --prefix=$pkg_prefix \
        --enable-reproducible \
        --with-libcrypto=$(pkg_path_for openssl) \
        --with-boost=$(pkg_path_for boost) \
        --with-pgsql=$(pkg_path_for postgresql) \
        --with-modules="bind gpgsql"
    make
}
