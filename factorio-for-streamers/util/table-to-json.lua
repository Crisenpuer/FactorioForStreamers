local function ffs.util.table_to_json(tbl)
    local result = {}

    local function recurse(obj)
        if type(obj) == "string" then
            table.insert(result, '"' .. obj .. '"')
        elseif type(obj) == "number" then
            table.insert(result, tostring(obj))
        elseif type(obj) == "boolean" then
            table.insert(result, obj and "true" or "false")
        elseif type(obj) == "table" then
            table.insert(result, "{")
            local first = true
            for k, v in pairs(obj) do
                if not first then
                    table.insert(result, ",")
                end
                first = false
                table.insert(result, '"' .. k .. '":')
                recurse(v)
            end
            table.insert(result, "}")
        else
            error("Unsupported data type: " .. type(obj))
        end
    end

    recurse(tbl)
    return table.concat(result)
end