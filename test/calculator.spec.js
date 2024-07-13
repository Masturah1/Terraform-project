const assert = require("chai").assert;
const calculator = require("../script");

describe("Calculator", function () {
  describe("Addition", function () {
    it("should return 2 for 1+1", function () {
      assert.equal(calculator.calculate("1+1"), 2);
    });

    it("should return 10 for 6+4", function () {
      assert.equal(calculator.calculate("6+4"), 10);
    });
  });

  describe("Subtraction", function () {
    it("should return -2 for 1-3", function () {
      assert.equal(calculator.calculate("1-3"), -2);
    });

    it("should return 2 for 6-4", function () {
      assert.equal(calculator.calculate("6-4"), 2);
    });
  });

  describe("Multiplication", function () {
    it("should return 6 for 2*3", function () {
      assert.equal(calculator.calculate("2*3"), 6);
    });

    it("should return 12 for 3*4", function () {
      assert.equal(calculator.calculate("3*4"), 12);
    });
  });

  describe("Division", function () {
    it("should return 1 for 2/2", function () {
      assert.equal(calculator.calculate("2/2"), 1);
    });

    it("should return 3 for 12/4", function () {
      assert.equal(calculator.calculate("12/4"), 3);
    });
  });
});