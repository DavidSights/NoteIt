//
//  DLog.swift
//  noteIt
//
//  Created by David Seitz Jr on 10/27/15.
//  Copyright © 2015 Vokal. All rights reserved.
//

import Foundation

func DLog(@autoclosure message: () -> String,
    filename: String = __FILE__,
    function: String = __FUNCTION__,
    line: Int = __LINE__) {
        #if DEBUG
            detailedLog(message(), filename, function, line)
        #else

        #endif
}

func ALog(message: String,
    filename: String = __FILE__,
    function: String = __FUNCTION__,
    line: Int = __LINE__) {
    detailedLog(message, filename, function, line)
}

/**
Centralizes the detailed message formatting into a single method.

- parameter message:  The message to print
- parameter filename: The filename of the original caller.
- parameter function: The function of the original caller
- parameter line:     the line number of the original caller.
*/

private func detailedLog(message: String, _ filename: String, _ function: String, _ line: Int) {
        print("[\(filename.dlog_lastPathComponent()):\(line)] \(function) - \(message)")
}

private extension String {
    func dlog_lastPathComponent() -> String {
        return (self as NSString).lastPathComponent
    }
}
