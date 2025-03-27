local utils = require("kong.plugins.oidc.utils")
local filter = require("kong.plugins.oidc.filter")
local session = require("kong.plugins.oidc.session")

local cjson = require("cjson")

local OidcHandler = {
    VERSION = "10.1.0",
    PRIORITY = 1000,
  }

function OidcHandler:new()
end

function OidcHandler:access(config)
    ngx.log(ngx.INFO, "------ access ------- ")
    local oidcConfig = utils.get_options(config, ngx)
    ngx.log(ngx.INFO, cjson.encode(oidcConfig))

    local sessionConfig = utils.get_session_options(config, ngx)
    ngx.log(ngx.INFO, cjson.encode(sessionConfig))

    if filter.shouldProcessRequest(oidcConfig) then
        session.configure(config)
        handle(oidcConfig, sessionConfig)
    else
        ngx.log(ngx.DEBUG, "OidcHandler ignoring request, path: " .. ngx.var.request_uri)
    end
end

function handle(oidcConfig, sessionConfig)
    ngx.log(ngx.INFO, "------ handle ------- ")
    local response
    if oidcConfig.introspection_endpoint then
        response = introspect(oidcConfig)
        if response then
            ngx.log(ngx.DEBUG, "User found from introspection")
            utils.injectUser(response)
        end
    end

    if response == nil then
        response = make_oidc(oidcConfig, sessionConfig)
        if response then
            if (response.user) then
                ngx.log(ngx.DEBUG, "OidcHandler INJECT USER: ")
                utils.injectUser(response.user)
            end
            if (response.access_token) then
                ngx.log(ngx.DEBUG, "OidcHandler ACCESS TOKEN: ")
                utils.injectAccessToken(response.access_token)
            end
            if (response.id_token) then
                ngx.log(ngx.DEBUG, "OidcHandler ID TOKEN: ")
                utils.injectIDToken(response.id_token)
            end
        end
    end
end

function make_oidc(oidcConfig, sessionConfig)
    ngx.log(ngx.INFO, "OidcHandler calling authenticate, requested path: " .. ngx.var.request_uri)
    local res, err = require("resty.openidc").authenticate(oidcConfig, nil, nil, sessionConfig)
    if err then
        ngx.log(ngx.ERROR, cjson.encode(err))
        if oidcConfig.recovery_page_path then
            ngx.log(ngx.DEBUG, "Entering recovery page: " .. oidcConfig.recovery_page_path)
            ngx.redirect(oidcConfig.recovery_page_path)
        end
        utils.exit(500, err, ngx.HTTP_INTERNAL_SERVER_ERROR)
    end
    return res
end

function introspect(oidcConfig)
    ngx.log(ngx.INFO, utils.has_bearer_access_token())
    if utils.has_bearer_access_token() or oidcConfig.bearer_only == "yes" then
        local res, err = require("resty.openidc").introspect(oidcConfig)
        if err then
            if oidcConfig.bearer_only == "yes" then
                ngx.header["WWW-Authenticate"] = 'Bearer realm="' .. oidcConfig.realm .. '",error="' .. err .. '"'
                utils.exit(ngx.HTTP_UNAUTHORIZED, err, ngx.HTTP_UNAUTHORIZED)
            end
            return nil
        end
        ngx.log(ngx.DEBUG, "OidcHandler introspect succeeded, requested path: " .. ngx.var.request_uri)
        return res
    end
    return nil
end


return OidcHandler
