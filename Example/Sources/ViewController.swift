//
//  ViewController.swift
//  Example
//
//  Created by Sam Soffes on 7/21/17.
//  Copyright © 2017 Sam Soffes. All rights reserved.
//

import AppKit
import HotKey
import Carbon

final class ViewController: NSViewController {

	// MARK: - Properties

	@IBOutlet var pressedLabel: NSTextField!

	private let hotKey = HotKey(keyCombo: KeyCombo(carbonKeyCode: UInt32(kVK_ANSI_R), modifiers: [.command, .option]))

	override func viewDidLoad() {
		super.viewDidLoad()

		hotKey.keyDownHandler = { [weak self] in
			self?.pressedLabel.stringValue = "Pressed at \(Date())"
		}
	}
}
