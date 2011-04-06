# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils

DESCRIPTION="Mongrel2 is an application, language, and network architecture agnostic web server that focuses on web applications using modern browser technologies"
HOMEPAGE="https://mongrel2.org"
SRC_URI="http://mongrel2.org/static/downloads/${P}.tar.bz2"

LICENSE=""
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="dev-db/sqlite:3
	=net-libs/zeromq-2.0.10"

RDEPEND="${DEPEND}"


src_prepare(){
	epatch "${FILESDIR}/00-all-1.5-makefile-respect-prefix.patch"
	epatch "${FILESDIR}/00-all-1.5-makefile-m2sh-respect-prefix.patch"
}

src_install(){
	einstall
	newconfd "${FILESDIR}"/mongrel2.confd mongrel2
	newinitd "${FILESDIR}"/mongrel2.initd mongrel2
}
