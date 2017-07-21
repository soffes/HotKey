//
//  HotKeysController.swift
//  HotKey
//
//  Created by Sam Soffes on 7/21/17.
//  Copyright © 2017 Sam Soffes. All rights reserved.
//

import Carbon

final class HotKeysController {

	// MARK: - Types

	final class HotKeyBox {
		weak var hotKey: HotKey?
		let carbonHotKeyID: UInt32
		var carbonEventHotKey: EventHotKeyRef?

		init(hotKey: HotKey, carbonHotKeyID: UInt32) {
			self.hotKey = hotKey
			self.carbonHotKeyID = carbonHotKeyID
		}
	}


	// MARK: - Properties

	static var hotKeys = [UInt32: HotKeyBox]()
	static private var hotKeysCount: UInt32 = 0

	static let eventHotKeySignature: UInt32 = {
		let string = "SSHk"
		var result: FourCharCode = 0
		for char in string.utf16 {
			result = (result << 8) + FourCharCode(char)
		}
		return result
	}()

	private static let eventSpec = [
		EventTypeSpec(eventClass: OSType(kEventClassKeyboard), eventKind: UInt32(kEventHotKeyPressed)),
		EventTypeSpec(eventClass: OSType(kEventClassKeyboard), eventKind: UInt32(kEventHotKeyReleased))
	]

	private static var eventHandler: EventHandlerRef?


	// MARK: - Registration

	static func register(_ hotKey: HotKey) {
		// Increment the count which will become out next ID
		hotKeysCount += 1

		// Create a box for our metadata and weak HotKey
		let box = HotKeyBox(hotKey: hotKey, carbonHotKeyID: hotKeysCount)
		hotKeys[box.carbonHotKeyID] = box

		// Register with the system
		var eventHotKey: EventHotKeyRef?
		let hotKeyID = EventHotKeyID(signature: eventHotKeySignature, id: box.carbonHotKeyID)
		let registerError = RegisterEventHotKey(
			hotKey.keyCombo.carbonKeyCode,
			hotKey.keyCombo.carbonModifiers,
			hotKeyID,
			GetEventDispatcherTarget(),
			0,
			&eventHotKey
		)

		// Ensure registration worked
		guard registerError == noErr, eventHotKey != nil else {
			return
		}

		box.carbonEventHotKey = eventHotKey

		updateEventHandler()
	}

	static func unregister(_ hotKey: HotKey) {
		guard let box = self.box(for: hotKey) else {
			return
		}

		UnregisterEventHotKey(box.carbonEventHotKey)

		box.hotKey = nil
		hotKeys.removeValue(forKey: box.carbonHotKeyID)
	}


	// MARK: - Events

	static func sendCarbonEvent(_ event: EventRef?) -> OSStatus {
		guard let event = event else {
			return OSStatus(eventNotHandledErr)
		}

		var hotKeyID = EventHotKeyID()
		let error = GetEventParameter(
			event,
			UInt32(kEventParamDirectObject),
			UInt32(typeEventHotKeyID),
			nil,
			MemoryLayout<EventHotKeyID>.size,
			nil,
			&hotKeyID
		)

		if error != noErr {
			return error
		}
		
		guard hotKeyID.signature == eventHotKeySignature,
			let hotKey = self.hotKey(for: hotKeyID.id)
		else {
			return OSStatus(eventNotHandledErr)
		}

		switch GetEventKind(event) {
		case UInt32(kEventHotKeyPressed):
			hotKey.keyDownHandler?()
		case UInt32(kEventHotKeyReleased):
			hotKey.keyUpHandler?()
		default:
			return OSStatus(eventNotHandledErr)
		}

		return noErr
	}

	private static func updateEventHandler() {
		if hotKeysCount == 0 || eventHandler != nil {
			return
		}

		let eventSpec = [
			EventTypeSpec(eventClass: OSType(kEventClassKeyboard), eventKind: UInt32(kEventHotKeyPressed)),
			EventTypeSpec(eventClass: OSType(kEventClassKeyboard), eventKind: UInt32(kEventHotKeyReleased))
		]

		InstallEventHandler(GetEventDispatcherTarget(), hotKeyEventHandler, 2, eventSpec, nil, &eventHandler)
	}


	// MARK: - Querying

	private static func hotKey(for carbonHotKeyID: UInt32) -> HotKey? {
		if let hotKey = hotKeys[carbonHotKeyID]?.hotKey {
			return hotKey
		}

		hotKeys.removeValue(forKey: carbonHotKeyID)
		return nil
	}

	private static func box(for hotKey: HotKey) -> HotKeyBox? {
		for box in hotKeys.values {
			if box.hotKey === hotKey {
				return box
			}
		}

		return nil
	}
}


private func hotKeyEventHandler(eventHandlerCall: EventHandlerCallRef?, event: EventRef?, userData: UnsafeMutableRawPointer?) -> OSStatus {
	return HotKeysController.sendCarbonEvent(event)
}
