# copy warning [file not exist]: /root/onlyoffice-documentserver-ports/work/DocumentServer-6.4.2/build_tools/scripts/../../server/build/server/Metrics/node_modules/modern-syslog/build/Release/core.node
# https://raw.githubusercontent.com/ONLYOFFICE/DocumentBuilder/master/empty/docx.bin pptx.bin xlsx.bin

# cd ~/onlyoffice-documentserver-ports/work/DocumentServer-6.4.2/build_tools/out/freebsd_64/onlyoffice/documentserver
# env LD_LIBRARY_PATH=server/FileConverter/bin/ ./server/tools/allthemesgen --converter-dir="server/FileConverter/bin" --src="sdkjs/slide/themes" --output="sdkjs/common/Images"


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
		v8-${V8_VERS}.tar.gz \
		npm-cache-sdkjs_build.tar.gz \
		npm-cache-server_Common.tar.gz \
		npm-cache-server_DocService.tar.gz \
		npm-cache-server_FileConverter.tar.gz \
		npm-cache-server_Metrics.tar.gz \
		npm-cache-server.tar.gz \
		npm-cache-web-apps_build.tar.gz \
		npm-cache-web-apps_vendor_framework7-react.tar.gz \
		npm-cache-pkg.tar.gz \
		npm-cache-document-server-integration.tar.gz \
		onlyoffice-hunspell.tar.gz
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
		optipng>0:graphics/optipng

USES=		gmake python:3.5+,build qt:5
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

BINARY_ALIAS=	python=${PYTHON_CMD}
USE_LDCONFIG=	yes

#MAKE_ENV=	PRODUCT_VERSION="${DISTVERSION}" \
#		BUILD_NUMBER="1" \
#		QT_QPA_PLATFORM=minimal

BUILD_HASH=38a49c12ded01dd8c4628b432cb7eebfb29e77f1
BUILDTOOLS_HASH=3ff4f5027b4b81a6c9c36d64d71444f2709a4896
CLANG_HASH=3017edade60658a699be776d9e282509a902ffe9
COMMON_HASH=23ef5333a357fc7314630ef88b44c3a545881dee
GOOGLETEST_HASH=4fe018038f87675c083d0cfb6a6b57c274fb1753
ICU_HASH=aef20f06d47ba76fdf13abcdb033e2a408b5a94d
ZLIB_HASH=4668feaaa47973a6f9d9f9caeb14cd03731854f1
V8_VERS=8.7.220.31

post-extract:
	@${TAR} -xf ${DISTDIR}/v8-${V8_VERS}.tar.gz -C ${WRKSRC}/core/Common/3dParty/v8
	@${MV} ${WRKSRC}/core/Common/3dParty/v8/v8-${V8_VERS} ${WRKSRC}/core/Common/3dParty/v8/v8
	@${MKDIR} ${WRKSRC}/core/Common/3dParty/v8/v8/build \
		${WRKSRC}/core/Common/3dParty/v8/v8/buildtools \
		${WRKSRC}/core/Common/3dParty/v8/v8/tools/clang \
		${WRKSRC}/core/Common/3dParty/v8/v8/base/trace_event/common \
		${WRKSRC}/core/Common/3dParty/v8/v8/third_party/icu \
                ${WRKSRC}/core/Common/3dParty/v8/v8/third_party/zlib \
                ${WRKSRC}/core/Common/3dParty/v8/v8/third_party/googletest/src \
		${WRKSRC}/pkg
	@${TAR} -xf ${DISTDIR}/build-${BUILD_REV}.tar.gz -C ${WRKSRC}/core/Common/3dParty/v8/v8/build
	@${TAR} -xf ${DISTDIR}/buildtools-${BUILDTOOLS_REV}.tar.gz -C ${WRKSRC}/core/Common/3dParty/v8/v8/buildtools
	@${TAR} -xf ${DISTDIR}/clang-${CLANG_REV}.tar.gz -C ${WRKSRC}/core/Common/3dParty/v8/v8/tools/clang
	@${TAR} -xf ${DISTDIR}/common-${COMMON_REV}.tar.gz -C ${WRKSRC}/core/Common/3dParty/v8/v8/base/trace_event/common
	@${TAR} -xf ${DISTDIR}/googletest-${GOOGLETEST_REV}.tar.gz -C ${WRKSRC}/core/Common/3dParty/v8/v8/third_party/googletest/src
	@${TAR} -xf ${DISTDIR}/icu-${ICU_REV}.tar.gz -C ${WRKSRC}/core/Common/3dParty/v8/v8/third_party/icu
	@${TAR} -xf ${DISTDIR}/zlib-${ZLIB_HASH}.tar.gz -C ${WRKSRC}/core/Common/3dParty/v8/v8/third_party/zlib

# XXX try a single cache for npm?
	@${TAR} -xf ${DISTDIR}/npm-cache-sdkjs_build.tar.gz -C ${WRKSRC}/sdkjs/build
# XXX copy package.json
	@${MKDIR} \
		${WRKSRC}/server/build/server/Common \
		${WRKSRC}/server/build/server/DocService \
		${WRKSRC}/server/build/server/FileConverter \
		${WRKSRC}/server/build/server/Metrics
	@${TAR} -xf ${DISTDIR}/npm-cache-server_Common.tar.gz -C ${WRKSRC}/server/build/server/Common
	@${TAR} -xf ${DISTDIR}/npm-cache-server_DocService.tar.gz -C ${WRKSRC}/server/build/server/DocService
	@${TAR} -xf ${DISTDIR}/npm-cache-server_FileConverter.tar.gz -C ${WRKSRC}/server/build/server/FileConverter
	@${TAR} -xf ${DISTDIR}/npm-cache-server_Metrics.tar.gz -C ${WRKSRC}/server/build/server/Metrics

	@${TAR} -xf ${DISTDIR}/npm-cache-server.tar.gz -C ${WRKSRC}/server
	@${TAR} -xf ${DISTDIR}/npm-cache-web-apps_build.tar.gz -C ${WRKSRC}/web-apps/build
	@${TAR} -xf ${DISTDIR}/npm-cache-web-apps_vendor_framework7-react.tar.gz -C ${WRKSRC}/web-apps/vendor/framework7-react
	@${TAR} -xf ${DISTDIR}/npm-cache-pkg.tar.gz -C ${WRKSRC}/pkg
	@${TAR} -xf ${DISTDIR}/npm-cache-document-server-integration.tar.gz -C ${WRKSRC}/document-server-integration/web/documentserver-example/nodejs
	@${TAR} -xf ${DISTDIR}/onlyoffice-hunspell.tar.gz -C ${WRKSRC}/core/Common/3dParty/hunspell

# extract hunspell.tar.gz in core/Common/3dParty/hunspell or remove it in build_tools/scripts/core_common/make_common.py
#
# patch pkg / node (https://github.com/vercel/pkg, https://github.com/vercel/pkg-fetch/releases)
# https://github.com/vercel/pkg-fetch/tree/main/patches
# https://raw.githubusercontent.com/vercel/pkg-fetch/main/patches/node.v16.13.0.cpp.patch
# rsync /usr/ports/www/node . + patch
# cp stage/usr/local/bin/node ${WRKDIR}/.pkg-cache/v3.2/built-v16.13.0-freebsd-x64
# cd /root/onlyoffice-documentserver-ports/work/DocumentServer-6.4.2/server/build/server/Metrics
# /root/onlyoffice-documentserver-ports/work/DocumentServer-6.4.2/server/node_modules/.bin/pkg . -t node16-freebsd -o metrics
#
# copy warning [file not exist]: /root/onlyoffice-documentserver-ports/work/DocumentServer-6.4.2/build_tools/scripts/../../server/build/server/Metrics/node_modules/modern-syslog/build/Release/core.node
#
# cp -f ./document-server-integration/web/documentserver-example/nodejs/node_modules/sync-rpc/lib/index.js.orig ./document-server-integration/web/documentserver-example/nodejs/node_modules/sync-rpc/lib/index.js

MAKE_ENV+=	PKG_CACHE_PATH=${WRKDIR}/.pkg-cache

do-build:
	@${MKDIR} ${WRKSRC}/server/build/server/Common ${WRKSRC}/server/build/server/DocService ${WRKSRC}/server/build/server/FileConverter ${WRKSRC}/server/build/server/Metrics
	@${TAR} -xf ${DISTDIR}/npm-cache-server_Common.tar.gz -C ${WRKSRC}/server/build/server/Common
	@${TAR} -xf ${DISTDIR}/npm-cache-server_DocService.tar.gz -C ${WRKSRC}/server/build/server/DocService
	@${TAR} -xf ${DISTDIR}/npm-cache-server_FileConverter.tar.gz -C ${WRKSRC}/server/build/server/FileConverter
	@${TAR} -xf ${DISTDIR}/npm-cache-document-server-integration.tar.gz -C ${WRKSRC}/document-server-integration/web/documentserver-example/nodejs

	@${CP} ${FILESDIR}/packagejsons/server/Common/package* ${WRKSRC}/server/build/server/Common
	@${CP} ${FILESDIR}/packagejsons/server/DocService/package* ${WRKSRC}/server/build/server/DocService
	@${CP} ${FILESDIR}/packagejsons/server/FileConverter/package* ${WRKSRC}/server/build/server/FileConverter
	@${CP} ${FILESDIR}/packagejsons/server/Metrics/package* ${WRKSRC}/server/build/server/Metrics

	@${CP} ${FILESDIR}/packagejsons/document-server-integration/web/documentserver-example/nodejs/package* ${WRKSRC}/document-server-integration/web/documentserver-example/nodejs

# XXX server/* etc not used in the build? only server/build/server/Common is used?
.for f in server/Common server/DocService server/FileConverter server/Metrics document-server-integration/web/documentserver-example/nodejs
	@${CP} ${FILESDIR}/packagejsons/${f}/package* ${WRKSRC}/${f}
	@${RM} ${WRKSRC}/${f}/npm-shrinkwrap.json
.endfor

.for d in sdkjs/build server web-apps/build web-apps/vendor/framework7-react
	cd ${WRKSRC}/${d} && \
		 ${SETENV} HOME=${WRKSRC}/${d} npm install --offline
.endfor

.for d in server/build/server/Common server/build/server/DocService server/build/server/FileConverter server/build/server/Metrics document-server-integration/web/documentserver-example/nodejs
	cd ${WRKSRC}/${d} && \
		 ${SETENV} HOME=${WRKSRC}/${d} npm install --offline
.endfor
	cd ${WRKSRC}/build_tools/tools/freebsd && env HOME=${WRKSRC}/web-apps/build npm install -g grunt-cli --offline
	cd ${WRKSRC}/build_tools/tools/freebsd && env HOME=${WRKSRC}/pkg npm install -g pkg --offline

# build_tools/scripts/deploy_server.py
# XXX enotfound /root/onlyoffice-documentserver-ports/work/DocumentServer-6.4.2/build_tools/scripts/../out/freebsd_64/onlyoffice/documentserver/sdkjs-plugins/plugins.js
	@${MKDIR} ${WRKSRC}/sdkjs-plugins/v1
	@${CP} ${FILESDIR}/sdkjs-plugins/v1/* ${WRKSRC}/sdkjs-plugins/v1

# XXX fetch + checksum
# https://github.com/ONLYOFFICE/build_tools/blob/master/scripts/deploy_server.py#L110
# https://github.com/ONLYOFFICE/DocumentBuilder/tree/master/empty
	@${MKDIR} ${WRKSRC}/DocumentBuilder/empty
	@${CP} ${FILESDIR}/*.bin ${WRKSRC}/DocumentBuilder/empty

	@${MKDIR} ${WRKSRC}/web-apps/build/node_modules/optipng-bin/vendor
	@${CP} ${LOCALBASE}/bin/optipng ${WRKSRC}/web-apps/build/node_modules/optipng-bin/vendor

# XXX try with python3
	cd ${WRKSRC}/build_tools/tools/freebsd ; ${SETENV} ${MAKE_ENV} python2.7 automate.py

.include <bsd.port.mk>
