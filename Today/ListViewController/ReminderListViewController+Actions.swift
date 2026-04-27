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
    
    @objc func didPressAddButton(_ sender: UIBarButtonItem) {
        let reminder = Reminder(title: "", dueDate: .now)
        let reminderViewController = ReminderViewController(reminder: reminder) { [weak self] reminder in
            self?.addReminder(reminder)
            self?.updateSnapshot()
            self?.dismiss(animated: true)
        }
        reminderViewController.isAddingNewReminder = true
        reminderViewController.setEditing(true, animated: false)
        reminderViewController.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(didCancelAdd(_:)))
        reminderViewController.navigationItem.title = NSLocalizedString("Add Reminder", comment: "Add Reminder view controller title")
        let navigationController = UINavigationController(rootViewController: reminderViewController)
        present(navigationController, animated: true)
    }
    
    @objc func didCancelAdd(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @objc func didChangeListStyle(_ sender: UISegmentedControl) {
        listStyle = ReminderListStyle(rawValue: sender.selectedSegmentIndex) ?? .today
        updateSnapshot()
    }
}
