# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Command-line flags module for Unix shell scripts"
SRC_URI="http://${PN}.googlecode.com/files/${P}.tgz"
HOMEPAGE="https://code.google.com/p/shflags"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND=""

src_install() {
	dolib src/shflags || die "dolib failed"
	dodoc README.txt
}
