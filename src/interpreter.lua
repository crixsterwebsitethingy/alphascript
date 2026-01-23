local interpreter = {}
local funcs = require("functions")
local rt = require("runtime")
function interpreter.execute(input)
    local last_funcdef = nil
    local for_runtime = {}
    local for_runtime_funcs = {}
    for _, token in ipairs(input) do
        if token.class == "MATH" then
                table.insert(for_runtime, {line = token.ID, func = token.value, args = token.args0})
        --[[elseif token.class == "FUNC" then
            table.insert(for_runtime_funcs, {line = token.ID, func = "func", args = token.args0, body_start = token.ID + 1, body_end = nil })
            last_funcdef = token.ID
        elseif token.class == "FUNC_END" then
            for k, v in #for_runtime_funcs do
                if k.func == "func" and last_funcdef == k.ID then
                    k.body_end = token.ID
                    print(k.body_end)
                    last_funcdef = {}
                end
            end]]
        end

    end
    rt:run(for_runtime)
end


return interpreter  