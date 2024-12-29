# HotKey

[![Version](https://img.shields.io/github/release/soffes/HotKey.svg)](https://github.com/soffes/HotKey/releases)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![CocoaPods compatible](https://img.shields.io/cocoapods/v/HotKey.svg)](https://cocoapods.org/pods/HotKey)

Simple global shortcuts in macOS. HotKey wraps the Carbon APIs for dealing with global hot keys to make it easy to use in Swift.

## Installation

### Swift Package Manager

For installation with [Swift Package Manager](https://github.com/apple/swift-package-manager), simply add the following to your `Package.swift`:

``` swift
.package(url: "https://github.com/soffes/HotKey", from: "0.2.1")
```

### Carthage

For installation with [Carthage](https://github.com/carthage/carthage), simply add the following to your `Cartfile`:

``` ruby
github "soffes/HotKey"
```

### CocoaPods

For installation with [CocoaPods](http://cocoapods.org), simply add the following to your `Podfile`:

```ruby
pod 'HotKey'
```

## Usage

Simply initialize a `HotKey` with a key and modifiers:

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
