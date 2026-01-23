local runtime = {}
print("----ALPHASCRIPT RUNTIME TERMINAL----")
function runtime:run(data)
    for i, v in ipairs(data) do
        local args = {} 
        for arg in v.args:gmatch("[^,]+") do
            table.insert(args, arg)
        end
        --print(v.func)
        if v.func == "add" then
            local result = tonumber(args[1]) + tonumber(args[2])
            print(v.line..": " .. result)
        elseif v.func == "sub" then
            local result = tonumber(args[1]) - tonumber(args[2])
            print(v.line..": " .. result)
        elseif v.func == "mul" then
            local result = tonumber(args[1]) * tonumber(args[2])    
            print(v.line..": " .. result)
        elseif v.func  == "div" then
            local result = tonumber(args[1]) / tonumber(args[2])    
            print(v.line..": " .. result)
        end
    end

end

return runtime