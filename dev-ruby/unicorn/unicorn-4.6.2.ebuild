# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/bsearch/bsearch-1.5.0.ebuild,v 1.1 2012/12/10 19:02:05 graaff Exp $

EAPI=5
USE_RUBY="ruby19"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="Documentation/*"

inherit ruby-fakegem

DESCRIPTION="Rack HTTP server for fast clients and Unix"
HOMEPAGE="http://unicorn.bogomips.org/"

LICENSE="|| ( GPL-2 GPL-3 Ruby )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

ruby_add_rdepend "
	dev-ruby/rack
	>=dev-ruby/kgio-2.6
	>=dev-ruby/raindrops-0.7
"
each_ruby_configure() {
	case ${RUBY} in
		*ruby19)
			${RUBY} -C ext/unicorn_http extconf.rb || die "extconf.rb failed"
		;;
	esac
}

each_ruby_compile() {
	case ${RUBY} in
		*ruby19)
			emake -C ext/unicorn_http CFLAGS="${CFLAGS} -fPIC" archflag="${LDFLAGS}"
			cp ext/unicorn_http/*.so lib || die
		;;
	esac
}

each_ruby_test() {
	case ${RUBY} in
		*ruby19)
			for t1 in test/exec/test_*.rb; do
				${RUBY} -Ilib $t1 || die "Test $t2 failed"
			done
			for t2 in test/unit/test_*.rb; do
				${RUBY} -Ilib $t2 || die "Test $t2 failed"
			done
		;;
	esac
}
