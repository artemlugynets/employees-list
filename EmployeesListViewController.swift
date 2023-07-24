//
//  EmployeesListViewController.swift
//  employees-list
//
//  Created by Artem Lugynets on 24.07.2023.
//

import Foundation
import UIKit

protocol EmployeesListViewControllerDelegate: AnyObject {
    // Add any delegate methods here if needed
    // For example, a method to handle employee selection
}

class EmployeesListViewController: UIViewController {
    // MARK: - Properties
    private let viewModel: EmployeesListViewModel
    weak var delegate: EmployeesListViewControllerDelegate?

    // MARK: - UI Components
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        // Add any custom table view settings here
        return tableView
    }()

    // MARK: - Initialization
    init(viewModel: EmployeesListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
        loadData()
    }

    // MARK: - UI Setup
    private func setupUI() {
        title = "Employees List"
        view.backgroundColor = .white
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    // MARK: - Data Loading
    private func loadData() {
        viewModel.fetchEmployees()
        tableView.reloadData()
    }
}

// MARK: - UITableView Delegate & DataSource
extension EmployeesListViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfEmployees(in: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let employee = viewModel.employee(at: indexPath)
        cell.textLabel?.text = "\(employee.name) \(employee.surname)"
        // Customize cell appearance if needed
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.departmentName(for: section)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Handle employee selection, if needed, by calling the delegate method
        // For example: delegate?.didSelectEmployee(viewModel.employee(at: indexPath))
    }
}

