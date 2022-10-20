//
//  FeedViewController.swift
//  Instagram
//
//  Created by Aleksandr Dorofeev on 17.10.2022.
//

import UIKit

/// Feed screen with stories, posts and recommendation.
final class FeedViewController: UIViewController {
  
  // MARK: - Private enum.
  private enum CellType {
    case stories
    case post
    case recommendation
  }
  
  // MARK: - Private Constants.
  private enum Constants {
    static let storyCellID = "StoriesCell"
    static let postCellID = "PostCell"
    static let recommendationCellID = "RecommendationCell"
  }
  
  // MARK: - Private Visual components.
  private let refreshControl = UIRefreshControl()
  @IBOutlet private weak var tableView: UITableView!
  
  // MARK: - Life cycle.
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  // MARK: - Setup UI.
  private func setupUI() {
    configureRefresh()
    configureTableViewHeightCell()
  }
  
  private func configureRefresh() {
    refreshControl.addTarget(self, action: #selector(refreshAction), for: .valueChanged)
    tableView.refreshControl = refreshControl
  }
  
  private func configureTableViewHeightCell() {
    tableView.rowHeight = UITableView.automaticDimension
  }
  
  private func addItems() -> [CellType] {
    var items: [CellType] = [CellType]()
    items.append(CellType.stories)
    items.append(CellType.post)
    items.append(CellType.recommendation)
    items.append(CellType.post)
    items.append(CellType.post)
    return items
  }
  
  // MARK: - Private actions.
  @objc private func refreshAction(_ sender: Any) {
    refreshControl.endRefreshing()
  }
}

/// UITableViewDataSource.
extension FeedViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView,
                 numberOfRowsInSection section: Int) -> Int {
    return addItems().count
  }
  
  func tableView(_ tableView: UITableView,
                 cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let item = addItems()[indexPath.row]
    switch item {
    case .stories:
      let cell = tableView.dequeueReusableCell(withIdentifier: Constants.storyCellID,
                                               for: indexPath)
      return cell
    case .post:
      let cell = tableView.dequeueReusableCell(withIdentifier: Constants.postCellID,
                                               for: indexPath)
      return cell
    case .recommendation:
      let cell = tableView.dequeueReusableCell(withIdentifier: Constants.recommendationCellID,
                                               for: indexPath)
      return cell
    }
  }
}