//
//  ViewController.swift
//  SwiftFormHost
//
//  Created by ezen on 12/02/2023.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var emailField: SFTextField!
	
	@IBOutlet weak var nameField: SFTextField!
    
    @IBOutlet weak var passwordField: SFPasswordField!
    
    @IBOutlet weak var passconfField: SFPasswordField!

	var rules = [String: [String]]()
	
	var isSecured: Bool = true {
		didSet {
			let error = self.isSecured ? "Champ requis" : ""
			emailField.error = error
			nameField.error = error
			passwordField.error = error
			passconfField.error = error
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		createViews()
	}
}

extension ViewController {
	
	private func createViews() {
		nameField.registerTextField(withIdentifier: nameField.tag.description, target: self)
		nameField.onClickRight = { self.isSecured.toggle() }
		
		emailField.registerTextField(withIdentifier: emailField.tag.description, target: self)
		passwordField.registerTextField(withIdentifier: passwordField.tag.description, target: self)
		passconfField.registerTextField(withIdentifier: passconfField.tag.description, target: self)
        passconfField.shouldEnableToggleSecureMode = false
	}
	
//	func submit() {
//		// pass the fields data and rules defined
//		let validation = SwiftFormHost.shared.validateForm(data: [
//			emailField.tag.description: emailField.text,
//
//		], rules: self.rules))
//
//		if validation.isFormValid {
//			//
//		}
//	}
}

extension ViewController: SFTextFieldDelegate {
	
	func fieldsRules() -> [String: [String]] {
		self.rules
	}
}
