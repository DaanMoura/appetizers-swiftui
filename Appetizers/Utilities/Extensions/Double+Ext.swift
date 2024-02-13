//
//  Double+Ext.swift
//  Appetizers
//
//  Created by Daniel Moura on 12/02/24.
//

import Foundation

extension Double {
    /// Format the given value as money.
    /// For example: 19.9 -> $19.90
    var asMoney: String {
        "$\(self.formatted(.currency(code: "")))"
    }
}
