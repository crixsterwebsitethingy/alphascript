local lexer = {}
local funcs = require("functions")
local FUNC_PATTERN = "[%a%.]+"
local ARG_PATTERN = "%((.-)%)"

function lexer.tokenize(source)
    local a = 0
    local tokens = {} 
    for line in source:gmatch("[^\r\n]+") do
        a = a + 1
        local func = line:match(FUNC_PATTERN)
        local args = line:match(ARG_PATTERN)
        if func then
        local name = func:match("^as%.([%a_]+)$")
        if name ~= "func" and name ~= "end" then
            table.insert(tokens, {ID = a, class = "MATH", type = "ALPHASCRIPT_CORE", value = name, args0 = args})
        --[[elseif name == "func" then 
            table.insert(tokens, {ID = a, class = "FUNC", type = "ALPHASCRIPT_CORE", value = name, args0 = args})
        elseif name == "end" then
            table.insert(tokens, {ID = a, class = "FUNC_END"})]]
        end

        
        --[[if name == "add" then
            table.insert(tokens, {ID = a, class = "MATH", type = "ARITHMETIC", value = "add", args0 = args   })
            table.insert(tokens, {ID = a, class = "ARGUMENTS", value = args})
        elseif name == "sub" then
            table.insert(tokens, {ID = a, class = "MATH", type = "ARITHMETIC", value = "sub", args0 = args})
            table.insert(tokens, {ID = a, class = "ARGUMENTS", value = args})
        elseif name == "mul" then
            table.insert(tokens, {ID = a, class = "MATH", type = "ARITHMETIC", value = "mul", args0 = args})
        elseif name == "div" then
            table.insert(tokens, {ID = a, class = "MATH", type = "ARITHMETIC", value = "div", args0 = args})
        end]]
        end
    end
    return tokens
end

return lexer