# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

EGIT_REPO_URI="git://github.com/techno/python-twoauth.git"
PYTHON_DEPEND="2:2.6"
inherit git-2 distutils

DESCRIPTION="OAuth supported Twitter library"
HOMEPAGE="https://github.com/techno/python-twoauth"

LICENSE="MIT"
KEYWORDS="~x86 ~amd64 ~ppc"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
