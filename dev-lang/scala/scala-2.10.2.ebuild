# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit eutils multilib portability java-pkg-2 versionator

PROJECT_DISTR="scala-2.10.2"

SLOT="2.10.2"
LICENSE="BSD"
DESCRIPTION="Scala 2.10.2 release"
HOMEPAGE="http://www.scala-lang.org"
SRC_URI="http://www.scala-lang.org/downloads/distrib/files/${PROJECT_DISTR}.tgz"

DEPEND=">=virtual/jdk-1.5
app-admin/eselect-scala"

S=${WORKDIR}

SCALA_BINARIES=(scala scalac scaladoc scalap fsc)

src_install() {
	declare SCALA_HOME=/opt/

	dodir ${SCALA_HOME}
	cp -R ${PROJECT_DISTR}/ "${D}"${SCALA_HOME} || die "Unable to install"

	java-pkg_dojar "${PROJECT_DISTR}"/lib/*.jar
	java-pkg_dojar "${PROJECT_DISTR}"/misc/scala-devel/plugins/*.jar

	dodir /usr/bin
	for b in ${SCALA_BINARIES[*]}
	do
		dosym "${SCALA_HOME}/${PROJECT_DISTR}/bin/${b}" /usr/bin/${b}-${SLOT}
	done
}

