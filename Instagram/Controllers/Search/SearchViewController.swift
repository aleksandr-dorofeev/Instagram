//
//  SearchViewController.swift
//  Instagram
//
//  Created by Aleksandr Dorofeev on 24.10.2022.
//

import UIKit

/// Screen with searched profile.
final class SearchViewController: UIViewController {
  
  // MARK: - Private enums.
  private enum TableCellsType {
    case mainInfoProfile
    case descriptionProfile
    case highlightsProfile
    case postCollection
  }
  
  // MARK: - Private Constants.
  private enum Identifier {
    static let profileCellID = "ProfileCell"
    static let profileNibName = "ProfileTableViewCell"
    static let descriptionCellID = "DescriptionCell"
    static let descriptionNibName = "DescriptionTableViewCell"
    static let highlightsCellID = "HighlightsCell"
    static let highlightsNibName = "HighlightsTableViewCell"
    static let postsCellID = "PostsCell"
    static let postsNibName = "PostsTableViewCell"
  }
  
  private enum Constants {
    static let profileHasbikName = "Hasbulla Magomedov"
    static let typeOfProfileName = "UFCFighter"
    static let postsAmount = "15"
    static let subscribersAmount = "4.1 M"
    static let subscriptionsAmount = "375"
    static let descriptionProfileName = "Makhachkala-Dagestan 20 years \nJoin my NFT project"
    static let sameSubscribersName = "ufc"
    static let hasbikImageName = "hasb"
    static let policeHasbikImageName = "police"
    static let cuteHasbikImageName = "saint"
    static let gangstaHasbikImageName = "gangster"
    static let suetologHasbikImageName = "suetolog"
    static let eleganceHasbikImageName = "elegance"
    static let firstHighlightName = "Хасаню"
    static let secondHighlightName = "UFC"
    static let thirdHighlightName = "Dagestan"
    static let forthHighlightName = "NFT"
    static let fithHighlightName = "Аааауф"
    static let sixthHighlightName = "Братья"
    
  }
  
  // MARK: - Private @IBOutlet.
  @IBOutlet private weak var searchedProfileTableView: UITableView!
  
  // MARK: - Private visual components.
  private let refreshControl = UIRefreshControl()
  
  // MARK: - Private properties.
  private let tableCells: [TableCellsType] =
  [
    .mainInfoProfile,
    .descriptionProfile,
    .highlightsProfile,
    .postCollection
  ]
  private let collectionOfPosts: [Post] = [Post(postImageName: Constants.hasbikImageName),
                                           Post(postImageName: Constants.policeHasbikImageName),
                                           Post(postImageName: Constants.cuteHasbikImageName),
                                           Post(postImageName: Constants.gangstaHasbikImageName),
                                           Post(postImageName: Constants.suetologHasbikImageName),
                                           Post(postImageName: Constants.eleganceHasbikImageName),
                                           Post(postImageName: Constants.hasbikImageName),
                                           Post(postImageName: Constants.policeHasbikImageName),
                                           Post(postImageName: Constants.cuteHasbikImageName),
                                           Post(postImageName: Constants.gangstaHasbikImageName),
                                           Post(postImageName: Constants.suetologHasbikImageName),
                                           Post(postImageName: Constants.eleganceHasbikImageName),
                                           Post(postImageName: Constants.suetologHasbikImageName),
                                           Post(postImageName: Constants.policeHasbikImageName),
                                           Post(postImageName: Constants.hasbikImageName)]
  private let profileDescription = ProfileDescription(profileImageName: Constants.hasbikImageName,
                                                      postsAmount: Constants.postsAmount,
                                                      subscribersAmount: Constants.subscribersAmount,
                                                      subscriptionsAmount: Constants.subscriptionsAmount,
                                                      profileName: Constants.profileHasbikName,
                                                      typeOfAccountText: Constants.typeOfProfileName,
                                                      descriptionText: Constants.descriptionProfileName,
                                                      sameSubscribesText: Constants.sameSubscribersName)
  private let profileHighlights = [ProfileHighlight(highlightImageName: Constants.hasbikImageName,
                                               highlightName: Constants.firstHighlightName),
                              ProfileHighlight(highlightImageName: Constants.policeHasbikImageName,
                                               highlightName: Constants.secondHighlightName),
                              ProfileHighlight(highlightImageName: Constants.gangstaHasbikImageName,
                                               highlightName: Constants.thirdHighlightName),
                              ProfileHighlight(highlightImageName: Constants.suetologHasbikImageName,
                                               highlightName: Constants.forthHighlightName),
                              ProfileHighlight(highlightImageName: Constants.cuteHasbikImageName,
                                               highlightName: Constants.fithHighlightName),
                              ProfileHighlight(highlightImageName: Constants.eleganceHasbikImageName,
                                               highlightName: Constants.sixthHighlightName)]
  // MARK: - Life cycle.
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  // MARK: - Private methods.
  private func setupUI() {
    configureTableView()
    registerCells()
  }
  
  private func configureTableView() {
    searchedProfileTableView.rowHeight = UITableView.automaticDimension
    setupRefreshControl()
  }
  
  private func registerCells() {
    searchedProfileTableView.register(
      UINib(nibName: Identifier.profileNibName, bundle: nil),
      forCellReuseIdentifier: Identifier.profileCellID)
    searchedProfileTableView.register(
      UINib(nibName: Identifier.descriptionNibName, bundle: nil),
      forCellReuseIdentifier: Identifier.descriptionCellID)
    searchedProfileTableView.register(
      UINib(nibName: Identifier.highlightsNibName, bundle: nil),
      forCellReuseIdentifier: Identifier.highlightsCellID)
    searchedProfileTableView.register(
      UINib(nibName: Identifier.postsNibName, bundle: nil),
      forCellReuseIdentifier: Identifier.postsCellID)
  }
  
  private func setupRefreshControl() {
    refreshControl.addTarget(self, action: #selector(refreshAction), for: .valueChanged)
    searchedProfileTableView.refreshControl = refreshControl
  }
  
  // MARK: - Private actions.
  @objc private func refreshAction() {
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
      self.searchedProfileTableView.refreshControl?.endRefreshing()
    }
  }
}

/// UITableViewDataSource.
extension SearchViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView,
                 numberOfRowsInSection section: Int) -> Int {
    tableCells.count
  }
  
  func tableView(_ tableView: UITableView,
                 cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableCells[indexPath.row]
    switch cell {
    case .mainInfoProfile:
      guard let profileCell = searchedProfileTableView.dequeueReusableCell(
        withIdentifier: Identifier.profileCellID,
          for: indexPath) as? ProfileTableViewCell
      else {
          return UITableViewCell()
      }
      profileCell.configureCell(profileInfo: profileDescription)
      return profileCell
    case .descriptionProfile:
      guard let descriptionCell = searchedProfileTableView.dequeueReusableCell(
        withIdentifier: Identifier.descriptionCellID,
          for: indexPath) as? DescriptionTableViewCell
      else {
          return UITableViewCell()
      }
      descriptionCell.configureCell(profileDescription: profileDescription)
      return descriptionCell
    case .highlightsProfile:
      guard let highlightsCell = searchedProfileTableView.dequeueReusableCell(
        withIdentifier: Identifier.highlightsCellID,
          for: indexPath) as? HighlightsTableViewCell
      else {
          return UITableViewCell()
      }
      highlightsCell.configureCell(profileHighlights: profileHighlights)
      return highlightsCell
    case .postCollection:
      guard let postsCell = searchedProfileTableView.dequeueReusableCell(
        withIdentifier: Identifier.postsCellID,
          for: indexPath) as? PostsTableViewCell
      else {
          return UITableViewCell()
      }
      let viewHight = (view.bounds.width) / 3 *
      CGFloat(lroundf(Float(collectionOfPosts.count) / 3))
      postsCell.configureCell(postsCollections: collectionOfPosts,
                              viewHight: viewHight)
      return postsCell
    }
  }
}
