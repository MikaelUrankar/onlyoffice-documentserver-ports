PORTNAME=	onlyoffice-documentserver
DISTVERSIONPREFIX=	v
DISTVERSION=	6.4.2
CATEGORIES=	www
MASTER_SITES+=	http://mikael.urankar.free.fr/v8/:source1 \
		http://mikael.urankar.free.fr/onlyoffice/:source2 \
		https://nodejs.org/dist/v16.13.0/:source3 \
		SF/optipng/OptiPNG/optipng-0.7.7/:source4
DISTFILES+=	v8-8.7.220.31_all.tar.gz:source1 \
		node-v16.13.0.tar.gz:source3 \
		npm-cache-onlyoffice.tar.gz:source2 \
		optipng-0.7.7.tar.gz:source4

MAINTAINER=	mikael@FreeBSD.org
COMMENT=	Secure office and productivity apps

LICENSE=	AGPLv3
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}Jinja2>=0:devel/py-Jinja2@${PY_FLAVOR} \
		binutils>=0:devel/binutils \
		boost-libs>0:devel/boost-libs \
		glib>=2.54:devel/glib20 \
		gn:devel/gn \
		java:java/openjdk11 \
		ninja:devel/ninja \
		node:www/node16 \
		npm:www/npm-node16
LIB_DEPENDS=	libboost_regex.so:devel/boost-libs \
		libicutu.so:devel/icu
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}supervisor>0:sysutils/py-supervisor@${PY_FLAVOR} \
		curl:ftp/curl \
		gsed:textproc/gsed \
		nginx:www/nginx \
		pg_dump:databases/postgresql${PGSQL_VER_NODOT}-server \
		rabbitmq>0:net/rabbitmq \
		webfonts>=0:x11-fonts/webfonts

USES=		autoreconf:build gmake gnome iconv pgsql pkgconfig \
		python:3.7+,build qt:5
USE_QT=		qmake_build
USE_GITHUB=	yes
GH_ACCOUNT=	ONLYOFFICE
GH_PROJECT=	DocumentServer
GH_TUPLE=	ONLYOFFICE:core:0c29e4d:core/core \
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
		ONLYOFFICE:DocumentBuilder:4169685e6:document_builder/DocumentBuilder \
		ONLYOFFICE:onlyoffice.github.io:ca730969:sdkjs_plugins_v1/onlyoffice.github.io \
		ONLYOFFICE:document-server-package:c12273c0a:dsp/document-server-package \
		hackers-painters:katana-parser:499118d3:hackers_painters_katana/core/Common/3dParty/html/katana-parser \
		google:gumbo-parser:aa91b27:google_gumbo/core/Common/3dParty/html/gumbo-parser

BINARY_ALIAS=	python=${PYTHON_CMD}
USE_LDCONFIG=	yes

WWWDIR=		${PREFIX}/www/onlyoffice
ETCDIR=		${PREFIX}/etc/onlyoffice

DS_USERNAME=	ds
DS_GROUPNAME=	ds

USERS=		${DS_USERNAME}
GROUPS=		${DS_GROUPNAME}

PLIST_SUB=	DS_GROUPNAME=${DS_GROUPNAME} \
		DS_USERNAME=${DS_USERNAME}
SUB_FILES=	pkg-message
SUB_LIST=	ETCDIR=${ETCDIR} \
		PREFIX=${PREFIX} \
		WWWDIR=${WWWDIR}

MAKE_ENV=	BUILD_NUMBER="1" \
		PKG_CACHE_PATH=${WRKDIR}/.pkg-cache \
		PRODUCT_VERSION="${DISTVERSION}"

post-extract:
	@${MV} ${WRKDIR}/v8 ${WRKSRC}/core/Common/3dParty/v8

	@${MKDIR} ${WRKDIR}/.pkg-cache/node
	@${CP} ${DISTDIR}/node-v16.13.0.tar.gz ${WRKDIR}/.pkg-cache/node
# Checksum can be verified here: https://nodejs.org/dist/v16.13.0/SHASUMS256.txt
	@${ECHO} "9c00e5b6024cfcbc9105f9c58cf160762e78659a345d100c5bd80a7fb38c684f  node-v16.13.0.tar.gz" > \
		${WRKDIR}/.pkg-cache/node/node-v16.13.0.tar.gz.sha256sum

	@${MKDIR} ${WRKSRC}/sdkjs-plugins/v1
	@${CP} ${WRKSRC}/onlyoffice.github.io/sdkjs-plugins/v1/* ${WRKSRC}/sdkjs-plugins/v1

	@${MV} ${WRKSRC}/server/Common/config/production-linux.json ${WRKSRC}/server/Common/config/production-freebsd.json
	@${MV} ${WRKSRC}/server/Common/config/development-linux.json ${WRKSRC}/server/Common/config/development-freebsd.json

post-patch:
	@${REINPLACE_CMD} 's|%%LOCALBASE%%|${LOCALBASE}|' \
		${WRKSRC}/core/Common/3dParty/v8/v8/build/toolchain/gcc_toolchain.gni \
		${WRKSRC}/core/Common/3dParty/v8/v8/buildtools/third_party/libc++/BUILD.gn \
		${WRKSRC}/core/DesktopEditor/fontengine/ApplicationFonts.cpp
	@${REINPLACE_CMD} -e 's|%%CC%%|${CC}|' -e 's|%%CXX%%|${CXX}|' \
		${WRKSRC}/core/Common/3dParty/v8/v8/build/toolchain/gcc_toolchain.gni \
		${WRKSRC}/core/Common/base.pri
	@${REINPLACE_CMD} 's|%%WRKDIR%%|${WRKDIR}|' \
		${WRKSRC}/document-server-package/Makefile
	@${REINPLACE_CMD} 's|%%WRKSRC%%|${WRKSRC}|' \
		${WRKSRC}/build_tools/scripts/build_js.py \
		${WRKSRC}/build_tools/scripts/build_server.py \
		${WRKSRC}/document-server-package/Makefile
	@${REINPLACE_CMD} -e 's|linux|freebsd|' -e 's|/etc|${LOCALBASE}/etc|' \
		${WRKSRC}/document-server-package/common/documentserver/supervisor/ds-docservice.conf.m4 \
		${WRKSRC}/document-server-package/common/documentserver/supervisor/ds-converter.conf.m4 \
		${WRKSRC}/document-server-package/common/documentserver-example/supervisor/ds-example.conf.m4 \
		${WRKSRC}/document-server-package/common/documentserver/bin/documentserver-static-gzip.sh.m4 \
		${WRKSRC}/document-server-package/common/documentserver/bin/documentserver-update-securelink.sh.m4
	@${REINPLACE_CMD} 's|/var/www|${LOCALBASE}/www|' \
		${WRKSRC}/document-server-package/common/documentserver/bin/documentserver-generate-allfonts.sh.m4 \
		${WRKSRC}/document-server-package/common/documentserver/bin/documentserver-static-gzip.sh.m4 \
		${WRKSRC}/document-server-package/common/documentserver/supervisor/ds-converter.conf.m4 \
		${WRKSRC}/document-server-package/common/documentserver/supervisor/ds-docservice.conf.m4 \
		${WRKSRC}/document-server-package/common/documentserver/supervisor/ds-metrics.conf.m4
	@${REINPLACE_CMD} -e 's|/var/lib|/var/db|' -e 's|/var/www|${LOCALBASE}/www|' \
			  -e 's|/usr/share|${LOCALBASE}/share|' -e 's|/etc|${LOCALBASE}/etc|' \
		${WRKSRC}/server/Common/config/production-freebsd.json \
		${WRKSRC}/server/Common/config/development-freebsd.json
	@${REINPLACE_CMD} -e 's|bash|sh|' -e 's|sed|gsed|' \
		${WRKSRC}/document-server-package/common/documentserver/bin/documentserver-static-gzip.sh.m4 \
		${WRKSRC}/document-server-package/common/documentserver/bin/documentserver-update-securelink.sh.m4
	@${REINPLACE_CMD} 's|%%DISTDIR%%|${DISTDIR}|' \
		${WRKSRC}/web-apps/build/patches/optipng-bin+5.1.0.patch
	@${RM} ${WRKSRC}/web-apps/build/patches/optipng-bin+5.1.0.patch.orig

	@${FIND} ${WRKSRC}/server -type f -name npm-shrinkwrap.json -delete

do-build:
# npm sucks....
	@${CP} ${FILESDIR}/packagejsons/server/package-lock.json ${WRKSRC}/server
	@${CP} ${FILESDIR}/packagejsons/server/Common/package-lock.json ${WRKSRC}/server/Common

# npm really sucks....
	@cd ${WRKSRC}/web-apps/build ; ${SETENV} ${MAKE_ENV} npm install patch-package
	@cd ${WRKSRC}/web-apps/build ; ${SETENV} ${MAKE_ENV} npm install optipng-bin@5.1.0
	@cd ${WRKSRC}/web-apps/build ; node_modules/.bin/patch-package
	@cd ${WRKSRC}/web-apps/build/node_modules ; ${SETENV} ${MAKE_ENV} npm build optipng-bin

# npm really really sucks....
	@cd ${WRKSRC}/web-apps/build ; ${SETENV} ${MAKE_ENV} npm install patch-package
	@cd ${WRKSRC}/server ; ${SETENV} ${MAKE_ENV} npm install grunt-cli
	@cd ${WRKSRC}/server ; ${SETENV} ${MAKE_ENV} npm install grunt
	@cd ${WRKSRC}/server ; ${SETENV} ${MAKE_ENV} npm install pkg
	@cd ${WRKSRC}/sdkjs  ; ${SETENV} ${MAKE_ENV} npm install grunt-cli
	@cd ${WRKSRC}/sdkjs  ; ${SETENV} ${MAKE_ENV} npm install grunt
	@cd ${WRKSRC} && ${PATCH} -N -s -i ${FILESDIR}/extra-patch-pkg-fetch_lib-es5_build.js || ${TRUE}
	@cd ${WRKSRC} && ${PATCH} -N -s -i ${FILESDIR}/extra-patch-pkg-fetch_patches_node.v16.13.0.cpp.patch || ${TRUE}

	cd ${WRKSRC}/build_tools/tools/freebsd ; ${SETENV} ${MAKE_ENV} ${PYTHON_CMD} automate.py
	cd ${WRKSRC}/document-server-package ; ${SETENV} ${MAKE_ENV} ${GMAKE} freebsd

do-install:
# install the project
# do not strip docservice, converter and metrics
	cd ${WRKSRC}/document-server-package/common/documentserver/home && ${COPYTREE_SHARE} . ${STAGEDIR}${WWWDIR}/documentserver
	${INSTALL_SCRIPT} ${WRKSRC}/document-server-package/common/documentserver/bin/*.sh ${STAGEDIR}${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/document-server-package/common/documentserver/home/server/tools/all* ${STAGEDIR}${WWWDIR}/documentserver/server/tools
	${INSTALL_PROGRAM} ${WRKSRC}/document-server-package/common/documentserver/home/server/FileConverter/bin/x2t ${STAGEDIR}${WWWDIR}/documentserver/server/FileConverter/bin
	${INSTALL_PROGRAM} ${WRKSRC}/document-server-package/common/documentserver/home/server/FileConverter/bin/docbuilder ${STAGEDIR}${WWWDIR}/documentserver/server/FileConverter/bin
	${INSTALL_PROGRAM} ${WRKSRC}/document-server-package/common/documentserver/home/npm/json ${STAGEDIR}${WWWDIR}/documentserver/npm
	${INSTALL_LIB} ${WRKSRC}/document-server-package/common/documentserver/home/server/FileConverter/bin/*.so ${STAGEDIR}${PREFIX}/lib
	${RM} ${STAGEDIR}${PREFIX}/bin/documentserver-letsencrypt.sh

# install conf
	${MKDIR} ${STAGEDIR}${ETCDIR}/documentserver/supervisor \
		 ${STAGEDIR}${ETCDIR}/documentserver/nginx/includes \
		 ${STAGEDIR}${ETCDIR}/documentserver/logrotate
	${RM} ${WRKSRC}/document-server-package/common/documentserver/config/*-mac.json ${WRKSRC}/document-server-package/common/documentserver/config/*-windows.json
	cd ${WRKSRC}/document-server-package/common/documentserver/supervisor && ${COPYTREE_SHARE} . ${STAGEDIR}${ETCDIR}/documentserver/supervisor "-name *\.conf"
	cd ${WRKSRC}/document-server-package/common/documentserver/logrotate && ${COPYTREE_SHARE} . ${STAGEDIR}${ETCDIR}/documentserver/logrotate "-name *\.conf"
	${CP} ${WRKSRC}/document-server-package/common/documentserver/nginx/ds.conf ${STAGEDIR}${ETCDIR}/documentserver/nginx
	cd ${WRKSRC}/document-server-package/common/documentserver/nginx && ${COPYTREE_SHARE} . ${STAGEDIR}${ETCDIR}/documentserver/nginx "-name *\.conf.tmpl"
	cd ${WRKSRC}/document-server-package/common/documentserver/nginx/includes && ${COPYTREE_SHARE} . ${STAGEDIR}${ETCDIR}/documentserver/nginx/includes "-name *\.conf"
	cd ${WRKSRC}/document-server-package/common/documentserver/config && ${COPYTREE_SHARE} . ${STAGEDIR}${ETCDIR}/documentserver

# create missing dir
	${MKDIR} ${STAGEDIR}/var/log/onlyoffice/documentserver/docservice \
		 ${STAGEDIR}/var/log/onlyoffice/documentserver/converter \
		 ${STAGEDIR}/var/log/onlyoffice/documentserver/metrics \
		 ${STAGEDIR}/var/db/onlyoffice/documentserver/App_Data/cache/files \
		 ${STAGEDIR}/var/db/onlyoffice/documentserver/App_Data/docbuilder \
		 ${STAGEDIR}${WWWDIR}/Data \
		 ${STAGEDIR}${WWWDIR}/documentserver/fonts

# generate allfonts.js and thumbnail (/usr/local/bin/documentserver-generate-allfonts.sh)
	env LD_LIBRARY_PATH=${STAGEDIR}${PREFIX}/lib \
	"${STAGEDIR}${WWWDIR}/documentserver/server/tools/allfontsgen" \
	  --input="${STAGEDIR}${WWWDIR}/documentserver/core-fonts" \
	  --allfonts-web="${STAGEDIR}${WWWDIR}/documentserver/sdkjs/common/AllFonts.js" \
	  --allfonts="${STAGEDIR}${WWWDIR}/documentserver/server/FileConverter/bin/AllFonts.js" \
	  --images="${STAGEDIR}${WWWDIR}/documentserver/sdkjs/common/Images" \
	  --selection="${STAGEDIR}${WWWDIR}/documentserver/server/FileConverter/bin/font_selection.bin" \
	  --output-web="${STAGEDIR}${WWWDIR}/documentserver/fonts" \
	  --use-system="true"

	env LD_LIBRARY_PATH=${STAGEDIR}${PREFIX}/lib \
	"${STAGEDIR}${WWWDIR}/documentserver/server/tools/allthemesgen"\
	  --converter-dir="${STAGEDIR}${WWWDIR}/documentserver/server/FileConverter/bin"\
	  --src="${STAGEDIR}${WWWDIR}/documentserver/sdkjs/slide/themes"\
	  --output="${STAGEDIR}${WWWDIR}/documentserver/sdkjs/common/Images"

	env LD_LIBRARY_PATH=${STAGEDIR}${PREFIX}/lib \
	"${STAGEDIR}${WWWDIR}/documentserver/server/tools/allthemesgen"\
	  --converter-dir="${STAGEDIR}${WWWDIR}/documentserver/server/FileConverter/bin"\
	  --src="${STAGEDIR}${WWWDIR}/documentserver/sdkjs/slide/themes"\
	  --output="${STAGEDIR}${WWWDIR}/documentserver/sdkjs/common/Images"\
	  --postfix="ios"\
	  --params="280,224"

	env LD_LIBRARY_PATH=${STAGEDIR}${PREFIX}/lib \
	"${STAGEDIR}${WWWDIR}/documentserver/server/tools/allthemesgen"\
	  --converter-dir="${STAGEDIR}${WWWDIR}/documentserver/server/FileConverter/bin"\
	  --src="${STAGEDIR}${WWWDIR}/documentserver/sdkjs/slide/themes"\
	  --output="${STAGEDIR}${WWWDIR}/documentserver/sdkjs/common/Images"\
	  --postfix="android"\
	  --params="280,224"

# Fix fonts path
	@${REINPLACE_CMD} 's|${STAGEDIR}||' \
		${STAGEDIR}${WWWDIR}/documentserver/server/FileConverter/bin/AllFonts.js

	@${RM} ${STAGEDIR}${WWWDIR}/documentserver/server/FileConverter/bin/fonts.log

.include <bsd.port.mk>
