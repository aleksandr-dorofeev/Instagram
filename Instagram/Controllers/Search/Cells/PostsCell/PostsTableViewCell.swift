//
//  PostsTableViewCell.swift
//  Instagram
//
//  Created by Aleksandr Dorofeev on 24.10.2022.
//

import UIKit

/// Cell with posts collection.
final class PostsTableViewCell: UITableViewCell {
  
  // MARK: - Private Constants.
  private enum Identifiers {
    static let postCellNibName = "PostCollectionViewCell"
    static let postCollectionCellID = "PostCell"
  }
  
  // MARK: - Private @IBOutlet.
  @IBOutlet private weak var postsCollectionView: UICollectionView!
  
  // MARK: - Private properties.
  private var postsCollection: [Post]?
  
  // MARK: - Life cycle.
  override func awakeFromNib() {
    super.awakeFromNib()
    registerCells()
  }
  
  // MARK: - Public methods.
  func configureCell(postsCollections: [Post], viewHight: CGFloat) {
    self.postsCollection = postsCollections
    postsCollectionView.translatesAutoresizingMaskIntoConstraints = false
    postsCollectionView.heightAnchor.constraint(
      equalToConstant: viewHight).isActive = true
  }
  
  // MARK: - Private methods.
  private func registerCells() {
    postsCollectionView.dataSource = self
    postsCollectionView.register(
      UINib(nibName: Identifiers.postCellNibName, bundle: nil),
      forCellWithReuseIdentifier: Identifiers.postCollectionCellID)
  }
}

extension PostsTableViewCell: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return postsCollection?.count ?? 0
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      guard let postCell = collectionView.dequeueReusableCell(
        withReuseIdentifier: Identifiers.postCollectionCellID,
          for: indexPath) as? PostCollectionViewCell
      else {
          return UICollectionViewCell()
      }
      postCell.configureCell(post: postsCollection?[indexPath.row])
      return postCell
  }
}
