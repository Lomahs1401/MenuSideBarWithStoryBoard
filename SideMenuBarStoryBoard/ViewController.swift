//
//  ViewController.swift
//  SideMenuBarStoryBoard
//
//  Created by Le Hoang Long on 14/03/2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var topMainView: UIView!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var layerView: UIView!
    @IBOutlet weak var menuSideBarView: UIView!
    @IBOutlet weak var leadingConstraintMenuSideBar: NSLayoutConstraint!
    
    var menuSideBarVC: MenuSideBarViewController?
    var characters: [Character] = []
    private var isMenuSideBarShown: Bool = false
    private var beginPoint: CGFloat = 0.0
    private var difference: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        characters = createListCharacters()
        
        menuSideBarView.isHidden = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "menuSideBarSegue") {
            if let menuSideBarVC = segue.destination as? MenuSideBarViewController {
                self.menuSideBarVC = menuSideBarVC
                self.menuSideBarVC?.delegate = self
            }
        }
    }
    
    @IBAction func showMenu(_ sender: UIButton) {
        self.menuSideBarView.isHidden = false
        
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseIn) {
            self.leadingConstraintMenuSideBar.constant = 0
            self.view.layoutIfNeeded()
        } completion: { [weak self] done in
            if done {
                self?.layerView.alpha = 0.6
                self?.layerView.isHidden = false
                self?.isMenuSideBarShown = true
            }
        }
    }
    
    private func hideMenu() {
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseOut) {
            self.leadingConstraintMenuSideBar.constant = -280
            self.view.layoutIfNeeded()
        } completion: { [weak self] done in
            if done {
                self?.layerView.alpha = 0
                self?.layerView.isHidden = true
                self?.isMenuSideBarShown = false
                self?.menuSideBarView.isHidden = true
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (isMenuSideBarShown) {
            if let touch = touches.first {
                let location = touch.location(in: layerView)
                beginPoint = location.x
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (isMenuSideBarShown) {
            if let touch = touches.first {
                let location = touch.location(in: layerView)
                let differenceFromBeginPoint = beginPoint - location.x
                
                if (differenceFromBeginPoint > 0 && differenceFromBeginPoint < 280) {
                    leadingConstraintMenuSideBar.constant = -differenceFromBeginPoint
                    difference = differenceFromBeginPoint
                    self.layerView.alpha = 0.6-(0.6*differenceFromBeginPoint/280)
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (isMenuSideBarShown) {
            if (difference < 140) {
                // Keep menu
                UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseIn) {
                    self.leadingConstraintMenuSideBar.constant = 0
                    self.view.layoutIfNeeded()
                } completion: { [weak self] done in
                    if done {
                        self?.layerView.isHidden = false
                        self?.layerView.alpha = 0.6
                        self?.isMenuSideBarShown = true
                    }
                }
            } else {
                // Close menu
                UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseOut) {
                    self.leadingConstraintMenuSideBar.constant = -280
                    self.view.layoutIfNeeded()
                } completion: { [weak self] done in
                    if done {
                        self?.layerView.isHidden = true
                        self?.layerView.alpha = 0.0
                        self?.isMenuSideBarShown = false
                    }
                }
            }
        }
    }
    
    
    @IBAction func tappedOnMenuSideBar(_ sender: Any) {
        hideMenuSideBar()
    }
    
    private func createListCharacters() -> [Character] {
        var listCharacters: [Character] = []
        
        // MONDSTADT
        let jean = Character(
            title: "Kỵ Sĩ Bồ Công Anh・Jean",
            largeCharacterImg: UIImage(named: "jean"),
            characterInfo: CharacterInfo(image: UIImage(named: "jean"), name: "Jean"),
            weaponInfo: WeaponInfo(image: UIImage(named: "tayphongkiem"), name: "Tây Phong Kiếm"),
            localSpecialtyInfo: LocalSpecialtyInfo(image: UIImage(named: "hatboconganh"), name: "Hạt Bồ Công Anh"),
            levelUpMaterialInfo: LevelUpMaterialInfo(image: UIImage(named: "hatgiongbao"), name: "Hạt Giống Bão"),
            enhancementMaterialInfo: EnhancementMaterialInfo(image: UIImage(named: "matnaxuixeo"), name: "Mặt Nạ Xui Xẻo")
        )
        
        let diluc = Character(
            title: "Mặt Tối Của Bình Minh・Diluc",
            largeCharacterImg: UIImage(named: "diluc"),
            characterInfo: CharacterInfo(image: UIImage(named: "diluc"), name: "Diluc"),
            weaponInfo: WeaponInfo(image: UIImage(named: "duongcungcuasoi"), name: "Đường Cùng Của Sói"),
            localSpecialtyInfo: LocalSpecialtyInfo(image: UIImage(named: "tieudangthao"), name: "Tiểu Đăng Thảo"),
            levelUpMaterialInfo: LevelUpMaterialInfo(image: UIImage(named: "ngonluavinhhang"), name: "Ngọn Lửa Vĩnh Hằng"),
            enhancementMaterialInfo: EnhancementMaterialInfo(image: UIImage(named: "phuhieuhieuuy"), name: "Phù Hiệu Hiệu Úy")
        )
        
        let eula = Character(
            title: "Vũ Điệu Bọt Biển・Eula",
            largeCharacterImg: UIImage(named: "eula"),
            characterInfo: CharacterInfo(image: UIImage(named: "eula"), name: "Eula"),
            weaponInfo: WeaponInfo(image: UIImage(named: "tienggiotrongrungthong"), name: "Tiếng Gió Trong Rừng Thông"),
            localSpecialtyInfo: LocalSpecialtyInfo(image: UIImage(named: "hatboconganh"), name: "Hạt Bồ Công Anh"),
            levelUpMaterialInfo: LevelUpMaterialInfo(image: UIImage(named: "tinhhoangungket"), name: "Tinh Hoa Ngưng Kết"),
            enhancementMaterialInfo: EnhancementMaterialInfo(image: UIImage(named: "matnaxuixeo"), name: "Mặt Nạ Xui Xẻo")
        )
        
        let albedo = Character(
            title: "Kreideprinz・Albedo",
            largeCharacterImg: UIImage(named: "albedo"),
            characterInfo: CharacterInfo(image: UIImage(named: "albedo"), name: "Albedo"),
            weaponInfo: WeaponInfo(image: UIImage(named: "conthoichusa"), name: "Con Thoi Chu Sa"),
            localSpecialtyInfo: LocalSpecialtyInfo(image: UIImage(named: "cecilia"), name: "Hoa Cecilia"),
            levelUpMaterialInfo: LevelUpMaterialInfo(image: UIImage(named: "thaphuyennham"), name: "Tháp Huyền Nham"),
            enhancementMaterialInfo: EnhancementMaterialInfo(image: UIImage(named: "banvecamchu"), name: "Bản Vẽ Cấm Chú")
        )
        
        let mona = Character(
            title: "Thủy Kính Thiên Tinh・Mona",
            largeCharacterImg: UIImage(named: "mona"),
            characterInfo: CharacterInfo(image: UIImage(named: "mona"), name: "Mona"),
            weaponInfo: WeaponInfo(image: UIImage(named: "tayphongmatdien"), name: "Tây Phong Mật Điển"),
            localSpecialtyInfo: LocalSpecialtyInfo(image: UIImage(named: "namromgio"), name: "Nấm Rơm Gió"),
            levelUpMaterialInfo: LevelUpMaterialInfo(image: UIImage(named: "traitimthuankhiet"), name: "Trái Tim Thuần Khiết"),
            enhancementMaterialInfo: EnhancementMaterialInfo(image: UIImage(named: "mathoanguyento"), name: "Mật Hoa Nguyên Tố")
        )
        
        let venti = Character(
            title: "Nhà Thơ Có Màu Của Gió・Venti",
            largeCharacterImg: UIImage(named: "venti"),
            characterInfo: CharacterInfo(image: UIImage(named: "venti"), name: "Venti"),
            weaponInfo: WeaponInfo(image: UIImage(named: "tiengthodaivotan"), name: "Tiếng Thở Dài Vô Tận"),
            localSpecialtyInfo: LocalSpecialtyInfo(image: UIImage(named: "cecilia"), name: "Hoa Cecilia"),
            levelUpMaterialInfo: LevelUpMaterialInfo(image: UIImage(named: "hatgiongbao"), name: "Hạt Giống Bão"),
            enhancementMaterialInfo: EnhancementMaterialInfo(image: UIImage(named: "botslime"), name: "Bột Slime")
        )
        
        listCharacters.append(jean)
        listCharacters.append(diluc)
        listCharacters.append(eula)
        listCharacters.append(albedo)
        listCharacters.append(mona)
        listCharacters.append(venti)
        
        // LIYUE
        
        // INAZUMA
        
        let chiori = Character(
            title: "Nhà Thiết Kế Sấm Chớp・Chiori",
            largeCharacterImg: UIImage(named: "chiori"),
            characterInfo: CharacterInfo(image: UIImage(named: "chiori"), name: "Chiori"),
            weaponInfo: WeaponInfo(image: UIImage(named: "urakumisugiri"), name: "Uraku Misugiri"),
            localSpecialtyInfo: LocalSpecialtyInfo(image: UIImage(named: "hoalanmau"), name: "Hoa Lan Máu"),
            levelUpMaterialInfo: LevelUpMaterialInfo(image: UIImage(named: "Coppelia"), name: "Linh Kiện Dây Cót - Coppelia"),
            enhancementMaterialInfo: EnhancementMaterialInfo(image: UIImage(named: "hatbayluonkettinh"), name: "Hạt Bay Lượn Kết Tinh")
        )
        
        // Tạo một đối tượng Character mới
        let aratakiItto = Character(
            title: "Quái Kiệt Hanamizaka・Arataki Itto",
            largeCharacterImg: UIImage(named: "aratakiitto"),
            characterInfo: CharacterInfo(image: UIImage(named: "aratakiitto"), name: "Arataki Itto"),
            weaponInfo: WeaponInfo(image: UIImage(named: "xichgiacphathachdao"), name: "Xích Giác Phá Thạch Đao"),
            localSpecialtyInfo: LocalSpecialtyInfo(image: UIImage(named: "onikabuto"), name: "Onikabuto"),
            levelUpMaterialInfo: LevelUpMaterialInfo(image: UIImage(named: "sungvuaquaicanh"), name: "Sừng Vua Quái Cảnh"),
            enhancementMaterialInfo: EnhancementMaterialInfo(image: UIImage(named: "botslime"), name: "Bột Slime")
        )
        
        listCharacters.append(aratakiItto)
        listCharacters.append(chiori)
        
        // SUMERU
        
        // FONTAINE
        
        return listCharacters
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.identifier, for: indexPath) as! CharacterTableViewCell
        
        cell.title.text = characters[indexPath.row].title
        cell.largeCharacterImg.image = characters[indexPath.row].largeCharacterImg
        
        cell.characterImg.image = characters[indexPath.row].characterInfo.image
        cell.characterName.text = characters[indexPath.row].characterInfo.name
        
        cell.weaponImg.image = characters[indexPath.row].weaponInfo.image
        cell.weaponName.text = characters[indexPath.row].weaponInfo.name
        
        cell.localSpecialtyImg.image = characters[indexPath.row].localSpecialtyInfo.image
        cell.localSpecialtyName.text = characters[indexPath.row].localSpecialtyInfo.name
        
        cell.levelUpMaterialImg.image = characters[indexPath.row].levelUpMaterialInfo.image
        cell.levelUpMaterialName.text = characters[indexPath.row].levelUpMaterialInfo.name
        
        cell.enhancementMaterialImg.image = characters[indexPath.row].enhancementMaterialInfo.image
        cell.enhancementMaterialName.text = characters[indexPath.row].enhancementMaterialInfo.name
        
        return cell
    }
}

extension ViewController: MenuSideBarViewControllerDelegate {
    func hideMenuSideBar() {
        self.hideMenu()
    }
}

