local function lexicographicCompare(left, right)
    local i = 1

    while i < #left and i < #right do
        if left[i] == right[i] then
            i = i + 1
        else
            return left[i] < right[i]
        end
    end

    if #left >= #right then
        return left[i] < right[i]
    else
        return left[i] <= right[i]
    end
end

local function subarray(array, index)
    local result = {}

    for i = 1, math.min(index, #array) do
        result[i] = array[i]
    end

    return result
end

local function suparray(array, index)
    local result = {}

    for i = index, #array do
        result[#result+1] = array[i]
    end
end

local function binarySearch(element, array)
    if array == nil or #array == 0 then
        return false
    end

    local checkIndex = math.floor(#array / 2)

    if #array == 1 then
        if element == array[1] then
            return 1
        else
            return false
        end
    end

    if element < array[checkIndex] then
        return binarySearch(element, subarray(array, checkIndex - 1))
    elseif element > array[checkIndex] then
        return checkIndex + binarySearch(element, suparray(array, checkIndex + 1))
    else
        return checkIndex
    end
end


local hadamardProduct = function (left, right)
    if #left ~= #right then
        error("Array length mismatch for Hadamard product!", 2)
    end

    local result = {}

    for i = 1, #left do
        result[i] = left[i] * right[i]
    end

    return result
end

return {
    hadamardProduct = hadamardProduct,
    lexicographicCompare = lexicographicCompare,
    binarySearch = binarySearch,
    subarray = subarray,
    suparray = suparray,
}