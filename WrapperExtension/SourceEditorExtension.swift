//
//  SourceEditorExtension.swift
//  WrapperExtension
//
//  Created by Alan Zeino on 7/25/17.
//  Copyright © 2017 Alan Zeino. All rights reserved.
//

import Foundation
import XcodeKit

class SourceEditorExtension: NSObject, XCSourceEditorExtension {
    
    var commandDefinitions: [[XCSourceEditorCommandDefinitionKey: Any]] {
        let wrapSwiftVersion = [
            XCSourceEditorCommandDefinitionKey.identifierKey: "WrapSwiftVersion",
            XCSourceEditorCommandDefinitionKey.nameKey: "Wrap text in Swift Version #ifdef",
            XCSourceEditorCommandDefinitionKey.classNameKey: NSStringFromClass(SwiftVersionSourceEditorCommand.self)
        ]
        return [
            wrapSwiftVersion
        ]
    }
    
}
