# HotKey

[![Version](https://img.shields.io/github/release/soffes/HotKey.svg)](https://github.com/soffes/HotKey/releases)
![Swift Version](https://img.shields.io/badge/swift-3.1-orange.svg)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

Simple global shortcuts in macOS. HotKey wraps the Carbon APIs for dealing with global hot keys to make it easy to use in Swift.


## Usage

Simply initlaize a `HotKey` with a `KeyCombo`:

```swift
let keyCombo = KeyCombo(carbonKeyCode: UInt32(kVK_ANSI_R), modifiers: [.command, .option])
let hotKey = HotKey(keyCombo: keyCombo)
```

Now you can get callbacks for when it is pressed:

```swift
hotKey.keyDownHandler = {
	print("Pressed at \(Date())")
}
```

You can also implement `hotKey.keyUpHandler` if you’d like.

You don’t need to think about when handlers are registered and unregistered. This all happens automatically based on the `HotKey` object’s lifecycle.


## Thanks

HotKey was heavily inspired by PTHotKey.
