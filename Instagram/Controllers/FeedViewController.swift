//
//  FeedViewController.swift
//  Instagram
//
//  Created by Aleksandr Dorofeev on 17.10.2022.
//

import UIKit

/// Feed screen.
final class FeedViewController: UIViewController {
  
  // MARK: - Private enum.
  private enum Items {
      case stories
      case post
      case recommendation
  }
  
  // MARK: - Private Constants.
  private enum Constants {
    static let storyCellId = "StoriesCell"
    static let postCellId = "PostCell"
    static let recommendationCellId = "RecommendationCell"
  }
  
  // MARK: - Private Visual components.
  @IBOutlet private weak var tableView: UITableView!
  private lazy var refreshControl = UIRefreshControl()
    
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
  
  private func addItems() -> [Items] {
      var items: [Items] = [Items]()
      items.append(Items.stories)
      items.append(Items.post)
      items.append(Items.recommendation)
      items.append(Items.post)
      items.append(Items.post)
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
      let cell = tableView.dequeueReusableCell(withIdentifier: Constants.storyCellId,
                                               for: indexPath)
      return cell
    case .post:
      let cell = tableView.dequeueReusableCell(withIdentifier: Constants.postCellId,
                                               for: indexPath)
      return cell
    case .recommendation:
      let cell = tableView.dequeueReusableCell(withIdentifier: Constants.recommendationCellId,
                                               for: indexPath)
      return cell
    }
  }
}
