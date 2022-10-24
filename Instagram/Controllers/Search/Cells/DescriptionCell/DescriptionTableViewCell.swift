//
//  DescriptionTableViewCell.swift
//  Instagram
//
//  Created by Aleksandr Dorofeev on 24.10.2022.
//

import UIKit

/// Cell with description profile info.
final class DescriptionTableViewCell: UITableViewCell {
  
  // MARK: - Private @IBOutlet.
  @IBOutlet private weak var profileNameLabel: UILabel!
  @IBOutlet private weak var typeOfProfileLabel: UILabel!
  @IBOutlet private weak var descriptionInfoLabel: UILabel!
  @IBOutlet private weak var similarSubscriptionLabel: UILabel!
  @IBOutlet private weak var subscribeButton: UIButton!
  @IBOutlet private weak var writeButton: UIButton!
  @IBOutlet private weak var moreInfoButton: UIButton!
  
  // MARK: - Public methods.
  func configureCell(profileDescription: ProfileDescription) {
    profileNameLabel.text = profileDescription.profileName
    typeOfProfileLabel.text = profileDescription.typeOfAccountText
    descriptionInfoLabel.text = profileDescription.descriptionText
    similarSubscriptionLabel.text = profileDescription.sameSubscribesText
  }
}
