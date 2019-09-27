import AppKit
import Carbon

extension KeyCombo {
    /// All system key combos
    ///
    /// - returns: array of key combos
    public static func systemKeyCombos() -> [KeyCombo] {
        var unmanagedGlobalHotkeys: Unmanaged<CFArray>?
        guard CopySymbolicHotKeys(&unmanagedGlobalHotkeys) == noErr,
            let globalHotkeys = unmanagedGlobalHotkeys?.takeRetainedValue() else
        {
            assertionFailure("Unable to get system-wide hotkeys")
            return []
        }

        return (0..<CFArrayGetCount(globalHotkeys)).compactMap { i in
            let hotKeyInfo = unsafeBitCast(CFArrayGetValueAtIndex(globalHotkeys, i), to: NSDictionary.self)
            guard (hotKeyInfo[kHISymbolicHotKeyEnabled] as? NSNumber)?.boolValue == true,
                let keyCode = (hotKeyInfo[kHISymbolicHotKeyCode] as? NSNumber)?.uint32Value,
                let modifiers = (hotKeyInfo[kHISymbolicHotKeyModifiers] as? NSNumber)?.uint32Value else
            {
                    return nil
            }

            let keyCombo = KeyCombo(carbonKeyCode: keyCode, carbonModifiers: modifiers)

            // Several of these aren’t valid key combos. Filter them out so consumers don’t have to think about this.
            return keyCombo.isValid ? keyCombo : nil
        }
    }

    /// All key combos in the application’s main window
    ///
    /// - returns: array of key combos
    public static func mainMenuKeyCombos() -> [KeyCombo] {
        guard let menu = NSApp.mainMenu else {
            return []
        }

        return keyCombos(in: menu)
    }

    /// Recursively find key combos in a menu
    ///
    /// - parameter menu: menu to search
    ///
    /// - returns: array of key combos
    public static func keyCombos(in menu: NSMenu) -> [KeyCombo] {
        var keyCombos = [KeyCombo]()

        for item in menu.items {
            if let key = Key(string: item.keyEquivalent) {
                keyCombos.append(KeyCombo(key: key, modifiers: item.keyEquivalentModifierMask))
            }

            if let submenu = item.submenu {
                keyCombos += self.keyCombos(in: submenu)
            }
        }

        return keyCombos
    }

    /// Standard application key combos
    ///
    /// - returns: array of key combos
    public static func standardKeyCombos() -> [KeyCombo] {
        return [
            // Application
            KeyCombo(key: .comma, modifiers: .command),
            KeyCombo(key: .h, modifiers: .command),
            KeyCombo(key: .h, modifiers: [.command, .option]),
            KeyCombo(key: .q, modifiers: .command),

            // File
            KeyCombo(key: .n, modifiers: .command),
            KeyCombo(key: .o, modifiers: .command),
            KeyCombo(key: .w, modifiers: .command),
            KeyCombo(key: .s, modifiers: .command),
            KeyCombo(key: .s, modifiers: [.command, .shift]),
            KeyCombo(key: .r, modifiers: .command),
            KeyCombo(key: .p, modifiers: [.command, .shift]),
            KeyCombo(key: .p, modifiers: .command),

            // Edit
            KeyCombo(key: .z, modifiers: .command),
            KeyCombo(key: .z, modifiers: [.command, .shift]),
            KeyCombo(key: .x, modifiers: .command),
            KeyCombo(key: .c, modifiers: .command),
            KeyCombo(key: .v, modifiers: .command),
            KeyCombo(key: .v, modifiers: [.command, .option, .shift]),
            KeyCombo(key: .a, modifiers: .command),
            KeyCombo(key: .f, modifiers: .command),
            KeyCombo(key: .f, modifiers: [.command, .option]),
            KeyCombo(key: .g, modifiers: .command),
            KeyCombo(key: .g, modifiers: [.command, .shift]),
            KeyCombo(key: .e, modifiers: .command),
            KeyCombo(key: .j, modifiers: .command),
            KeyCombo(key: .semicolon, modifiers: [.command, .shift]),
            KeyCombo(key: .semicolon, modifiers: .command),

            // Format
            KeyCombo(key: .t, modifiers: .command),
            KeyCombo(key: .b, modifiers: .command),
            KeyCombo(key: .i, modifiers: .command),
            KeyCombo(key: .u, modifiers: .command),
            KeyCombo(key: .equal, modifiers: [.command, .shift]),
            KeyCombo(key: .minus, modifiers: .command),
            KeyCombo(key: .c, modifiers: [.command, .shift]),
            KeyCombo(key: .c, modifiers: [.command, .option]),
            KeyCombo(key: .v, modifiers: [.command, .option]),
            KeyCombo(key: .leftBracket, modifiers: [.command, .shift]),
            KeyCombo(key: .backslash, modifiers: [.command, .shift]),
            KeyCombo(key: .rightBracket, modifiers: [.command, .shift]),
            KeyCombo(key: .c, modifiers: [.command, .control]),
            KeyCombo(key: .v, modifiers: [.command, .control]),

            // View
            KeyCombo(key: .t, modifiers: [.command, .option]),
            KeyCombo(key: .s, modifiers: [.command, .control]),
            KeyCombo(key: .f, modifiers: [.command, .control]),

            // Window
            KeyCombo(key: .m, modifiers: .command),

            // Help
            KeyCombo(key: .slash, modifiers: [.command, .shift])
        ]
    }
}
