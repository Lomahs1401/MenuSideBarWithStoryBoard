//
//  CharacterTableViewCell.swift
//  SideMenuBarStoryBoard
//
//  Created by Le Hoang Long on 15/03/2024.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var characterView: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var largeCharacterImg: UIImageView!
    @IBOutlet weak var characterImg: UIImageView!
    @IBOutlet weak var characterName: UILabel!
    @IBOutlet weak var weaponImg: UIImageView!
    @IBOutlet weak var weaponName: UILabel!
    @IBOutlet weak var localSpecialtyImg: UIImageView!
    @IBOutlet weak var localSpecialtyName: UILabel!
    @IBOutlet weak var levelUpMaterialImg: UIImageView!
    @IBOutlet weak var levelUpMaterialName: UILabel!
    @IBOutlet weak var enhancementMaterialImg: UIImageView!
    @IBOutlet weak var enhancementMaterialName: UILabel!
    
    static let identifier = "CharacterTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupView()
    }
    
    private func setupView() {
        // Corner round image
        characterView.layer.cornerRadius = 16
        // add shadow
        characterView.layer.shadowColor = UIColor.black.cgColor
        characterView.layer.shadowOpacity = 0.5
        characterView.layer.shadowOffset = CGSize(width: 4, height: 4)
        characterView.layer.shadowRadius = 5.0
        characterView.layer.masksToBounds = false
        characterView.clipsToBounds = true
        
        // Thêm màu viền cho CharacterImg
        let borderLayerCharacterImg = CAShapeLayer()
        borderLayerCharacterImg.path = UIBezierPath(ovalIn: characterImg.bounds).cgPath
        borderLayerCharacterImg.fillColor = UIColor.clear.cgColor
        borderLayerCharacterImg.strokeColor = UIColor.white.cgColor // Màu viền
        borderLayerCharacterImg.lineWidth = 2 // Độ dày của viền
        
        characterImg.layer.addSublayer(borderLayerCharacterImg)
        characterImg.layer.cornerRadius = characterImg.bounds.height / 2
        characterImg.clipsToBounds = true
        
        // Thêm màu viền cho WeaponImg
        let borderLayerWeaponImg = CAShapeLayer()
        borderLayerWeaponImg.path = UIBezierPath(ovalIn: weaponImg.bounds).cgPath
        borderLayerWeaponImg.fillColor = UIColor.clear.cgColor
        borderLayerWeaponImg.strokeColor = UIColor.white.cgColor // Màu viền
        borderLayerWeaponImg.lineWidth = 2 // Độ dày của viền
        
        weaponImg.layer.addSublayer(borderLayerWeaponImg)
        weaponImg.layer.cornerRadius = weaponImg.bounds.height / 2
        weaponImg.clipsToBounds = true
        
        // Thêm màu viền cho LocalSpecialtyImg
        let borderLayerLocalSpecialtyImg = CAShapeLayer()
        borderLayerLocalSpecialtyImg.path = UIBezierPath(ovalIn: localSpecialtyImg.bounds).cgPath
        borderLayerLocalSpecialtyImg.fillColor = UIColor.clear.cgColor
        borderLayerLocalSpecialtyImg.strokeColor = UIColor.white.cgColor // Màu viền
        borderLayerLocalSpecialtyImg.lineWidth = 2 // Độ dày của viền
        
        localSpecialtyImg.layer.addSublayer(borderLayerLocalSpecialtyImg)
        localSpecialtyImg.layer.cornerRadius = localSpecialtyImg.bounds.height / 2
        localSpecialtyImg.clipsToBounds = true
        
        // Thêm màu viền cho LevelUpMaterialImg
        let borderLayerLevelUpMaterialImg = CAShapeLayer()
        borderLayerLevelUpMaterialImg.path = UIBezierPath(ovalIn: levelUpMaterialImg.bounds).cgPath
        borderLayerLevelUpMaterialImg.fillColor = UIColor.clear.cgColor
        borderLayerLevelUpMaterialImg.strokeColor = UIColor.white.cgColor // Màu viền
        borderLayerLevelUpMaterialImg.lineWidth = 2 // Độ dày của viền
        
        levelUpMaterialImg.layer.addSublayer(borderLayerLevelUpMaterialImg)
        levelUpMaterialImg.layer.cornerRadius = levelUpMaterialImg.bounds.height / 2
        levelUpMaterialImg.clipsToBounds = true
        
        // Thêm màu viền cho EnhancementMaterialImg
        let borderLayerEnhancementMaterialImg = CAShapeLayer()
        borderLayerEnhancementMaterialImg.path = UIBezierPath(ovalIn: enhancementMaterialImg.bounds).cgPath
        borderLayerEnhancementMaterialImg.fillColor = UIColor.clear.cgColor
        borderLayerEnhancementMaterialImg.strokeColor = UIColor.white.cgColor // Màu viền
        borderLayerEnhancementMaterialImg.lineWidth = 2 // Độ dày của viền
        
        enhancementMaterialImg.layer.addSublayer(borderLayerEnhancementMaterialImg)
        enhancementMaterialImg.layer.cornerRadius = enhancementMaterialImg.bounds.height / 2
        enhancementMaterialImg.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
