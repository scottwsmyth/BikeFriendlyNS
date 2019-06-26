//
//  FeedbackController.swift
//  BikeFriendlyNS
//
//  Created by Scott Smyth on 2019-06-25.
//  Copyright © 2019 Scott Smyth. All rights reserved.
//

import UIKit
import MessageUI

class FeedbackViewController: UIViewController, MFMailComposeViewControllerDelegate {

    @IBAction func sendBtn(_ sender: UIButton) {
     
        let toRecipients = ["scott.smyth@dal.ca"]
        let mc: MFMailComposeViewController = MFMailComposeViewController()
        mc.mailComposeDelegate = self
        
        mc.setToRecipients(toRecipients)
        mc.setSubject("\(nameView.text!): Bike Friendly Feedback")
        mc.setMessageBody("Name: \(nameView.text!)\nEmail: \(emailView.text!)\nFeedback Type: \(feedbackTypeView.text!)\n Feedback: \(feedbackView.text!)", isHTML: false)
        self.present(mc, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result.rawValue {
        case MFMailComposeResult.cancelled.rawValue:
            print("Cancelled")
            
        case MFMailComposeResult.failed.rawValue:
            print("Failed")
            
        case MFMailComposeResult.saved.rawValue:
            print("Saved")
            
        case MFMailComposeResult.sent.rawValue:
            print("Sent")
            
        default:
            break
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var emailView: UITextField!
    @IBOutlet weak var feedbackTypeView: UITextField!
    @IBOutlet weak var nameView: UITextField!
    @IBOutlet weak var feedbackView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.feedbackView.layer.borderColor = UIColor.init(red: 232/250, green: 232/250, blue: 232/250, alpha: 1).cgColor
        self.feedbackView.layer.borderWidth = 1
        
        // Do any additional setup after loading the view.
    }


}
