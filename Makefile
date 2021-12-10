PORTNAME=	onlyoffice-documentserver
DISTVERSION=	6.4.2
DISTVERSIONPREFIX=v
CATEGORIES=	www
MASTER_SITES+=	http://mikael.urankar.free.fr/v8/
DISTFILES+=     build-${BUILD_REV}.tar.gz \
		buildtools-${BUILDTOOLS_REV}.tar.gz \
		clang-${CLANG_REV}.tar.gz \
		common-${COMMON_REV}.tar.gz \
		gmock-${GMOCK_REV}.tar.gz \
		googletest-${GOOGLETEST_REV}.tar.gz \
		icu-${ICU_REV}.tar.gz \
		v8-${V8_VERS}.tar.gz
EXTRACT_ONLY=   ${DISTFILE_core} ${DISTFILE_corefonts} ${DISTFILE_dictionaries} \
		${DISTFILE_dsi} ${DISTFILE_dt} ${DISTFILE_sdkjs} \
		${DISTFILE_server} ${DISTFILE_webapps} ${DISTFILE_sdkjs_plugins_highlightcode} \
		${DISTFILE_sdkjs_plugins_macros} ${DISTFILE_sdkjs_plugins_mendeley} \
		${DISTFILE_sdkjs_plugins_ocr} ${DISTFILE_sdkjs_plugins_photoeditor} \
		${DISTFILE_sdkjs_plugins_speech} ${DISTFILE_sdkjs_plugins_thesaurus} \
		${DISTFILE_sdkjs_plugins_translator} ${DISTFILE_sdkjs_plugins_youtube} \
		${DISTFILE_sdkjs_plugins_zotero} ${DISTFILE_buildtools} \
		${DISTFILE_hackers_painters_katana} ${DISTFILE_google_gumbo} \
		${DISTNAME}.tar.gz

MAINTAINER=	mikael@FreeBSD.org
COMMENT=	online office suite

LICENSE=	AGPLv3
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	boost-libs>0:devel/boost-libs \
		npm:www/npm-node16 \
		node:www/node16 \
		python2.7:lang/python2.7

USES=		gmake qt:5
USE_QT=		qmake_build
USE_JAVA=	yes
JAVA_VERSION=	11
USE_GITHUB=	yes
GH_ACCOUNT=	ONLYOFFICE
GH_PROJECT=	DocumentServer
GH_TUPLE=	\
		ONLYOFFICE:core:0c29e4d:core/core \
		ONLYOFFICE:core-fonts:3929a09:corefonts/core-fonts \
		ONLYOFFICE:dictionaries:cfa50d3:dictionaries/dictionaries \
		ONLYOFFICE:document-server-integration:v1.0.0:dsi/document-server-integration \
		ONLYOFFICE:document-templates:v6.4.2.1:dt/document-templates \
		ONLYOFFICE:sdkjs:9af7d08:sdkjs/sdkjs \
		ONLYOFFICE:server:10929a0:server/server \
		ONLYOFFICE:web-apps:1851cae:webapps/web-apps \
		ONLYOFFICE:plugin-highlightcode:7ea4ddf:sdkjs_plugins_highlightcode/sdkjs-plugins/plugin-highlightcode \
		ONLYOFFICE:plugin-macros:4027439:sdkjs_plugins_macros/sdkjs-plugins/plugin-macros \
		ONLYOFFICE:plugin-mendeley:5a36bf9:sdkjs_plugins_mendeley/sdkjs-plugins/plugin-mendeley \
		ONLYOFFICE:plugin-ocr:5b24c87:sdkjs_plugins_ocr/sdkjs-plugins/plugin-ocr \
		ONLYOFFICE:plugin-photoeditor:995b5f6:sdkjs_plugins_photoeditor/sdkjs-plugins/plugin-photoeditor \
		ONLYOFFICE:plugin-speech:fcec715:sdkjs_plugins_speech/sdkjs-plugins/plugin-speech \
		ONLYOFFICE:plugin-thesaurus:4ada280:sdkjs_plugins_thesaurus/sdkjs-plugins/plugin-thesaurus \
		ONLYOFFICE:plugin-translator:ba6caed:sdkjs_plugins_translator/sdkjs-plugins/plugin-translator \
		ONLYOFFICE:plugin-youtube:4dec911:sdkjs_plugins_youtube/sdkjs-plugins/plugin-youtube \
		ONLYOFFICE:plugin-zotero:c9f472f:sdkjs_plugins_zotero/sdkjs-plugins/plugin-zotero \
		ONLYOFFICE:build_tools:cf4cac94:buildtools/build_tools \
		hackers-painters:katana-parser:499118d3:hackers_painters_katana/core/Common/3dParty/html/katana-parser \
		google:gumbo-parser:aa91b27:google_gumbo/core/Common/3dParty/html/gumbo-parser

BINARY_ALIAS=	python=python2.7
USE_LDCONFIG=	yes

#MAKE_ENV=	PRODUCT_VERSION="${DISTVERSION}" \
#		BUILD_NUMBER="1" \
#		QT_QPA_PLATFORM=minimal

BUILD_REV=1caf3a69f3b0379c9fef2493aa1b3cda96e17d7b
BUILDTOOLS_REV=075dd7e22837a69189003e4fa84499acf63188cf
CLANG_REV=05f306039aa5029fa88768690e5c512097419f9d
COMMON_REV=39a3450531fc73432e963db8668695d2e8f13053
GOOGLETEST_REV=6f8a66431cb592dad629028a50b3dd418a408c87
ICU_REV=c844075aa0f1758d04f9192825f1b1e7e607992e
GMOCK_REV=0421b6f358139f02e102c9c332ce19a33faf75be
V8_VERS=6.0.286.57

post-extract:
	@${TAR} -xf ${DISTDIR}/${DIST_SUBDIR}/v8-${V8_VERS}.tar.gz -C ${WRKSRC}/core/Common/3dParty/v8
	@${MV} ${WRKSRC}/core/Common/3dParty/v8/v8-${V8_VERS} ${WRKSRC}/core/Common/3dParty/v8/v8
	${MKDIR} ${WRKSRC}/core/Common/3dParty/v8/v8/build \
		${WRKSRC}/core/Common/3dParty/v8/v8/buildtools \
		${WRKSRC}/core/Common/3dParty/v8/v8/tools/clang \
		${WRKSRC}/core/Common/3dParty/v8/v8/base/trace_event/common \
		${WRKSRC}/core/Common/3dParty/v8/v8/testing/gmock \
		${WRKSRC}/core/Common/3dParty/v8/v8/testing/gtest \
		${WRKSRC}/core/Common/3dParty/v8/v8/third_party/icu
	@${TAR} -xf ${DISTDIR}/${DIST_SUBDIR}/build-${BUILD_REV}.tar.gz -C ${WRKSRC}/core/Common/3dParty/v8/v8/build
	@${TAR} -xf ${DISTDIR}/${DIST_SUBDIR}/buildtools-${BUILDTOOLS_REV}.tar.gz -C ${WRKSRC}/core/Common/3dParty/v8/v8/buildtools
	@${TAR} -xf ${DISTDIR}/${DIST_SUBDIR}/clang-${CLANG_REV}.tar.gz -C ${WRKSRC}/core/Common/3dParty/v8/v8/tools/clang
	@${TAR} -xf ${DISTDIR}/${DIST_SUBDIR}/common-${COMMON_REV}.tar.gz -C ${WRKSRC}/core/Common/3dParty/v8/v8/base/trace_event/common
	@${TAR} -xf ${DISTDIR}/${DIST_SUBDIR}/googletest-${GOOGLETEST_REV}.tar.gz -C ${WRKSRC}/core/Common/3dParty/v8/v8/testing/gtest
	@${TAR} -xf ${DISTDIR}/${DIST_SUBDIR}/gmock-${GMOCK_REV}.tar.gz -C ${WRKSRC}/core/Common/3dParty/v8/v8/testing/gmock
	@${TAR} -xf ${DISTDIR}/${DIST_SUBDIR}/icu-${ICU_REV}.tar.gz -C ${WRKSRC}/core/Common/3dParty/v8/v8/third_party/icu

#post-patch:
#	${REINPLACE_CMD} "s|%%LOCALBASE%%|${LOCALBASE}|" \
#		${WRKSRC}/core/Common/3dParty/icu/icu.pri
#
do-build:
	cd ${WRKSRC}/build_tools/tools/freebsd ; ${SETENV} ${MAKE_ENV} python2.7 automate.py
#
#	${MKDIR} ${WRKSRC}/web-apps/build/node_modules/optipng-bin/vendor \
#		${WRKSRC}/web-apps/build/node_modules/gifsicle/vendor
#	${CP} ${LOCALBASE}/bin/optipng ${WRKSRC}/web-apps/build/node_modules/optipng-bin/vendor
#	${CP} ${LOCALBASE}/bin/gifsicle ${WRKSRC}/web-apps/build/node_modules/gifsicle/vendor
##	cd ${WRKSRC}/sdkjs ; ${SETENV} ${MAKE_ENV} ${MAKE_CMD}
#
#	cd ${WRKSRC}/server ; ${SETENV} ${MAKE_ENV} ${MAKE_CMD}
#
#do-install:
#	cd ${WRKSRC}/server ; ${SETENV} ${MAKE_ENV} DESTDIR=${LOCALBASE} ${MAKE_CMD} DESTDIR=${STAGEDIR}${LOCALBASE} install
#
.include <bsd.port.mk>
