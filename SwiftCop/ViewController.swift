//
//  ViewController.swift
//  SwiftCop
//
//  Created by Andres on 10/16/15.
//  Copyright © 2015 Andres Canal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	@IBOutlet weak var validationLabel: UILabel!

	@IBOutlet weak var fullName: UITextField!
	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var password: UITextField!
	
	let elPolicia = SwiftCop()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		elPolicia.addSuspect(Suspect(view: self.fullName, sentence: "More Than Two Words Needed"){
			return $0.componentsSeparatedByString(" ").count >= 2
		})
		elPolicia.addSuspect(Suspect(view:self.emailTextField, sentence: "Invalid email", trial: Trial.Email))
		elPolicia.addSuspect(Suspect(view:self.password, sentence: "Minimum 4 Characters ", trial: Trial.Length(.Minimum, 4)))
		
	}
	
	@IBAction func validate(sender: UITextField) {
		if let suspect = elPolicia.isGuilty(sender) {
			self.validationLabel.text = suspect.sentence
		}
		
		if !elPolicia.anyGuilty() {
			self.validationLabel.text = ""
		}
	}
}

