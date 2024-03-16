//
//  Character.swift
//  SideMenuBarStoryBoard
//
//  Created by Le Hoang Long on 15/03/2024.
//

import Foundation
import UIKit

struct Character {
    let title: String
    let largeCharacterImg: UIImage?
    let characterInfo: CharacterInfo
    let weaponInfo: WeaponInfo
    let localSpecialtyInfo: LocalSpecialtyInfo
    let levelUpMaterialInfo: LevelUpMaterialInfo
    let enhancementMaterialInfo: EnhancementMaterialInfo
}

struct CharacterInfo {
    let image: UIImage?
    let name: String
}

struct WeaponInfo {
    let image: UIImage?
    let name: String
}

struct LocalSpecialtyInfo {
    let image: UIImage?
    let name: String
}

struct LevelUpMaterialInfo {
    let image: UIImage?
    let name: String
}

struct EnhancementMaterialInfo {
    let image: UIImage?
    let name: String
}

