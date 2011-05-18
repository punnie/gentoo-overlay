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
	=net-libs/zeromq-2.1.4"

RDEPEND="${DEPEND}"

src_install(){
	emake install DESTDIR=${D} PREFIX="${EPREFIX}"/usr
	newconfd "${FILESDIR}"/mongrel2.confd mongrel2
	newinitd "${FILESDIR}"/mongrel2-1.6.initd mongrel2
}
