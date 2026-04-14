//
//  ReminderViewController+Row.swift
//  Today
//
//  Created by Александра Савичева on 11.04.2026.
//

import UIKit

extension ReminderViewController {
    
    // Можно ещё попробовать реализовать протокол String, так как он является Sendable&Hashable,
    // это было бы проще, чем реализовывать протокол any Hashable,
    // где всё равно пришлось бы добавлять тайпэлиас, свойство и инит для rawValue
    enum Row: nonisolated Hashable {
        case header(String)
        case date
        case notes
        case time
        case title
        case editableText(String?)
        case editableDate(Date)
        
        var imageName: String? {
            switch self {
            case .date: return "calendar.circle"
            case .notes: return "square.and.pencil"
            case .time: return "clock"
            default: return nil
            }
        }
        
        var image: UIImage? {
            guard let imageName else { return nil }
            let configuration = UIImage.SymbolConfiguration(textStyle: .headline)
            return UIImage(systemName: imageName, withConfiguration: configuration)
        }
        
        var textStyle: UIFont.TextStyle {
            switch self {
            case .title: return .headline
            default: return .subheadline
            }
        }
    }
}
