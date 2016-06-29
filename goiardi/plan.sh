pkg_name=goiardi
pkg_origin=js
pkg_version="0.10.4"
pkg_shasum=3cf20a05f01abb8c5cae289bc6a4f9e86214202e0843e450e6a17e094ee6668a
pkg_maintainer="Balazs Nagy <julsevern@gmail.com>"
pkg_license=('Apache-2.0')

pkg_source="https://github.com/ctdk/goiardi/releases/download/v${pkg_version}/${pkg_name}-${pkg_version}-linux-amd64"
pkg_filename="goiardi"

pkg_expose=(4545 4646)

do_unpack() {
    return 0
}

do_build() {
    return 0
}

do_strip() {
    return 0
}

do_install() {
    mkdir -p $pkg_prefix/bin
    cp /hab/cache/src/goiardi $pkg_prefix/bin
    chmod 755 $pkg_prefix/bin/goiardi
}
