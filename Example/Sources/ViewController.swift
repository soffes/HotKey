import AppKit
import HotKey
import Carbon

final class ViewController: NSViewController {

	// MARK: - Properties

	@IBOutlet var pressedLabel: NSTextField!

	private var hotKey: HotKey? {
		didSet {
			guard let hotKey = hotKey else {
				pressedLabel.stringValue = "Unregistered"
				return
			}

			pressedLabel.stringValue = "Registered"

			hotKey.keyDownHandler = { [weak self] in
				self?.pressedLabel.stringValue = "Pressed at \(Date())"
			}
		}
	}


	// MARK: - NSViewController

	override func viewDidLoad() {
		super.viewDidLoad()
		register(self)
	}


	// MARK: - Actions

	@IBAction func unregister(_ sender: Any?) {
		hotKey = nil
	}

	@IBAction func register(_ sender: Any?) {
		hotKey = HotKey(keyCombo: KeyCombo(key: .r, modifiers: [.command, .option]))
	}
}
