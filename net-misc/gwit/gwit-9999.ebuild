# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit python git-2 eutils

DESCRIPTION="Poweful Twitter client for Linux using PyGTK"
HOMEPAGE="http://sourceforge.jp/projects/gwit/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-python/python-twoauth
>=dev-python/pygtk-2.24
>=x11-libs/libnotify-0.7.4"

EGIT_REPO_URI="git://git.sourceforge.jp/gitroot/gwit/gwit.git"
EGIT_BRANCH="master"
PYTHON_DEPEND="2:2.6"

src_prepare() {
	cd "${WORKDIR}"
	mv gwit all
}

src_install() {
	exeinto /usr/share/gwit
	doexe gwit
	insinto /usr/share/gwit
	doins -r gwitlib
	dosym /usr/share/gwit/gwit /usr/bin/gwit
	dodoc README README.ja
}
