# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit distutils

DESCRIPTION="Wsgid is a generic WSGI handler for mongrel2 web server."
HOMEPAGE="http://wsgid.com"
SRC_URI="http://wsgid.com/static/downloads/${PN}-${PV}.tar.bz2"

LICENSE="GPL-v2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=">=www-servers/mongrel2-1.5"
RDEPEND="${DEPEND}"


src_install(){
	distutils_src_install
	doman doc/wsgid.8.bz2
	newconfd "${FILESDIR}"/wsgid.confd wsgid
	newinitd "${FILESDIR}"/wsgid.initd wsgid
}
