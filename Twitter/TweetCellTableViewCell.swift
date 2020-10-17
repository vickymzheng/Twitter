//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Vicky Zheng on 10/9/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

    @IBOutlet weak var tweetContentLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    
    var tweetID:Int = -1
    
    var favorited = false
    
    @IBAction func favoriteTweet(_ sender: Any) {
        var newFavStatus = !favorited
        if (newFavStatus) {
            TwitterAPICaller.client?.favoriteTweet(tweetID: tweetID, success: {self.setFavorite(isFavorited: newFavStatus)}, failure: { (error) in
                print("Favorite did not succeed")
            })
        }
        else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetID: tweetID, success: {self.setFavorite(isFavorited: newFavStatus)}, failure: { (error) in
                print("Unfavorite did not succeed")
            })
        }
    }
    
    func setFavorite(isFavorited: Bool) {
        favorited = isFavorited
        if (isFavorited) {
            favButton.setImage(UIImage(named: "favor-icon-red") , for: UIControl.State.normal)
        }
        else {
            favButton.setImage(UIImage(named: "favor-icon") , for: UIControl.State.normal)
        }
    }
    
    
    @IBAction func retweet(_ sender: Any) {
    
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
