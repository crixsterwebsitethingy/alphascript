local interpreter = {}

function interpreter.execute(input)
    local for_runtime = {}
    for _, token in ipairs(input) do
        if token.class == "MATH" then
            if token.value == "add" then
                print("Executing addition with arguments: "..token.value)
                table.insert(for_runtime, {line = token.ID, func = "add", args = token.args0})
            elseif token.value == "sub" then
                print("Executing subtraction with arguments: " .. token.value)
                table.insert(for_runtime, {line = token.ID, func = "subtract", args = token.args0})
            end
        end
    end
    return for_runtime
end


return interpreter  