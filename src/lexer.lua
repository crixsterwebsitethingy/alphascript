local lexer = {}
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
        if name == "add" then
            --print("Found add function. Arguments: " .. args)
            table.insert(tokens, {ID = a, class = "MATH", type = "ARITHMETIC", value = "add", args0 = args   })
            table.insert(tokens, {ID = a, class = "ARGUMENTS", value = args})
        elseif name == "sub" then
            --print("Found sub function")
            table.insert(tokens, {ID = a, class = "MATH", type = "ARITHMETIC", value = "sub", args0 = args})
            table.insert(tokens, {ID = a, class = "ARGUMENTS", value = args})
        end
        else 
            print("No function found on line " .. a)
        end
        --[[if func:match("^as%.([%a_]+)$") == "add" then
            print("Found add function")
            table.insert(tokens, {ID = a, class = "MATH", type = "ARITHMETIC", value = "add"})
            table.insert(tokens, {ID = a, class = "ARGUMENTS", value = args})
        elseif func:match("^as%.([%a_]+)$") == "sub" then
            print("Found sub function")
            table.insert(tokens, {class = "MATH", type = "ARITHMETIC", value = "sub"})
            table.insert(tokens, {ID = a, class = "ARGUMENTS", value = args})
        end]]
    end
    return tokens
end

return lexer