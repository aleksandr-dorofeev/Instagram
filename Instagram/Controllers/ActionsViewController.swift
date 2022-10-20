//
//  ActionsViewController.swift
//  Instagram
//
//  Created by Aleksandr Dorofeev on 20.10.2022.
//

import UIKit

/// Screen with likes, subscribes and recommendations.
final class ActionsViewController: UIViewController {
  
  // MARK: - Private enums.
  private enum SectionTypes {
    case todayHeader
    case yesterdayHeader
    case weekHeader
  }
  
  private enum CellTypes {
    case comment
    case subscribe
    case like
  }
  
  // MARK: - Private Constants.
  private enum Constants {
    static let todayHeaderName = "Сегодня"
    static let yesterdayHeaderName = "Вчера"
    static let weekHeaderName = "Неделю назад"
    static let subscribeCellID = "SubscribeCell"
    static let commentCellID = "CommentCell"
    static let likeCellID = "LikeCell"
    static let barTextColorName = "BarTintColor"
  }
  
  // MARK: - Private visual components.
  @IBOutlet private weak var tableView: UITableView!
  private let refreshControl = UIRefreshControl()
  
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
  
  private func addSections() -> [SectionTypes] {
    var sections: [SectionTypes] = [SectionTypes]()
    sections.append(SectionTypes.todayHeader)
    sections.append(SectionTypes.yesterdayHeader)
    sections.append(SectionTypes.weekHeader)
    return sections
  }
  
  private func addItems() -> [CellTypes] {
    var items: [CellTypes] = [CellTypes]()
    items.append(CellTypes.comment)
    items.append(CellTypes.subscribe)
    items.append(CellTypes.like)
    items.append(CellTypes.like)
    items.append(CellTypes.subscribe)
    items.append(CellTypes.like)
    items.append(CellTypes.like)
    return items
  }
  
  private func configureRefresh() {
    refreshControl.addTarget(self, action: #selector(refreshAction), for: .valueChanged)
    tableView.refreshControl = refreshControl
  }
  
  private func configureTableViewHeightCell() {
    tableView.rowHeight = UITableView.automaticDimension
    tableView.sectionHeaderHeight = UITableView.automaticDimension
  }
  
  private func createTableCell(indexPath: IndexPath,
                               tableCellsSection: [CellTypes]) -> UITableViewCell {
    switch addItems()[indexPath.row] {
    case .comment:
      let commentCell = tableView.dequeueReusableCell(
        withIdentifier: Constants.commentCellID, for: indexPath)
      return commentCell
    case .subscribe:
      let subscribeCell = tableView.dequeueReusableCell(
        withIdentifier: Constants.subscribeCellID, for: indexPath)
      return subscribeCell
    case .like:
      let likeCell = tableView.dequeueReusableCell(
        withIdentifier: Constants.likeCellID, for: indexPath)
      return likeCell
    }
  }
  
  // MARK: - Private actions.
  @IBAction func backAction(_ sender: Any) {
    navigationController?.popViewController(animated: true)
  }
  
  @objc private func refreshAction(_ sender: Any) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
        self.tableView.refreshControl?.endRefreshing()
    }
  }
}

/// UITableViewDataSource.
extension ActionsViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return addSections().count
  }
  
  func tableView(_ tableView: UITableView,
                 numberOfRowsInSection section: Int) -> Int {
    let timeHeaders = addSections()[section]
    switch timeHeaders {
    case .todayHeader:
      return addItems().count
    case .yesterdayHeader:
      return addItems().count
    case .weekHeader:
      return addItems().count
    }
  }
  
  func tableView(_ tableView: UITableView,
                 cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let section = addSections()[indexPath.section]
    switch section {
    case .todayHeader:
      return createTableCell(indexPath: indexPath, tableCellsSection: addItems())
    case .yesterdayHeader:
      return createTableCell(indexPath: indexPath, tableCellsSection: addItems())
    case .weekHeader:
      return createTableCell(indexPath: indexPath, tableCellsSection: addItems())
    }
  }
}

/// UITableViewDelegate.
extension ActionsViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    switch addSections()[section] {
    case .todayHeader: return Constants.todayHeaderName
    case .yesterdayHeader: return Constants.yesterdayHeaderName
    case .weekHeader: return Constants.weekHeaderName
    }
  }
  
  func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
    guard let headerView = view as? UITableViewHeaderFooterView else { return }
    headerView.textLabel?.textColor = UIColor(named: Constants.barTextColorName)
    headerView.textLabel?.font = UIFont.boldSystemFont(ofSize: 15)
  }
}
