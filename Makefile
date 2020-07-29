# $FreeBSD$

# openssl.pri useless
# DesktopEditor/raster/JBig2/source/LeptonLib/readfile.cpp
# DesktopEditor/xmlsec/test/OpenSSL_gui_test/OpenSSL_gui_test.pro
# Common/3dParty/openssl/openssl.pri
# Common/3dParty/v8/v8.pri 
# Common/3dParty/v8/v8_xp/v8.pri

PORTNAME=	documentserver
DISTVERSION=	5.5.3
CATEGORIES=	www

MASTER_SITES=	http://mikael.urankar.free.fr/onlyoffice_node/:sdkjs \
		http://mikael.urankar.free.fr/onlyoffice_node/:server \
		http://mikael.urankar.free.fr/onlyoffice_node/:server_common \
		http://mikael.urankar.free.fr/onlyoffice_node/:server_DocService \
		http://mikael.urankar.free.fr/onlyoffice_node/:server_FileConverter \
		http://mikael.urankar.free.fr/onlyoffice_node/:server_Metrics \
		http://mikael.urankar.free.fr/onlyoffice_node/:server_SpellChecker \
		http://mikael.urankar.free.fr/onlyoffice_node/:webapps

DISTFILES=	sdkjs-build-node_modules.tar.xz:sdkjs \
		server-node_modules.tar.xz:server \
		server-Common-node_modules.tar.xz:server_common \
		server-DocService-node_modules.tar.xz:server_DocService \
		server-FileConverter-node_modules.tar.xz:server_FileConverter \
		server-Metrics-node_modules.tar.xz:server_Metrics \
		server-SpellChecker-node_modules.tar.xz:server_SpellChecker \
		web-apps-build-node_modules.tar.xz:webapps

MAINTAINER=	mikael@FreeBSD.org
COMMENT=	online office suite

LICENSE=	AGPLv3
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

# XXX llvm10
# v8=6.8:lang/v8 , available here https://github.com/MikaelUrankar/v8-ports/tree/6.8
# boost-libs, icu ...
# npm install -g grunt-cli
# gsed
BUILD_DEPENDS=	boost-libs>0:devel/boost-libs \
		llvm10>0:devel/llvm10 \
		optipng>0:graphics/optipng \
		gifsicle>0:graphics/gifsicle \
		npm>0:www/npm \
		node>0:www/node \
		phantomjs>0:lang/phantomjs

LIB_DEPENDS=	libv8.so:lang/v8-6.8 \
		libcurl.so:ftp/curl

USES=		gmake qt:5
USE_QT=		qmake_build
USE_JAVA=	yes
# XXX java11
JAVA_VERSION=	8+
USE_GITHUB=	yes
GH_ACCOUNT=	ONLYOFFICE
GH_PROJECT=	DocumentServer
GH_TAGNAME=	b38a756 # distname is too complicated
GH_TUPLE=	\
		ONLYOFFICE:core:c1e4a2c:onlyoffice_core/core \
		ONLYOFFICE:core-fonts:959c01c:onlyoffice_corefonts/core-fonts \
		ONLYOFFICE:dictionaries:2bff8e8:onlyoffice_dictionaries/dictionaries \
		ONLYOFFICE:sdkjs:6622ecd:onlyoffice_sdkjs/sdkjs \
		ONLYOFFICE:sdkjs-plugins:cee7e3f:onlyoffice_sdkjsplugins/sdkjs-plugins \
		ONLYOFFICE:server:e6731c5:onlyoffice_server/server \
		ONLYOFFICE:web-apps:9f06b21:onlyoffice_webapps/web-apps

USE_LDCONFIG=	yes

MAKE_ENV=	PRODUCT_VERSION="${DISTVERSION}" \
		BUILD_NUMBER="1" \
		QT_QPA_PLATFORM=minimal

post-extract:
.for file in sdkjs-build server server-Common server-DocService \
	server-FileConverter server-Metrics \
	server-SpellChecker web-apps-build
	${TAR} -xf ${DISTDIR}/${file}-node_modules.tar.xz -C ${WRKSRC}
.endfor


do-build:
	cd ${WRKSRC}/core ; ${SETENV} ${MAKE_ENV} ${MAKE_CMD}

	${MKDIR} ${WRKSRC}/web-apps/build/node_modules/optipng-bin/vendor \
		${WRKSRC}/web-apps/build/node_modules/gifsicle/vendor
	${CP} ${LOCALBASE}/bin/optipng ${WRKSRC}/web-apps/build/node_modules/optipng-bin/vendor
	${CP} ${LOCALBASE}/bin/gifsicle ${WRKSRC}/web-apps/build/node_modules/gifsicle/vendor
	cd ${WRKSRC}/sdkjs ; ${SETENV} ${MAKE_ENV} ${MAKE_CMD}

#	cd ${WRKSRC}/server ; ${SETENV} ${MAKE_ENV} ${MAKE_CMD}

.include <bsd.port.mk>
