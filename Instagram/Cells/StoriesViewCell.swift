//
//  StoriesViewCell.swift
//  Instagram
//
//  Created by Aleksandr Dorofeev on 19.10.2022.
//

import UIKit

/// StoryCell configuration.
final class StoriesViewCell: UITableViewCell {
  
  // MARK: - Private Constants.
  private enum Constants {
    static let colorGradient = "Gradient"
  }
  
  // MARK: - Private Visual components.
  @IBOutlet private var storyImages: [UIImageView]!
  
  // MARK: - Life cycle.
    override func awakeFromNib() {
        super.awakeFromNib()
      setupUI()
    }
  
  // MARK: - Setup UI.
  private func setupUI() {
    setupBorderForStoryImages()
  }
  
  private func setupBorderForStoryImages() {
    for image in storyImages {
      image.layer.borderWidth = 2
      image.layer.borderColor = UIColor(named: Constants.colorGradient)?.cgColor
    }
  }
}
