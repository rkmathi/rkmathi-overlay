# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

EGIT_REPO_URI="git://git.sourceforge.jp/gitroot/gwit/gwit.git"
PYTHON_DEPEND="2:2.5"

inherit git-2 python eutils

DESCRIPTION="Poweful Twitter client for Linux using PyGTK"
HOMEPAGE="http://sourceforge.jp/projects/gwit/"

LICENSE="GPL-3"
KEYWORDS="~x86 ~amd64 ~ppc"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/python-twoauth
	>=dev-python/pygtk-2.24
	>=x11-libs/libnotify-0.7.4"

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
