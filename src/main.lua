local interpreter = require("interpreter")
local lexer = require("lexer")
local parser = require("parser") 
local errors = require("errors")       

local function runfile(path)
    local file = io.open(path, "r")
    if not file then
        error("Could not open file: " .. filename)
    end

    local source = file:read("*a")
    file:close()

    print("Running file: " .. path)
    return result
end
local function run(f)
    local source = runfile(f)
    local tokens = lexer.tokenize(source)
    local ast = parser.parse(tokens)
    local result = interpreter.execute(ast)
    errors:list()
end
local file = arg[1]
if file then
    runfile(file)
else
    print("Please provide a file to run.")
end