# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="OAuth supported Twitter library"
HOMEPAGE="https://github.com/techno/python-twoauth"

inherit python git distutils

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

EGIT_REPO_URI="git://github.com/techno/python-twoauth.git"
EGIT_BRANCH="master"
PYTHON_DEPEND="2:2.6"
