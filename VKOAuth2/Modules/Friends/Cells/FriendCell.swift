//
// FriendCell.swift
// VKOAuth2
//
// Created by Admin on 24.02.2021.
//

import UIKit
import SDWebImage

class FriendCell: UITableViewCell {
    
    static let identifier = "FriendCell"
    
    private var messageButtonTapped: (() -> ())?

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userOnlineView: UIView!
    @IBOutlet weak var messageButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.photoImageView.layer.cornerRadius = self.photoImageView.frame.height / 2
        self.photoImageView.clipsToBounds = true
        
        self.userOnlineView.clipsToBounds = true
        self.userOnlineView.layer.cornerRadius = self.userOnlineView.frame.height / 2
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func configure(with user: User, didTapMessageButton: (() -> ())? = nil) {
        self.nameLabel.text = "\(user.firstName) \(user.lastName)"
        self.photoImageView.sd_setImage(with: URL(string: user.photo200_Orig))
        
        self.userOnlineView.backgroundColor = user.online == 1 ? #colorLiteral(red: 0.1255238744, green: 0.8757286269, blue: 0, alpha: 1) : .systemGray2
        
        self.messageButtonTapped = didTapMessageButton
    }
    @IBAction func didTapMessageButton(_ sender: Any) {
        messageButtonTapped?()
    }
}
