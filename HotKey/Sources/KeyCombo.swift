//
//  CarbonKeyCombo.swift
//  HotKey
//
//  Created by Sam Soffes on 7/21/17.
//  Copyright © 2017 Sam Soffes. All rights reserved.
//

public struct KeyCombo {

	// MARK: - Properties

	public var carbonKeyCode: UInt32
	public var carbonModifiers: UInt32

	public var isValid: Bool {
		return carbonKeyCode >= 0 && carbonModifiers > 0
	}


	// MARK: - Initializers

	public init(carbonKeyCode: UInt32, carbonModifiers: UInt32) {
		self.carbonKeyCode = carbonKeyCode
		self.carbonModifiers = carbonModifiers
	}
}


extension KeyCombo: Equatable {
	public static func == (lhs: KeyCombo, rhs: KeyCombo) -> Bool {
		return lhs.carbonKeyCode == rhs.carbonKeyCode && lhs.carbonModifiers == rhs.carbonModifiers
	}
}
