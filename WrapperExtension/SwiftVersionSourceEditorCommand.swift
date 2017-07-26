//
//  SwiftVersionSourceEditorCommand.swift
//  WrapperExtension
//
//  Created by Alan Zeino on 7/25/17.
//  Copyright © 2017 Alan Zeino. All rights reserved.
//

import Foundation
import XcodeKit

class SwiftVersionSourceEditorCommand: NSObject, XCSourceEditorCommand {

    func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void ) -> Void {
        guard invocation.buffer.contentUTI == "public.swift-source" else { completionHandler(nil); return }

        let selections = invocation.buffer.selections as! [XCSourceTextRange]
        let selection = selections.first!
        let startIndex = selection.start.line
        let endIndex = selection.end.line

        let selectedRange = NSRange(location: startIndex, length: endIndex - startIndex)
        let selectedLines = invocation.buffer.lines.subarray(with: selectedRange)

        invocation.buffer.lines.insert("#if swift(>=5.0)", at: startIndex)
        for string in selectedLines.reversed() {
            invocation.buffer.lines.insert(string, at: startIndex + 1)
        }
        invocation.buffer.lines.insert("#else", at: startIndex + selectedLines.count + 1)
        invocation.buffer.lines.insert("#endif", at: endIndex + selectedLines.count + 2)

        completionHandler(nil)
    }
    
}
