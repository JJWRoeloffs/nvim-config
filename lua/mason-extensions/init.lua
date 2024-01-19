local package = require("mason-core.package")
local registry = require("mason-registry")

local function notify(msg, level)
    level = level or vim.log.levels.INFO
    vim.notify(msg, level, {
        title = "JJW-INSTALLER",
    })
end

local function get_name(funct)
    for i, v in pairs(getfenv()) do
        if v == funct then
            return i
        end
    end
end

local function install(pkg, version)
    notify(("[mason-extensions] installing %s"):format(pkg.name))
    return pkg:install({ version = version }):once(
        "closed",
        vim.schedule_wrap(function()
            if pkg:is_installed() then
                notify(
                    ("[mason-extensions] %s was successfully installed"):format(pkg.name)
                )
            else
                notify(
                    ("[mason-extensions] failed to install %s. Installation logs are available in :Mason and :MasonLog"):format(
                        pkg.name
                    ),
                    vim.log.levels.ERROR
                )
            end
        end)
    )
end

local function install_quiet(package_name, version)
    local ok, pkg = pcall(registry.get_package, package_name)
    if ok then
        install(pkg, version)
    else
        notify(
            ("[mason-extensions] could not install %s. Not a package"):format(
                package_name
            )
        )
    end
end

local function ensure_installed(package_name, version)
    if not registry.is_installed(package_name) then
        install_quiet(package_name, version)
    end
end

local function wrap(func)
    local function inner(package_specifier)
        local package_name, version = package.Parse(package_specifier)
        func(package_name, version)
    end

    return function(argument)
        if type(argument) == "string" then
            inner(argument)
        elseif type(argument) == "table" and vim.tbl_islist(argument) then
            for _, package_name in ipairs(argument) do
                inner(package_name)
            end
        else
            notify(
                ("[mason-extensions] could not parse arguments to %s"):format(
                    get_name(func)
                ),
                vim.log.levels.ERROR
            )
        end
    end
end

local M = {}

M.ensure_installed = wrap(ensure_installed)
M.install_quiet = wrap(install_quiet)

return M
