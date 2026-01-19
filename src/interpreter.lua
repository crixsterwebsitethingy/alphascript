local interpreter = {}
local rt = require("runtime")
function interpreter.execute(input)
    local for_runtime = {}
    for _, token in ipairs(input) do
        if token.class == "MATH" then
            if token.value == "add" then
                --print("Executing addition with arguments: "..token.args0.." at line "..token.ID)
                table.insert(for_runtime, {line = token.ID, func = "add", args = token.args0})
            elseif token.value == "sub" then
                --print("Executing subtraction with arguments: " .. token.args0.." at line "..token.ID)
                table.insert(for_runtime, {line = token.ID, func = "subtract", args = token.args0})
            elseif token.value == "mul" then
                --print("Executing multiplication with arguments: " .. token.args0.." at line "..token.ID)
                table.insert(for_runtime, {line = token.ID, func = "multiply", args = token.args0})
            elseif token.value == "div" then
                --print("Executing division with arguments: " .. token.args0.." at line "..token.ID)
                table.insert(for_runtime, {line = token.ID, func = "divide", args = token.args0})
            end
        end
    end
    rt:run(for_runtime)
end


return interpreter  