//
//  HighlightsTableViewCell.swift
//  Instagram
//
//  Created by Aleksandr Dorofeev on 24.10.2022.
//

import UIKit

/// Cell with highlights sections.
final class HighlightsTableViewCell: UITableViewCell {
  
  // MARK: - Private Constants.
  private enum Identifiers {
    static let highlightNibName = "HighlightesCollectionViewCell"
    static let highlightCellID = "HighlightsCell"
  }
  
  // MARK: - Public properties.
  private var profileHighlights: [ProfileHighlight]?
  
  // MARK: - Private @IBOutlet.
  @IBOutlet private weak var highlightsCollectionView: UICollectionView!
  
  // MARK: - Life cycle.
  override func awakeFromNib() {
    super.awakeFromNib()
    registerCells()
  }
  
  // MARK: - Public methods.
  func configureCell(profileHighlights: [ProfileHighlight]) {
    self.profileHighlights = profileHighlights
  }
  
  // MARK: - Private methods.
  private func registerCells() {
    highlightsCollectionView.dataSource = self
    highlightsCollectionView.register(
      UINib(nibName: Identifiers.highlightNibName, bundle: nil),
      forCellWithReuseIdentifier: Identifiers.highlightCellID)
  }
}

extension HighlightsTableViewCell: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView,
                      numberOfItemsInSection section: Int) -> Int {
    return profileHighlights?.count ?? 0
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let highlightCell = collectionView.dequeueReusableCell(
      withReuseIdentifier: Identifiers.highlightCellID,
      for: indexPath) as? HighlightesCollectionViewCell
    else {
      return UICollectionViewCell()
    }
    highlightCell.configureCell(highlightItem: profileHighlights?[indexPath.row])
    return highlightCell
  }
}
