//
//  HighlightesCollectionViewCell.swift
//  Instagram
//
//  Created by Aleksandr Dorofeev on 24.10.2022.
//

import UIKit

/// Collection cell for highlight info.
final class HighlightesCollectionViewCell: UICollectionViewCell {
  
  // MARK: - Private Constants.
  private enum Constants {
    static let borderColor = "Gray"
  }
  
  // MARK: - Private @IBOutlet.
  @IBOutlet private weak var highlightImageView: UIImageView!
  @IBOutlet private weak var nameHighlightLabel: UILabel!
  
  // MARK: - Public methods.
  func configureCell(highlightItem: ProfileHighlight?) {
      guard
        let secureHighlightImageName = highlightItem?.highlightImageName,
        let secureHighlightName = highlightItem?.highlightName
      else { return }
    highlightImageView.image = UIImage(named: secureHighlightImageName)
    nameHighlightLabel.text = secureHighlightName
    highlightImageView.layer.borderColor = UIColor(named: Constants.borderColor)?.cgColor
    highlightImageView.layer.borderWidth = 2
  }
}
