//
//  String+Extension.swift
//  Instagram
//
//  Created by Aleksandr Dorofeev on 23.10.2022.
//

import UIKit

/// Capitalized string extension.
extension String {
    var capitalized: String {
        let firstLetter = self.prefix(1).capitalized
        let remaindingLetters = self.dropFirst().lowercased()
        return firstLetter + remaindingLetters
    }
}
