# $FreeBSD$

# XXX
# patch-core_Common_base.pri:XXX ccache
# patch-core_Makefile:XXX TARGET

# tar the node_modules
#
# cd sdkjs/build ; npm install
# web-apps/build/node_modules/pngjs-nozlib/package.json remove phantomjs
# cd web-apps/build ; env QT_QPA_PLATFORM=minimal npm install
# cd server ; npm install
# make -C onlyoffice-documentserver-ports
#
# cd work
# tar cJf sdkjs-build-node_modules.tar.xz          sdkjs/build/node_modules
# tar cJf server-node_modules.tar.xz               server/node_modules
# tar cJf server-Common-node_modules.tar.xz        server/build/server/Common/node_modules
# tar cJf server-DocService-node_modules.tar.xz    server/build/server/DocService/node_modules
# tar cJf server-FileConverter-node_modules.tar.xz server/build/server/FileConverter/node_modules
# tar cJf server-Metrics-node_modules.tar.xz       server/build/server/Metrics/node_modules
# tar cJf server-SpellChecker-node_modules.tar.xz  server/build/server/SpellChecker/node_modules
# tar cJf web-apps-build-node_modules.tar.xz       web-apps/build/node_modules

PORTNAME=	documentserver
DISTVERSION=	5.6.3
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

# v8=6.8:lang/v8, available here https://github.com/MikaelUrankar/v8-ports/tree/6.8
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
JAVA_VERSION=	8+
USE_GITHUB=	yes
GH_ACCOUNT=	ONLYOFFICE
GH_PROJECT=	DocumentServer
GH_TAGNAME=	0187bea # distname is too complicated
GH_TUPLE=	\
		ONLYOFFICE:core:ef6af5a:onlyoffice_core/core \
		ONLYOFFICE:core-fonts:959c01c:onlyoffice_corefonts/core-fonts \
		ONLYOFFICE:dictionaries:2bff8e8:onlyoffice_dictionaries/dictionaries \
		ONLYOFFICE:sdkjs:a0ad964:onlyoffice_sdkjs/sdkjs \
		ONLYOFFICE:sdkjs-plugins:6de0f7e:onlyoffice_sdkjsplugins/sdkjs-plugins \
		ONLYOFFICE:server:015fb87:onlyoffice_server/server \
		ONLYOFFICE:web-apps:a4dcc7f:onlyoffice_webapps/web-apps

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

post-patch:
	${REINPLACE_CMD} "s|%%LOCALBASE%%|${LOCALBASE}|" \
		${WRKSRC}/core/Common/3dParty/icu/icu.pri

do-build:
	cd ${WRKSRC}/core ; ${SETENV} ${MAKE_ENV} ${MAKE_CMD}

	${MKDIR} ${WRKSRC}/web-apps/build/node_modules/optipng-bin/vendor \
		${WRKSRC}/web-apps/build/node_modules/gifsicle/vendor
	${CP} ${LOCALBASE}/bin/optipng ${WRKSRC}/web-apps/build/node_modules/optipng-bin/vendor
	${CP} ${LOCALBASE}/bin/gifsicle ${WRKSRC}/web-apps/build/node_modules/gifsicle/vendor
#	cd ${WRKSRC}/sdkjs ; ${SETENV} ${MAKE_ENV} ${MAKE_CMD}

	cd ${WRKSRC}/server ; ${SETENV} ${MAKE_ENV} ${MAKE_CMD}

do-install:
	cd ${WRKSRC}/server ; ${SETENV} ${MAKE_ENV} DESTDIR=${LOCALBASE} ${MAKE_CMD} DESTDIR=${STAGEDIR}${LOCALBASE} install

.include <bsd.port.mk>
