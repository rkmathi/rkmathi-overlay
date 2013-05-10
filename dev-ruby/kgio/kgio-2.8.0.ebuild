# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/bsearch/bsearch-1.5.0.ebuild,v 1.1 2012/12/10 19:02:05 graaff Exp $

EAPI=5
USE_RUBY="ruby19"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README"

inherit ruby-fakegem

DESCRIPTION="kinder, gentler I/O for Ruby"
HOMEPAGE="http://rubydoc.info/gems/kgio/2.8.0/frames"

LICENSE="|| ( LGPL-2.1 LGPL-3 )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

each_ruby_configure() {
	${RUBY} -C ext/${PN} extconf.rb || die "extconf.rb failed"
}

each_ruby_compile() {
	emake -C ext/${PN} CFLAGS="${CFLAGS} -fPIC" archflag="${LDFLAGS}"
	cp ext/${PN}/*.so lib || die "Copying ext to lib failed"
}

each_ruby_test() {
	for t in test/test_*.rb; do
		${RUBY} -Ilib $t || die "Test $t failed"
	done
}
