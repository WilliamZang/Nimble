import XCTest
import Kick

class BeIdenticalToTest: XCTestCase {
    func testBeAnInstanceOfPositive() {
        expect(NSNumber.numberWithInteger(1)).to(beIdenticalTo(NSNumber.numberWithInteger(1)))
    }

    func testBeAnInstanceOfNegative() {
        expect(NSNumber.numberWithInteger(1)).toNot(beIdenticalTo("yo"))
        expect([1]).toNot(beIdenticalTo([1]))
    }

    func testBeAnInstanceOfPositiveMessage() {
        let num1 = NSNumber.numberWithInteger(1)
        let num2 = NSNumber.numberWithInteger(2)
        let args = VaListBuilder()
        args.append(num1)
        args.append(num2)
        let message = NSString(format: "expected <1> (0x%p) to be identical to <2> (0x%p)", arguments: args.va_list())
        failsWithErrorMessage(message) {
            expect(num1).to(beIdenticalTo(num2))
        }
    }

    func testBeAnInstanceOfNegativeMessage() {
        let value1 = NSArray(array: [])
        let value2 = NSArray(array: [])
        let args = VaListBuilder()
        args.append(value1)
        args.append(value1)
        args.append(value2)
        args.append(value2)
        let message = NSString(format: "expected <%@> (0x%p) to not be identical to <%@> (0x%p)", arguments: args.va_list())
        failsWithErrorMessage(message) {
            expect(value1).toNot(beIdenticalTo(value2))
        }
    }
}
