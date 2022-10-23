//
//  SubscribeTableViewCell.swift
//  Instagram
//
//  Created by Aleksandr Dorofeev on 23.10.2022.
//

import UIKit

/// Action cell with subscribe.
final class SubscribeTableViewCell: UITableViewCell {
  
  // MARK: - Private @IBOutlet.
  @IBOutlet private weak var avatarImageView: UIImageView!
  @IBOutlet private weak var textContentLabel: UILabel!
  @IBOutlet private weak var subscribeButton: UIButton!
  @IBOutlet private weak var mySubscribeButton: UIButton!

  // MARK: - Public methods
  func configure(model: ActionContent) {
    textContentLabel.attributedText = NSMutableAttributedString()
      .bold("\(model.userName)")
      .normal("\(model.content)")
      .normalGray("\(model.time)")
    avatarImageView.image = UIImage(named: model.avatarImageName)
    if model.isSubscribe ?? true {
      subscribeButton.isHidden = true
      mySubscribeButton.isHidden = false
    } else {
      subscribeButton.isHidden = false
      mySubscribeButton.isHidden = true
    }
  }
}
