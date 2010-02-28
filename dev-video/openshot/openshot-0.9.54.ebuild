# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

UBUNTU_PV="0ubuntu4~ppa1k"
OPENSHOT_A="${PN}_${PV}-${UBUNTU_PV}.tar.gz"

inherit eutils python fdo-mime

DESCRIPTION="OpenShot Video Editor is a free, open-source, non-linear video
editor, based on Python, GTK, and MLT."
HOMEPAGE="http://www.openshotvideo.com"
MAIN_URI="http://ppa.launchpad.net/jonoomph/openshot-edge/ubuntu/pool/main/o/openshot"
SRC_URI="${MAIN_URI}/${OPENSHOT_A}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc dvgrab faac faad ieee1394 jack jack-rack kino ladspa quicktime"

# Notes on depends:
#	app-arch/deb2targz is for converting the OpenShot program's .deb package.
#	media-libs/mlt is so we don't have to depend on OpenShot's rather
#		large (~22M) .deb dependencies package (we only use 1 file from it).
#	Everything else is required by OpenShot at runtime or is an
#	optional/USE feature.
DEPEND="app-arch/deb2targz"
RDEPEND="
>=media-libs/mlt-0.4.6-r1[dv,ffmpeg,frei0r,libsamplerate,melt,sdl,python]
		dev-libs/libxml2
		dev-python/pygoocanvas
		dev-python/pyxdg
		gnome-base/librsvg
		media-libs/celt[-ogg]
		media-video/ffmpeg[encode,sdl,theora]
		media-plugins/frei0r-plugins
		media-libs/libdv[sdl]
		media-libs/libsamplerate
		media-libs/libtheora[encode]
		media-libs/libvorbis
		media-sound/sox[encode,ffmpeg,libsamplerate]
		media-libs/libsdl
		ieee1394?	(		sys-libs/libavc1394	
							media-libs/libdc1394
							sys-libs/libraw1394	)
		quicktime?	(	media-libs/libquicktime	)
		dvgrab?		(	media-video/dvgrab	)
		faac?		(	media-libs/faac	)
		faad?		(	media-libs/faad2	)
		jack?		(	media-sound/jack-audio-connection-kit	)
		jack-rack?	(	media-sound/jack-rack	)
		kino?		(	media-video/kino	)
		ladspa?		(	media-libs/ladspa-sdk	)
		lame?		(	media-sound/lame	)
		x264?		(	media-libs/x264	)"

S="${WORKDIR}/OpenShot_BuildFolder"

src_install() {

	# Install the main OpenShot executable
	dobin bin/openshot || die "failed to install OpenShot executable."

	# Install OpenShot links and icons
	insinto /usr/share/applications
	doins xdg/openshot.desktop || die "failed to install desktop link."
	insinto /usr/share/pixmaps
	doins xdg/openshot.png || die "failed to install desktop icon."
	insinto /usr/share/mime/packages
	doins xdg/openshot.xml || die "failed to install shared mime package."
	insinto /usr/lib/mime/packages
	doins xdg/openshot || die "failed to install mime library."

	# Install documentation
	if use doc ; then
		doman docs/openshot.1 || die "failed to install man page."
	fi

	# Copy over the rest of OpenShot's files
	insinto /usr/share/openshot
	doins -r openshot/* || die "failed to install OpenShot files."

	# Set permissions for executables
	local INSTDIR=/usr/share/openshot
	chmod 0555 ${D}${INSTDIR}/titles/* \
		${D}${INSTDIR}/windows/*.py \
		${D}${INSTDIR}/windows/glade/*.glade \
		${D}${INSTDIR}/classes/*.py \
		|| die "failed to set python/glade permissions."
}
pkg_postinst() {

	# Update our mime database to relect new changes
	fdo-mime_mime_database_update
	fdo-mime_desktop_database_update

	elog
	elog "The import and export features of this program rely"
	elog "heavily on its dependencies' USE flags such as"
	elog "media-libs/mlt and media-video/ffmpeg. If you find you"
	elog "can't export or import a certain media format, consider"
	elog "reviewing and modifying these USE flags."
	elog
}

pkg_postrm() {
	# Update our mime database to reflect new changes
	fdo-mime_mime_database_update
	fdo-mime_desktop_database_update
}
