//
//  ProfileDescription.swift
//  Instagram
//
//  Created by Aleksandr Dorofeev on 24.10.2022.
//

import Foundation

/// Cell with description of profile
/// - profileImageName: Name of profile
/// - postsAmount: posts amount
/// - subscribersAmount: subscribers amount
/// - subscriptionsAmount: subscriptions amount
/// - profileName: name of profile
/// - typeOfAccountText: type of profile
/// - descriptionText: description of profile
/// - similarSubscribesText: the same subscribes
struct ProfileDescription {
  var profileImageName: String
  var postsAmount: String
  var subscribersAmount: String
  var subscriptionsAmount: String
  var profileName: String
  var typeOfAccountText: String
  var descriptionText: String
  var sameSubscribesText: String
}
