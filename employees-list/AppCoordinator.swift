//
//  AppCoordinator.swift
//  employees-list
//
//  Created by Artem Lugynets on 24.07.2023.
//

import Foundation
import UIKit

class AppCoordinator {
    let window: UIWindow
    var navigationController: UINavigationController?

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        let employeesListViewModel = EmployeesListViewModel()
        let employeesListViewController = EmployeesListViewController(viewModel: employeesListViewModel)
        employeesListViewController.delegate = self
        
        navigationController = UINavigationController(rootViewController: employeesListViewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

extension AppCoordinator: EmployeesListViewControllerDelegate {
    // Implement delegate methods here to handle navigation to other screens if needed
    // For example, when the user selects a specific employee, you can navigate to a detailed employee view.
}
// In this example, we have an AppCoordinator class that manages the app's navigation. The start() method initializes the EmployeesListViewModel, creates an instance of EmployeesListViewController with the view model, sets the coordinator as the delegate of the view controller, embeds the view controller in a navigation controller, and sets it as the root view controller of the window.

// The EmployeesListViewControllerDelegate extension allows you to handle navigation to other screens if needed. For instance, if the user selects a specific employee from the list, you can implement a delegate method to navigate to a detailed view for that employee.

// Please note that this is a basic example, and depending on your app's complexity, you might need to add more navigation logic or coordinators for different screens. The AppCoordinator class should serve as the central coordinator for the entire app's navigation flow.






