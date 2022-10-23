//
//  NSMutableAttributedString+Extension.swift
//  Instagram
//
//  Created by Aleksandr Dorofeev on 23.10.2022.
//

import UIKit

/// Extension for crating string with three attributes.
extension NSMutableAttributedString {
  var fontSize: CGFloat {
      return 13
  }
  var boldFont: UIFont {
      return UIFont.boldSystemFont(ofSize: fontSize)
  }
  var normalFont: UIFont {
      return UIFont.systemFont(ofSize: fontSize)
  }
  
  func bold(_ value: String) -> NSMutableAttributedString {
      let attributes: [NSAttributedString.Key: Any] = [
          .font: boldFont,
          .foregroundColor: UIColor.label
      ]
      self.append(NSAttributedString(string: value, attributes: attributes))
      return self
  }
  
  func normal(_ value: String) -> NSMutableAttributedString {
      let attributes: [NSAttributedString.Key: Any] = [
          .font: normalFont,
          .foregroundColor: UIColor.label
      ]
      self.append(NSAttributedString(string: value, attributes: attributes))
      return self
  }
  
  func normalGray(_ value: String) -> NSMutableAttributedString {
      let attributes: [NSAttributedString.Key: Any] = [
          .font: normalFont,
          .foregroundColor: UIColor.secondaryLabel
      ]
      self.append(NSAttributedString(string: value, attributes: attributes))
      return self
  }
}
