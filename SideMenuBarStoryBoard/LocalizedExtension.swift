//
//  LocalizedExtension.swift
//  SideMenuBarStoryBoard
//
//  Created by Le Hoang Long on 16/03/2024.
//

import Foundation

extension String {
    func localized() -> String {
        return NSLocalizedString(
            self,
            tableName: "Localizable",
            bundle: .main,
            value: self,
            comment: self
        )
    }
}
