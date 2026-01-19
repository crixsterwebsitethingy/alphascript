local runtime = {}
print("----ALPHASCRIPT RUNTIME TERMINAL----")
function runtime:run(data)
    for i, v in ipairs(data) do
        local args = {} 
        for arg in v.args:gmatch("[^,]+") do
            table.insert(args, arg)
             --print(args[1])
            --print(args[2])
        end
        --print("Running: " .. v.func)
        if v.func == "add" then
            local result = tonumber(args[1]) + tonumber(args[2])
            print(v.line..": " .. result)
            --return result
        elseif v.func == "subtract" then
            local result = tonumber(args[1]) - tonumber(args[2])
            print(v.line..": " .. result)
            --return tonumber(args[1]) - tonumber(args[2])
        elseif v.func == "multiply" then
            local result = tonumber(args[1]) * tonumber(args[2])    
            print(v.line..": " .. result)
        elseif v.func  == "divide" then
            local result = tonumber(args[1]) / tonumber(args[2])    
            print(v.line..": " .. result)
        end
    end

end

return runtime