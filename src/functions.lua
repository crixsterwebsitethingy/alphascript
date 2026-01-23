local functions = {}
functions.funcs = {}
function functions.register(name, params, body)
    table.insert(functions.funcs, {name = name, params = params, body = body})
end
function functions.call(name, params)
    --todo, for now functions just run at runtime
end
return functions
--e