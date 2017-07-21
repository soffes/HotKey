//
//  HotKey.swift
//  HotKey
//
//  Created by Sam Soffes on 7/21/17.
//  Copyright © 2017 Sam Soffes. All rights reserved.
//

import Carbon

public final class HotKey {

	// MARK: - Types

	public typealias Handler = () -> Void

	// MARK: - Properties

	public let keyCombo: KeyCombo
	public var keyDownHandler: Handler?
	public var keyUpHandler: Handler?


	// MARK: - Initializers

	public init(keyCombo: KeyCombo, keyDownHandler: Handler? = nil, keyUpHandler: Handler? = nil) {
		self.keyCombo = keyCombo
		self.keyDownHandler = keyDownHandler
		self.keyUpHandler = keyUpHandler

		HotKeysController.register(self)
	}

	deinit {
		HotKeysController.unregister(self)
	}
}
