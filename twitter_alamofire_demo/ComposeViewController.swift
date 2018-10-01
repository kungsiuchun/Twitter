//
//  ComposeViewController.swift
//  twitter_alamofire_demo
//
//  Created by XiaoQian Huang on 9/30/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

protocol ComposeViewControllerDelegate: class {
    func did(post: Tweet)
}

class ComposeViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var tweetTextView: UITextView!
    
   weak var delegate: ComposeViewControllerDelegate?
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        photoImageView.af_setImage(withURL: URL(string: user.imageURL)!)
        nameLabel.text = user.name
        tagLabel.text = user.screenName
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapTweet(_ sender: Any) {
        APIManager.shared.composeTweet(with: tweetTextView.text){ (tweet, err) in
            if let err = err {
                print(err.localizedDescription)
            } else {
                self.delegate?.did(post: tweet!)
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
