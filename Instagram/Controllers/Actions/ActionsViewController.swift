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
  private enum ActionsItem {
    case subscribeRequest(items: [ActionContent])
    case todayContent(items: [ActionContent])
    case yesterdayContent(items: [ActionContent])
    case thisWeekContent(items: [ActionContent])
  }
  
  // MARK: - Private Constants.
  private enum Constants {
    static let postID = "PostTableViewCell"
    static let subscribeID = "SubscribeTableViewCell"
    static let subscriptionRequestsID = "SubscribeRequestTableViewCell"
    static let emptyTitle = ""
    static let sectionTodayTitle = "Cегодня"
    static let sectionYesterdayTitle = "Вчера"
    static let sectionOnThisWeekTitle = "На этой неделе"
    static let subscribeRequestText = "Запросы на подписку"
    static let avatarHasbImageName = "hasb"
    static let avatarPoliceImageName = "police"
    static let avatarSaintImageName = "saint"
    static let userNameCute = "cute"
    static let userNamePolicemen = "policeman"
    static let userNameGangster = "gangster"
    static let userNameHasbik = "hasbik"
    static let subscribeText = "подписался(-ась) на ваши обновления."
    static let likeVideoText = "нравится ваше видео."
    static let likeCommentText = "понравился ваш комментарий: \"От души\""
    static let likeCommentFightText = "понравился ваш комментарий: \"Дерись!!\""
    static let commentPhotoLikeText = "прокомментировал(-а) ваше фото: Я хочу от тебя детей"
    static let commentPhotoPraiseText = "прокомментировал(-а) ваше фото: Мощно вчера выступил"
    static let mentionGangsterText = "упомянул(-а) вас в комментарии: @gangster всех покараю)"
    static let twoHourText = "2ч."
    static let sevenHourText = "7ч."
    static let fourteenHourText = "14ч."
    static let twoDayText = "2д."
    static let fiveDayText = "5д."
    static let oneDayText = "1д."
    static let sixDayText = "6д."
  }
  
  // MARK: - Private @IBOutlet.
  @IBOutlet private weak var tableView: UITableView!
  
  // MARK: - Private visual components.
  private let refreshControl = UIRefreshControl()
  private var subscribeRequestContent: [ActionContent] = []
  private var todayContent: [ActionContent] = []
  private var yesterdayContent: [ActionContent] = []
  private var thisWeekContent: [ActionContent] = []
  
  // MARK: - Life cycle.
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  // MARK: - Private methods.
  private func setupUI() {
    configureRefresh()
    registerCells()
  }
  
  private func addItems() -> [ActionsItem] {
    var actionsItem: [ActionsItem] = [ActionsItem]()
    subscribeRequestContent = []
    actionsItem.append(.subscribeRequest(items: subscribeRequestContent))
    
    todayContent = [
      ActionContent(
        userName: Constants.userNameGangster,
        content: Constants.likeCommentText,
        time: Constants.twoHourText,
        avatarImageName: Constants.avatarHasbImageName,
        isButtonCell: false,
        isSubscribe: nil
      ),
      ActionContent(
        userName: Constants.userNamePolicemen,
        content: Constants.likeCommentFightText,
        time: Constants.sevenHourText,
        avatarImageName: Constants.avatarHasbImageName,
        isButtonCell: false,
        isSubscribe: nil
      ),
      ActionContent(
        userName: Constants.userNameCute,
        content: Constants.likeVideoText,
        time: Constants.fourteenHourText,
        avatarImageName: Constants.avatarPoliceImageName,
        isButtonCell: false,
        isSubscribe: nil
      ),
      ActionContent(
        userName: Constants.userNameGangster,
        content: Constants.subscribeText,
        time: Constants.fourteenHourText,
        avatarImageName: Constants.avatarHasbImageName,
        isButtonCell: true,
        isSubscribe: true
      )
    ]
    actionsItem.append(.todayContent(items: todayContent))
    
    yesterdayContent = [
      ActionContent(
        userName: Constants.userNamePolicemen,
        content: Constants.subscribeText,
        time: Constants.oneDayText,
        avatarImageName: Constants.avatarHasbImageName,
        isButtonCell: true,
        isSubscribe: false
      ),
      ActionContent(
        userName: Constants.userNameHasbik,
        content: Constants.likeVideoText,
        time: Constants.oneDayText,
        avatarImageName: Constants.avatarSaintImageName,
        isButtonCell: false,
        isSubscribe: nil
      ),
      ActionContent(
        userName: Constants.userNameCute,
        content: Constants.subscribeText,
        time: Constants.oneDayText,
        avatarImageName: Constants.avatarSaintImageName,
        isButtonCell: true,
        isSubscribe: true
      ),
      ActionContent(
        userName: Constants.userNamePolicemen,
        content: Constants.commentPhotoLikeText,
        time: Constants.oneDayText,
        avatarImageName: Constants.avatarSaintImageName,
        isButtonCell: false,
        isSubscribe: nil
      ),
      ActionContent(
        userName: Constants.userNameCute,
        content: Constants.mentionGangsterText,
        time: Constants.oneDayText,
        avatarImageName: Constants.avatarPoliceImageName,
        isButtonCell: false,
        isSubscribe: nil
      ),
      ActionContent(
        userName: Constants.userNamePolicemen,
        content: Constants.commentPhotoPraiseText,
        time: Constants.oneDayText,
        avatarImageName: Constants.avatarSaintImageName,
        isButtonCell: false,
        isSubscribe: nil
      )
    ]
    actionsItem.append(.yesterdayContent(items: yesterdayContent))
    
    thisWeekContent = [
      ActionContent(
        userName: Constants.userNameCute,
        content: Constants.subscribeText,
        time: Constants.twoDayText,
        avatarImageName: Constants.avatarPoliceImageName,
        isButtonCell: true,
        isSubscribe: false
      ),
      ActionContent(
        userName: Constants.userNameCute,
        content: Constants.likeCommentText,
        time: Constants.twoDayText,
        avatarImageName: Constants.avatarHasbImageName,
        isButtonCell: false,
        isSubscribe: nil
      ),
      ActionContent(
        userName: Constants.userNamePolicemen,
        content: Constants.subscribeText,
        time: Constants.fiveDayText,
        avatarImageName: Constants.avatarSaintImageName,
        isButtonCell: true,
        isSubscribe: true
      ),
      ActionContent(
        userName: Constants.userNameHasbik,
        content: Constants.likeCommentFightText,
        time: Constants.fiveDayText,
        avatarImageName: Constants.avatarSaintImageName,
        isButtonCell: false,
        isSubscribe: nil
      ),
      ActionContent(
        userName: Constants.userNameGangster,
        content: Constants.mentionGangsterText,
        time: Constants.fiveDayText,
        avatarImageName: Constants.avatarPoliceImageName,
        isButtonCell: false,
        isSubscribe: nil
      ),
      ActionContent(
        userName: Constants.userNameCute,
        content: Constants.likeCommentText,
        time: Constants.sixDayText,
        avatarImageName: Constants.avatarPoliceImageName,
        isButtonCell: false,
        isSubscribe: nil
      )
    ]
    actionsItem.append(.thisWeekContent(items: thisWeekContent))
    
    return actionsItem
  }
  
  private func configureRefresh() {
    refreshControl.addTarget(self, action: #selector(refreshAction), for: .valueChanged)
    tableView.refreshControl = refreshControl
  }
  
  private func registerCells() {
    tableView.register(
      UINib(nibName: Constants.subscriptionRequestsID, bundle: nil),
      forCellReuseIdentifier: Constants.subscriptionRequestsID
    )
    tableView.register(
      UINib(nibName: Constants.postID, bundle: nil),
      forCellReuseIdentifier: Constants.postID
    )
    tableView.register(
      UINib(nibName: Constants.subscribeID, bundle: nil),
      forCellReuseIdentifier: Constants.subscribeID
    )
  }
  
  private func configureTableViewHeightCell() {
    tableView.rowHeight = UITableView.automaticDimension
    tableView.sectionHeaderHeight = UITableView.automaticDimension
  }
  
  // MARK: - Private actions.
  @IBAction private func backAction(_ sender: Any) {
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
    return 4
  }
  
  func tableView(_ tableView: UITableView,
                 numberOfRowsInSection section: Int) -> Int {
    let item = addItems()[section]
    switch item {
    case .subscribeRequest:
      return subscribeRequestContent.count
    case .todayContent:
      return todayContent.count
    case .yesterdayContent:
      return yesterdayContent.count
    case .thisWeekContent:
      return thisWeekContent.count
    }
  }
  
  func tableView(_ tableView: UITableView,
                 cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let subscribeRequestCell = tableView.dequeueReusableCell(
       withIdentifier: Constants.subscriptionRequestsID,
       for: indexPath) as? SubscribeRequestTableViewCell else { return UITableViewCell() }
    guard let subscribeCell = tableView.dequeueReusableCell(
      withIdentifier: Constants.subscribeID,
      for: indexPath) as? SubscribeTableViewCell else { return UITableViewCell() }
    guard let postCell = tableView.dequeueReusableCell(
      withIdentifier: Constants.postID,
      for: indexPath) as? PostTableViewCell else { return UITableViewCell() }
    let actionsItem = addItems()[indexPath.section]
    switch actionsItem {
    case .subscribeRequest:
      return subscribeRequestCell
    case let .todayContent(items):
      let item = items[indexPath.row]
      if item.isButtonCell {
        subscribeCell.configure(model: item)
        return subscribeCell
      } else {
        postCell.configure(model: item)
        return postCell
      }
    case let .yesterdayContent(items):
      let item = items[indexPath.row]
      if item.isButtonCell {
        subscribeCell.configure(model: item)
        return subscribeCell
      } else {
        postCell.configure(model: item)
        return postCell
      }
    case let .thisWeekContent(items):
      let item = items[indexPath.row]
      if item.isButtonCell {
        subscribeCell.configure(model: item)
        return subscribeCell
      } else {
        postCell.configure(model: item)
        return postCell
      }
    }
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    switch section {
    case 0:
      return Constants.subscribeRequestText
    case 1:
      return Constants.sectionTodayTitle
    case 2:
      return Constants.sectionYesterdayTitle
    case 3:
      return Constants.sectionOnThisWeekTitle
    default:
      return Constants.emptyTitle
    }
  }
}

/// UITableViewDelegate.
extension ActionsViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView,
                 willDisplayHeaderView view: UIView,
                 forSection section: Int) {
    let header = view as? UITableViewHeaderFooterView
    header?.textLabel?.textColor = .label
    header?.textLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
    header?.textLabel?.text = header?.textLabel?.text?.capitalized
  }
  
  func tableView(_ tableView: UITableView,
                 heightForHeaderInSection section: Int) -> CGFloat {
    return 30
  }
}
