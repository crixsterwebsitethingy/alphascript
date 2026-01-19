local interpreter = require("interpreter")
local lexer = require("lexer")
local parser = require("parser") 
local runtime = require("runtime")   

local function runfile(path)
    local file = io.open(path, "r")
    if not file then
        error("Could not open file: " .. path)
    end

    local source = file:read("*a")
    file:close()

    return source
end
local function run(f)
    local source = runfile(f)
    local tokens = lexer.tokenize(source)
    local result = interpreter.execute(tokens)
end
local file = arg[1]
if file then
    run(file)
else
    print("Please provide a file to run.")
end