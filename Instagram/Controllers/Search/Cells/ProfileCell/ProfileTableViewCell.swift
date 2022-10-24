//
//  ProfileTableViewCell.swift
//  Instagram
//
//  Created by Aleksandr Dorofeev on 24.10.2022.
//

import UIKit

/// Cell with main info profile.
final class ProfileTableViewCell: UITableViewCell {
  
  // MARK: - Private @IBOutlet.
  @IBOutlet private weak var profileImageView: UIImageView!
  @IBOutlet private weak var postsCountLabel: UILabel!
  @IBOutlet private weak var subscribesCountLabel: UILabel!
  @IBOutlet private weak var subscriptionsCountLabel: UILabel!
  
  // MARK: - Public methods.
  func configureCell(profileInfo: ProfileDescription) {
    profileImageView.image = UIImage(named: profileInfo.profileImageName)
    postsCountLabel.text = profileInfo.postsAmount
    subscribesCountLabel.text = profileInfo.subscribersAmount
    subscriptionsCountLabel.text = profileInfo.subscriptionsAmount
  }
}
