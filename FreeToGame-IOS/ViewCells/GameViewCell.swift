//
//  GameViewCell.swift
//  FreeToGame-IOS
//
//  Created by Tardes on 28/5/26.
//

import UIKit

class GameViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var browserImageView: UIImageView!
    @IBOutlet weak var desktopImageView: UIImageView!

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var cardShadowView: UIView!
    @IBOutlet weak var selectionView: UIView!
    
    //funcion para cargar los datos
    func render(with game: Game) {
        titleLabel.text = game.title
        descriptionLabel.text = game.shortDescription
        thumbnailImageView.loadFrom(url: game.thumbnail)
        genreLabel.text = game.genre
        //si no contiene alguna de ambas que esconda esa imagen
        browserImageView.isHidden = !game.platform.contains("Web Browser")
        desktopImageView.isHidden = !game.platform.contains("PC (Windows)")
            
        
    }
    //solo se ejecuta cuando se crea la celda
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        //redondera los bordes de la tarjeta
        cardView.layer.cornerRadius = 16
        //recortar el contenido de la carta a la forma de la carta, si es false se puede salir de la imagen
        cardView.layer.masksToBounds = true
        
        cardShadowView.layer.shadowColor = UIColor.black.cgColor
        //dar sombra y redondear los bordes para que la sombra coincida con la tarjeta
        cardShadowView.layer.cornerRadius = 16
        //decide si el contenido se puede renderizar fuera del padre o no
        cardShadowView.layer.masksToBounds = false
        //la opacidad de la sombra
        cardShadowView.layer.shadowOpacity = 0.5
        //cuanto queremos que se desvie (4 pixeles a la derecha y 4 pixeles de alto) si queremos que salga a la izq poner valores negativos
        cardShadowView.layer.shadowOffset = CGSize(width: 2, height: 2)
        //difumina la sombra
        cardShadowView.layer.shadowRadius = 4
        
        //bordes
        cardView.layer.borderWidth = 1
        cardView.layer.borderColor = UIColor.separator.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
            // Configure the view for the selected state
        //le decimos al fondo que tenga color blanco o negro (depende del modo dark o normal)
        contentView.backgroundColor = .systemBackground
        //cuando se selecciones la card se pone de ese color
        selectionView.backgroundColor = selected ? .separator : .clear
    }

}
