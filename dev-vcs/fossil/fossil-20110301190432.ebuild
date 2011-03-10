# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils

DESCRIPTION="Simple, high-reliability, distributed software configuration management"
HOMEPAGE="http://www.fossil-scm.org/"
SRC_URI="http://www.fossil-scm.org/download/${PN}-src-${PV}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="dev-db/sqlite:3"

RDEPEND="${DEPEND}"


src_prepare(){
	cd ${WORKDIR}/${PN}-src-${PV}
	epatch "${FILESDIR}/00-all-makefile-use-correct-prefix.patch"
	#epatch "${FILESDIR}/00-all-main.mk-use-correct-prefix.patch"
	emake
}

src_install(){
	cd ${WORKDIR}/${PN}-src-${PV}
	#mkdir -p ${D}usr/local/bin
	#INSTALLDIR=${D}usr/local/bin/fossil einstall
	einstall
}
