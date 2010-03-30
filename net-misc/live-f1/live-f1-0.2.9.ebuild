# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

DESCRIPTION="See the live timing during any F1 Grand Prix"
HOMEPAGE="https://launchpad.net/live-f1"
SRC_URI="http://launchpad.net/${PN}/0.2/${PV}/+download/${PN}-${PV}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="dev-util/pkgconfig
	>=net-misc/neon-0.24
	sys-libs/ncurses"

RDEPEND="${DEPEND}"

src_install(){
	einstall
}
