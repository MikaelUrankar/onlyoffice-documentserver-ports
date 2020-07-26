# $FreeBSD$

# openssl.pri useless
# DesktopEditor/raster/JBig2/source/LeptonLib/readfile.cpp
# DesktopEditor/xmlsec/test/OpenSSL_gui_test/OpenSSL_gui_test.pro
# Common/3dParty/openssl/openssl.pri
# Common/3dParty/v8/v8.pri 
# Common/3dParty/v8/v8_xp/v8.pri

PORTNAME=	documentserver
DISTVERSION=	5.5.3
CATEGORIES=	lang

MAINTAINER=	mikael@FreeBSD.org
COMMENT=	online office suite

LICENSE=	AGPLv3
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

# XXX llvm10
# v8=6.8:lang/v8 , available here https://github.com/MikaelUrankar/v8-ports/tree/6.8
# qmake, boost-libs, icu ...
BUILD_DEPENDS=	boost-libs>0:devel/boost-libs \
		llvm10>0:devel/llvm10

USES=		gmake qt:5
USE_QT=		qmake_build
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

do-build:
	cd ${WRKSRC}/core ; ${SETENV} ${MAKE_ENV} ${MAKE_CMD}
# XXX build / patch core-fonts, dict, sdkjs*, server, web-apps
# https://github.com/ONLYOFFICE/DocumentServer/issues/79#issuecomment-582545158
# https://github.com/ONLYOFFICE/DocumentServer/issues/79#issuecomment-583453517

.include <bsd.port.mk>
