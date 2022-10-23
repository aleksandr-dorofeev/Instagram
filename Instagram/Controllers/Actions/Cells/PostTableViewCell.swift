//
//  PostTableViewCell.swift
//  Instagram
//
//  Created by Aleksandr Dorofeev on 23.10.2022.
//

import UIKit

/// Action cell with post.
final class PostTableViewCell: UITableViewCell {
  
  // MARK: - Private @IBOutlet.
  @IBOutlet private weak var avatarImageView: UIImageView!
  @IBOutlet private weak var contentTextLabel: UILabel!
  @IBOutlet private weak var postImageView: UIImageView!
  
  // MARK: - Public methods.
  func configure(model: ActionContent) {
    contentTextLabel.attributedText = NSMutableAttributedString()
      .bold("\(model.userName) ")
      .normal("\(model.content) ")
      .normalGray("\(model.time)")
    
    avatarImageView.image = UIImage(named: model.avatarImageName)
  }
}
