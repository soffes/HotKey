# HotKey

[![Version](https://img.shields.io/github/release/soffes/HotKey.svg)](https://github.com/soffes/HotKey/releases)
[![Build Status](https://travis-ci.org/soffes/HotKey.svg?branch=master)](https://travis-ci.org/soffes/HotKey)
![Swift Version](https://img.shields.io/badge/swift-3.1-orange.svg)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

Simple global shortcuts in macOS. HotKey wraps the Carbon APIs for dealing with global hot keys to make it easy to use in Swift.


## Usage

Simply initlaize a `HotKey` with a key and modifiers:

```swift
// Setup hot key for ⌥⌘R
let hotKey = HotKey(key: .r, modifiers: [.command, .option])
```

This is a convenice initializer that creates a `KeyCombo` for you. You can also initialize with a Carbon key code and Carbon modifier flags if you’re feeling old school.

Now you can set the `keyDownHandler` and get callbacks for when your hot key is pressed:

```swift
hotKey.keyDownHandler = {
	print("Pressed at \(Date())")
}
```

You can also implement `hotKey.keyUpHandler` if you’d like.

You don’t need to think about when handlers are registered and unregistered. This all happens automatically based on the `HotKey` object’s lifecycle.


## Thanks

HotKey was heavily inspired by PTHotKey.
