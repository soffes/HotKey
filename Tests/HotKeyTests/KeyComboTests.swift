import XCTest
import HotKey

final class KeyComboTests: XCTestCase {
	func testSerialization() {
		let keyCombo = KeyCombo(key: .c, modifiers: .command)

		let dictionary = keyCombo.dictionary
		XCTAssertEqual(8, dictionary["keyCode"] as! Int)
		XCTAssertEqual(256, dictionary["modifiers"] as! Int)

		let keyCombo2 = KeyCombo(dictionary: dictionary)!
		XCTAssertEqual(keyCombo.key, keyCombo2.key)
		XCTAssertEqual(keyCombo.modifiers, keyCombo2.modifiers)
	}

    func testDescription() {
        XCTAssertEqual("⌘C", KeyCombo(key: .c, modifiers: .command).description)
        XCTAssertEqual("⌃⌥⇧⌘C", KeyCombo(key: .c, modifiers: [.command, .shift, .control, .option]).description)
    }
}
