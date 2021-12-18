/**
 *
 * (c) Copyright Ascensio System SIA 2021
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

(function(window, undefined){

    window.Asc = window.Asc || {};
    window.Asc.plugin = {};

    // ie channel
    window.Asc.plugin.ie_channel = null;
    window.Asc.plugin.ie_channel_check = function(e) {
        var uagent = navigator.userAgent.toLowerCase();
        if (uagent.indexOf("msie") > -1 || uagent.indexOf("trident") > -1)
        {
            if (e.ports && e.ports[0])
                this.ie_channel = e.ports[0];
        }
    };

    window.Asc.plugin.tr_init = false;
    window.Asc.plugin.tr = function(val) { return val; }

    window.Asc.scope = {};
    window.Asc.scope.prototype = {
        clear : function() {
            for (var i in window.Asc.scope) 
                delete window.Asc.scope[i];
        }
    };

    function extend(obj, plugin) {
        if (!obj || !("object" == typeof(obj) || "array" == typeof(obj)))
            return obj;

        var dst = (plugin === undefined) ? {} : plugin;
        for (var prop in obj) {
            if (obj.hasOwnProperty(prop)) {
                dst[prop] = (obj[prop] && "object" === typeof obj[prop]) ? extend(obj[prop]) : obj[prop];
            }
        }
        return dst;
    }

    window.onload = function()
    {
        if (!window.Asc || !window.Asc.plugin)
            return;

        var xhr = new XMLHttpRequest();
        xhr.open("get", "./config.json", true);
        xhr.responseType = "json";
        xhr.onload = function() {
            if (!window.Asc || !window.Asc.plugin)
                return;

            if (xhr.status == 200 || (xhr.status == 0 && xhr.readyState == 4)) {
                var objConfig = xhr.response;
                if ((typeof objConfig) == "string")
                    objConfig = JSON.parse(objConfig);

                extend(objConfig, window.Asc.plugin);

                var obj = {
                    type : "initialize",
                    guid : window.Asc.plugin.guid
                };

                var _body = document.body;
                if (_body && true !== window.Asc.plugin.enableDrops) {
                    _body.ondrop = function(e) {
                        if (e && e.preventDefault)
                            e.preventDefault();
                        return false;
                    };
                    _body.ondragenter = function(e) {
                        if (e && e.preventDefault)
                            e.preventDefault();
                        return false;
                	};
                	_body.ondragover = function(e) {
                        if (e && e.preventDefault)
                            e.preventDefault();
                        if (e && e.dataTransfer)
                            e.dataTransfer.dropEffect = "none";
                        return false;
                    };
                }

                // ie11 not support message from another domain
                window.Asc.plugin._initInternal = true;
			
                window.parent.postMessage(JSON.stringify(obj), "*");
            }
        };
        xhr.send();
    };

    window.Asc.supportOrigins = {};
	window.Asc.supportOrigins[window.origin] = true;

    function onMessage(event) {
        if (!window.Asc || !window.Asc.plugin)
            return;

        if (window.plugin_onMessage) {
            if (!window.Asc.supportOrigins[event.origin])
                return;
            window.plugin_onMessage(event);
            return;
        }

        if (!window.Asc.plugin._initInternal)
            return;

        if (typeof(event.data) == "string") {
            var pluginData = {};
            try {
                pluginData = JSON.parse(event.data);
            }
            catch(err) {
                pluginData = {};
            }

            if (pluginData.type == "plugin_init") {
                window.Asc.supportOrigins[event.origin] = true;
				window.Asc.plugin.ie_channel_check(event);
                eval(pluginData.data);
            }
        }
    }

    if (window.addEventListener)
        window.addEventListener("message", onMessage, false);
    else
        window.attachEvent("onmessage", onMessage);

    window.onunload = function() {
        if (window.addEventListener)
            window.removeEventListener("message", onMessage, false);
        else
            window.detachEvent("onmessage", onMessage);
    };
})(window, undefined);
