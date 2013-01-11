# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="a LyX to HTML converter"
HOMEPAGE="http://elyxer.nongnu.org"
SRC_URI="http://download.savannah.gnu.org/releases/elyxer/elyxer-1.2.3.zip"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	sh run-tests || die
}

src_install() {
	exeinto /usr/share/elyxer
	doexe elyxer.py
	insinto /usr/share/elyxer
	dosym /usr/share/elyxer/elyxer.py /usr/bin/elyxer
}
