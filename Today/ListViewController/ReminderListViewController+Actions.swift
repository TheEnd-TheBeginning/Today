//
//  ReminderListViewController+Actions.swift
//  Today
//
//  Created by Александра Савичева on 11.04.2026.
//

import UIKit

extension ReminderListViewController {
    @objc func didPressDoneButton(_ sender: ReminderDoneButton) {
        guard let id = sender.id else { return }
        completeReminder(withId: id)
    }
}
