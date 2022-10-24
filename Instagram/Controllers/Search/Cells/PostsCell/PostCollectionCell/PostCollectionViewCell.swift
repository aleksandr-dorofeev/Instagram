//
//  PostCollectionViewCell.swift
//  Instagram
//
//  Created by Aleksandr Dorofeev on 24.10.2022.
//

import UIKit

/// Cell for post collection view.
final class PostCollectionViewCell: UICollectionViewCell {
  
  // MARK: - Private @IBOutlet.
  @IBOutlet private weak var postImageView: UIImageView!
  
  // MARK: - Public Methods.
  func configureCell(post: Post?) {
      guard let secureImageName = post?.postImageName else { return }
      postImageView.image = UIImage(named: secureImageName)
  }
}
