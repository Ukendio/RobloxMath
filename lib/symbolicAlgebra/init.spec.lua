local poly = require(script.Parent.symbolicAlgebra).polynomial

return function()
    describe("symbolic algebra", function() 
        it("testing multiplication", function() 
            local x = 1
            local linear = poly.new({1, x})
            expect(tostring(linear)).to.equal("1 + 1x^1")

            local quadratic = linear * linear

            expect(tostring(quadratic)).to.equal("1 + 2x^1 + 1x^2")

            local four = poly.polynomial.evaluate(quadratic, {x = 1})
            expect(tostring(four)).to.equal("4")

            local multi = linear * poly.polynomial.replace(linear, "x", "y")
            expect(tostring(multi)).to.equal("1 + 1x^1 + 1y^1 + 1x^1y^1")

            local doubleLinear = linear + linear
            expect(tostring(doubleLinear)).to.equal("2 + 2x^1")
        end)
    end)
end