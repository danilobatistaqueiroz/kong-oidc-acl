local utils = require("kong.plugins.oidc.utils")

local M = {}

function M.configure(config)
  if config.session_secret then
    ngx.log(ngx.INFO, "session_secret: " .. config.session_secret)
    local decoded_session_secret = ngx.decode_base64(config.session_secret)
    if not decoded_session_secret then
      ngx.log(ngx.ERR, "invalid OIDC plugin configuration, session secret could not be decoded")
      utils.exit(500, "invalid OIDC plugin configuration, session secret could not be decoded", ngx.exit(ngx.HTTP_INTERNAL_SERVER_ERROR))
    end
    ngx.var.session_secret = decoded_session_secret
    ngx.var.session_name = "KUKI_TEST"
  end
end

return M
