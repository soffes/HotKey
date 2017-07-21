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

	public enum Kind {
		case keyDown
		case keyUp
	}

	public typealias Handler = (Kind) -> Void


	// MARK: - Properties

	public let keyCombo: KeyCombo
	public var handler: Handler


	// MARK: - Initializers

	public init(keyCombo: KeyCombo, handler: @escaping Handler) {
		self.keyCombo = keyCombo
		self.handler = handler

		HotKeysController.register(self)
	}

	deinit {
		HotKeysController.unregister(self)
	}
}
