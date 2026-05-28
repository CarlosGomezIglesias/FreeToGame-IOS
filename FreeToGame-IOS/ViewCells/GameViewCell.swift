//
//  GameViewCell.swift
//  FreeToGame-IOS
//
//  Created by Tardes on 28/5/26.
//

import UIKit

class GameViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func render(with game: Game) {
        titleLabel.text = game.title
        thumbnailImageView.loadFrom(url: game.thumbnail)
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
