//
//  FeedbackController.swift
//  BikeFriendlyNS
//
//  Created by Scott Smyth on 2019-06-25.
//  Copyright © 2019 Scott Smyth. All rights reserved.
//

import UIKit
import MessageUI

class FeedbackViewController: UIViewController, MFMailComposeViewControllerDelegate{

    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendBtn(_ sender: UIButton) {
     
        if nameView.text?.isEmpty ?? true || nameView.text?.isEmpty ?? true  || nameView.text?.isEmpty ?? true {
            
            let alert = UIAlertController(title: "Error", message: "Please fill out all the fields!.", preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
                return
            }))
            
            self.present(alert, animated: true, completion: nil)
        }
        else{sendEmail()}
    }
    
    func sendEmail(){
        guard MFMailComposeViewController.canSendMail() else{
            return
        }
        
        let controller = MFMailComposeViewController()
        controller.mailComposeDelegate = self
        controller.setToRecipients(["scott.smyth@dal.ca"])
        controller.setSubject("BFNS Feedback")
        controller.setMessageBody("Name: \(nameView.text!)\nEmail: \(emailView.text!)\nFeedback type:\(feedbackTypeView.text!)\n\n [Your feedback here...]", isHTML: false)
        
        present(controller, animated: true)
        
    }
    
    @IBOutlet weak var emailView: UITextField!
    @IBOutlet weak var feedbackTypeView: UITextField!
    @IBOutlet weak var nameView: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = UIColor.darkGray

        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    

}
