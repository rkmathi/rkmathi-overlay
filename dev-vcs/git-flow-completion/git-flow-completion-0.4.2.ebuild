# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Bash, Zsh and fish completion support for git-flow."
GITHUB_USER="bobthecow"
GITHUB_TAG="${PV}"
SRC_URI="https://github.com/${GITHUB_USER}/${PN}/tarball/${GITHUB_TAG} -> ${P}.tar.gz"
HOMEPAGE="https://github.com/bobthecow/git-flow-completion"
SRC_HASH="4f0a2ed"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+bash-completion zsh-completion"

RDEPEND="app-shells/bash
zsh-completion? ( app-shells/zsh )
${DEPEND}"

S="${WORKDIR}/${GITHUB_USER}-${PN}-${SRC_HASH}"

src_install() {
	insinto /etc/bash_completion.d
	doins git-flow-completion.bash

	if use zsh-completion; then
		insinto /etc/zsh
		doins git-flow-completion.zsh
	fi
}

pkg_postinst() {
	if use zsh; then
		ewarn "To acitvate the git-flow-completion you need to add the following"
		ewarn "to one of your .zshrc files:"
		ewarn ""
		ewarn "\"source /etc/zsh/git-flow-completion.zsh\""
		ewarn ""
		ewarn "If you want to enable it for all users do so in
		\"/etc/zsh/zshrc\"."
	fi
}
