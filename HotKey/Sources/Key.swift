//
//  Key.swift
//  HotKey
//
//  Created by Sam Soffes on 7/21/17.
//  Copyright © 2017 Sam Soffes. All rights reserved.
//

import Carbon

public enum Key: String {

	case a
	case s
	case d
	case f
	case h
	case g
	case z
	case x
	case c
	case v
	case b
	case q
	case w
	case e
	case r
	case y
	case t
	case one
	case two
	case three
	case four
	case six
	case five
	case equal
	case nine
	case seven
	case minus
	case eight
	case zero
	case rightBracket = "rightbracket"
	case o
	case u
	case leftBracket = "leftbracket"
	case i
	case p
	case l
	case j
	case quote
	case k
	case semicolon
	case backslash
	case comma
	case slash
	case n
	case m
	case period
	case grave
	case keypadDecimal = "keypaddecimal"
	case keypadMultiply = "keypadmultiply"
	case keypadPlus = "keypadplus"
	case keypadClear = "keypadclear"
	case keypadDivide = "keypaddivide"
	case keypadEnter = "keypadenter"
	case keypadMinus = "keypadminus"
	case keypadEquals = "keypadequals"
	case keypad0
	case keypad1
	case keypad2
	case keypad3
	case keypad4
	case keypad5
	case keypad6
	case keypad7
	case keypad8
	case keypad9
	case `return`
	case tab
	case space
	case delete
	case escape
	case command
	case shift
	case capsLock = "capslock"
	case option
	case control
	case rightCommand = "rightcommand"
	case rightShift = "rightshift"
	case rightOption = "rightoption"
	case rightControl = "rightcontrol"
	case function
	case f17
	case volumeUp = "volumeup"
	case volumeDown = "volumedown"
	case mute
	case f18
	case f19
	case f20
	case f5
	case f6
	case f7
	case f3
	case f8
	case f9
	case f11
	case f13
	case f16
	case f14
	case f10
	case f12
	case f15
	case help
	case home
	case pageUp = "pageup"
	case forwardDelete = "fowarddelete"
	case f4
	case end
	case f2
	case pageDown = "pagedown"
	case f1
	case leftArrow = "leftarrow"
	case rightArrow = "rightarrow"
	case downArrow = "downarrow"
	case upArrow = "uparrow"
	
	static var keyCodeToKeyMappings: [UInt : Key] = {
		var dict: [Key : UInt] = [:]
		
		for (key, value) in Key.keyToKeyCodeMappings {
			dict[value] = key
		}
		
		return dict
	}()
	
	static let keyToKeyCodeMappings: [Key : UInt] =  [
		.a: UInt32(kVK_ANSI_A),
		.s: UInt32(kVK_ANSI_S),
		.d: UInt32(kVK_ANSI_D),
		.f: UInt32(kVK_ANSI_F),
		.h: UInt32(kVK_ANSI_H),
		.g: UInt32(kVK_ANSI_G),
		.z: UInt32(kVK_ANSI_Z),
		.x: UInt32(kVK_ANSI_X),
		.c: UInt32(kVK_ANSI_C),
		.v: UInt32(kVK_ANSI_V),
		.b: UInt32(kVK_ANSI_B),
		.q: UInt32(kVK_ANSI_Q),
		.w: UInt32(kVK_ANSI_W),
		.e: UInt32(kVK_ANSI_E),
		.r: UInt32(kVK_ANSI_R),
		.y: UInt32(kVK_ANSI_Y),
		.t: UInt32(kVK_ANSI_T),
		.one: UInt32(kVK_ANSI_1),
		.two: UInt32(kVK_ANSI_2),
		.three: UInt32(kVK_ANSI_3),
		.four: UInt32(kVK_ANSI_4),
		.six: UInt32(kVK_ANSI_6),
		.five: UInt32(kVK_ANSI_5),
		.equal: UInt32(kVK_ANSI_Equal),
		.nine: UInt32(kVK_ANSI_9),
		.seven: UInt32(kVK_ANSI_7),
		.minus: UInt32(kVK_ANSI_Minus),
		.eight: UInt32(kVK_ANSI_8),
		.zero: UInt32(kVK_ANSI_0),
		.rightBracket: UInt32(kVK_ANSI_RightBracket),
		.o: UInt32(kVK_ANSI_O),
		.u: UInt32(kVK_ANSI_U),
		.leftBracket: UInt32(kVK_ANSI_LeftBracket),
		.i: UInt32(kVK_ANSI_I),
		.p: UInt32(kVK_ANSI_P),
		.l: UInt32(kVK_ANSI_L),
		.j: UInt32(kVK_ANSI_J),
		.quote: UInt32(kVK_ANSI_Quote),
		.k: UInt32(kVK_ANSI_K),
		.semicolon: UInt32(kVK_ANSI_Semicolon),
		.backslash: UInt32(kVK_ANSI_Backslash),
		.comma: UInt32(kVK_ANSI_Comma),
		.slash: UInt32(kVK_ANSI_Slash),
		.n: UInt32(kVK_ANSI_N),
		.m: UInt32(kVK_ANSI_M),
		.period: UInt32(kVK_ANSI_Period),
		.grave: UInt32(kVK_ANSI_Grave),
		.keypadDecimal: UInt32(kVK_ANSI_KeypadDecimal),
		.keypadMultiply: UInt32(kVK_ANSI_KeypadMultiply),
		.keypadPlus: UInt32(kVK_ANSI_KeypadPlus),
		.keypadClear: UInt32(kVK_ANSI_KeypadClear),
		.keypadDivide: UInt32(kVK_ANSI_KeypadDivide),
		.keypadEnter: UInt32(kVK_ANSI_KeypadEnter),
		.keypadMinus: UInt32(kVK_ANSI_KeypadMinus),
		.keypadEquals: UInt32(kVK_ANSI_KeypadEquals),
		.keypad0: UInt32(kVK_ANSI_Keypad0),
		.keypad1: UInt32(kVK_ANSI_Keypad1),
		.keypad2: UInt32(kVK_ANSI_Keypad2),
		.keypad3: UInt32(kVK_ANSI_Keypad3),
		.keypad4: UInt32(kVK_ANSI_Keypad4),
		.keypad5: UInt32(kVK_ANSI_Keypad5),
		.keypad6: UInt32(kVK_ANSI_Keypad6),
		.keypad7: UInt32(kVK_ANSI_Keypad7),
		.keypad8: UInt32(kVK_ANSI_Keypad8),
		.keypad9: UInt32(kVK_ANSI_Keypad9),
		.`return`: UInt32(kVK_Return),
		.tab: UInt32(kVK_Tab),
		.space: UInt32(kVK_Space),
		.delete: UInt32(kVK_Delete),
		.escape: UInt32(kVK_Escape),
		.command: UInt32(kVK_Command),
		.shift: UInt32(kVK_Shift),
		.capsLock: UInt32(kVK_CapsLock),
		.option: UInt32(kVK_Option),
		.control: UInt32(kVK_Control),
		.rightCommand: UInt32(kVK_RightCommand),
		.rightShift: UInt32(kVK_RightShift),
		.rightOption: UInt32(kVK_RightOption),
		.rightControl: UInt32(kVK_RightControl),
		.function: UInt32(kVK_Function),
		.f17: UInt32(kVK_F17),
		.volumeUp: UInt32(kVK_VolumeUp),
		.volumeDown: UInt32(kVK_VolumeDown),
		.mute: UInt32(kVK_Mute),
		.f18: UInt32(kVK_F18),
		.f19: UInt32(kVK_F19),
		.f20: UInt32(kVK_F20),
		.f5: UInt32(kVK_F5),
		.f6: UInt32(kVK_F6),
		.f7: UInt32(kVK_F7),
		.f3: UInt32(kVK_F3),
		.f8: UInt32(kVK_F8),
		.f9: UInt32(kVK_F9),
		.f11: UInt32(kVK_F11),
		.f13: UInt32(kVK_F13),
		.f16: UInt32(kVK_F16),
		.f14: UInt32(kVK_F14),
		.f10: UInt32(kVK_F10),
		.f12: UInt32(kVK_F12),
		.f15: UInt32(kVK_F15),
		.help: UInt32(kVK_Help),
		.home: UInt32(kVK_Home),
		.pageUp: UInt32(kVK_PageUp),
		.forwardDelete: UInt32(kVK_ForwardDelete),
		.f4: UInt32(kVK_F4),
		.end: UInt32(kVK_End),
		.f2: UInt32(kVK_F2),
		.pageDown: UInt32(kVK_PageDown),
		.f1: UInt32(kVK_F1),
		.leftArrow: UInt32(kVK_LeftArrow),
		.rightArrow: UInt32(kVK_RightArrow),
		.downArrow: UInt32(kVK_DownArrow),
		.upArrow: UInt32(kVK_UpArrow)
	]

	public init?(string: String) {
		let lcString = string.lowercased()
		
		//	Use the default init(rawValue: String) initializer for all non-camelCase keys
		
		if let key = Key(rawValue: lcString) {
			self = key
			
			return
		}
		
		//	Handle all alternative keys
		
		switch lcString {
			case "1": self = .one
			case "2": self = .two
			case "3": self = .three
			case "4": self = .four
			case "5": self = .five
			case "6": self = .six
			case "7": self = .seven
			case "8": self = .eight
			case "9": self = .nine
			case "0": self = .zero
			case "-": self = .minus
			case "=": self = .equal
			case "\"": self = .quote
			case ";": self = .semicolon
			case "\\": self = .backslash
			case ",": self = .comma
			case "/": self = .slash
			case ".": self = .period
			case "\r": self = .return
			case "\t": self = .tab
			case " ": self = .space
			default: return nil
		}
	}

	public init?(carbonKeyCode: UInt32) {
		self = Key.keyCodeToKeyMappings[carbonKeyCode]
	}
	
	public var carbonKeyCode: UInt32 {
		return Key.keyToKeyCodeMappings[self]!
	}
	
}
