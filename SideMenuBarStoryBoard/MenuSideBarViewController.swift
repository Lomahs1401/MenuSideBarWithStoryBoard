//
//  MenuSibeBarViewController.swift
//  SideMenuBarStoryBoard
//
//  Created by Le Hoang Long on 14/03/2024.
//

import UIKit

protocol MenuSideBarViewControllerDelegate {
    func hideMenuSideBar()
}


class MenuSideBarViewController: UIViewController {
    
    var delegate: MenuSideBarViewControllerDelegate?
    
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var userImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        userImg.backgroundColor = UIColor(red: 224/255, green: 234/255, blue: 245/255, alpha: 1.0)
        userImg.layer.cornerRadius = userImg.bounds.height / 2
        userImg.clipsToBounds = true
        
        // Thêm màu viền cho ảnh
        let borderLayer = CAShapeLayer()
        borderLayer.path = UIBezierPath(ovalIn: userImg.bounds).cgPath
        borderLayer.fillColor = UIColor.clear.cgColor
        borderLayer.strokeColor = UIColor.white.cgColor // Màu viền
        borderLayer.lineWidth = 2 // Độ dày của viền
        
        userImg.layer.addSublayer(borderLayer)
    }
    
    @IBAction func didTappedButton(_ sender: UIButton) {
        self.delegate?.hideMenuSideBar()
    }
}
