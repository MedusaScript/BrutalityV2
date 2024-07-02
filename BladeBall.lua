local tonumber = tonumber
local string_byte = string.byte
local string_char = string.char
local string_sub = string.sub
local string_gsub = string.gsub
local string_rep = string.rep
local table_concat = table.concat
local table_insert = table.insert
local math_ldexp = math.ldexp
local getfenv = getfenv or function() return _ENV end
local setmetatable = setmetatable
local pcall = pcall
local select = select
local unpack = unpack or table.unpack
local tonumber = tonumber

local function decode(encoded_str, init_val, ...)
    local index = 1
    local temp_var

    encoded_str = string_gsub(string_sub(encoded_str, 5), "%.%.", function(char)
        if (string_byte(char, 2) == 79) then
            temp_var = tonumber(string_sub(char, 1, 1))
            return ""
        else
            local char_val = string_char(tonumber(char, 16))
            if temp_var then
                local repeated_char = string_rep(char_val, temp_var)
                temp_var = nil
                return repeated_char
            else
                return char_val
            end
        end
    end)

    local function read_byte()
        local byte_val = string_byte(encoded_str, index, index)
        index = index + 1
        return byte_val
    end

    local function read_short()
        local byte1, byte2 = string_byte(encoded_str, index, index + 1)
        index = index + 2
        return (byte2 * 256) + byte1
    end

    local function read_int()
        local byte1, byte2, byte3, byte4 = string_byte(encoded_str, index, index + 3)
        index = index + 4
        return (byte4 * 16777216) + (byte3 * 65536) + (byte2 * 256) + byte1
    end

    local function read_float()
        local mantissa, exponent = read_int(), read_int()
        local sign = (mantissa > 0x7FFFFFFF and -1 or 1)
        if sign == -1 then mantissa = mantissa - 0x80000000 end
        if exponent == 0 then
            if mantissa == 0 then
                return sign * 0
            else
                exponent = 1
            end
        elseif exponent == 255 then
            if mantissa == 0 then
                return sign * math.huge
            else
                return sign * (0 / 0)
            end
        end
        return math_ldexp(sign, exponent - 127) * (1 + mantissa / 0x800000)
    end

    local function read_string(length)
        if not length then
            length = read_int()
            if length == 0 then return "" end
        end
        local str = string_sub(encoded_str, index, index + length - 1)
        index = index + length
        local char_table = {}
        for i = 1, #str do
            table_insert(char_table, string_char(string_byte(string_sub(str, i, i))))
        end
        return table_concat(char_table)
    end

    local decode_int = read_int
    local function read_varargs(...)
        return {...}, select("#", ...)
    end

    local function process()
        local values_count = read_int()
        local values = {}
        for i = 1, values_count do
            local var_type = read_byte()
            local var_value
            if var_type == 1 then
                var_value = read_byte() ~= 0
            elseif var_type == 2 then
                var_value = read_float()
            elseif var_type == 3 then
                var_value = read_string()
            end
            values[i] = var_value
        end

        return values
    end

    return process
end
