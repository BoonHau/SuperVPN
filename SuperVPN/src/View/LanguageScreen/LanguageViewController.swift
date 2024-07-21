//
//  LanguageViewController.swift
//  SuperVPN
//
//  Created by Boon Hau Chu on 21/07/2024.
//

import UIKit

class LanguageViewController: BaseViewController {
    
    // UI
    @IBOutlet weak var vwHeader: CustomHeader!
    @IBOutlet weak var tableView: UITableView!
    
    // Variables
    private var supportedLanguages = DummyData.getSupportedLanguages()
    private var selectedLanguage: String? = UserDefaultsHelper.shared.language
    private var selectedLanguageIndex: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initScreen()
        initTableView()
    }

}

extension LanguageViewController {
    
    override func initScreen() {
        super.initScreen()
        vwHeader.setupView(title: "LANGUAGE".toLocalized(), delegate: self)
    }
    
    func initTableView() {
        DefaultTableViewCell.register(to: tableView)
    }
    
    
    func performRestartApp() {
        let alertViewController = UIAlertController(title: "RESTART_REQUIRED_TITLE".toLocalized(), message: "RESTART_REQUIRED_MSG".toLocalized(), preferredStyle: .alert)
        let restartAction = UIAlertAction(title: "RESTART".toLocalized(), style: .default) { _ in
            if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
                appDelegate.restartApp()
            }
        }
        let cancelAction = UIAlertAction(title: "CANCEL".toLocalized(), style: .cancel, handler: nil)
        alertViewController.addAction(restartAction)
        alertViewController.addAction(cancelAction)
        present(alertViewController, animated: true, completion: nil)
    }
    
}

extension LanguageViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return supportedLanguages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = supportedLanguages[indexPath.row]
        
        if let cell = DefaultTableViewCell.dequeueCell(from: tableView, indexPath: indexPath) as? DefaultTableViewCell {
            cell.setupCell(title: item.title, isSelected: false)
            
            // Handle preset language
            var isSelected = false
            if (indexPath.row == 0 && selectedLanguage == nil) {
                cell.setSelected(isSelected: true)
                isSelected = true
            } else {
                isSelected = item.languageType.rawValue == selectedLanguage
            }
            cell.setSelected(isSelected: isSelected)
            
            if (isSelected) {
                selectedLanguageIndex = indexPath.row
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = supportedLanguages[indexPath.row]
        selectedLanguage = item.languageType.rawValue
        UserDefaultsHelper.shared.language = item.languageType.rawValue
        
        if let safeIndex = selectedLanguageIndex {
            tableView.reloadRows(at: [IndexPath(row: safeIndex, section: 0)], with: .automatic)
        }
        tableView.reloadRows(at: [indexPath], with: .automatic)
        selectedLanguageIndex = indexPath.row
        
        // Show restart app alert
        performRestartApp()
        
        // De-highlight the cell immediately after selection
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension LanguageViewController: CustomHeaderProtocol {
    
    func customHeaderDidPressOnBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func customHeaderDidPressOnRightIcon(buttonStyle: CustomHeader.CustomHeaderButtonStyle) {
        
    }
}
