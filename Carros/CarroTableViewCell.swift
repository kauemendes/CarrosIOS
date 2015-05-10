//
//  CarroTableViewCell.swift
//  Carros
//
//  Created by Kaue Mendes on 3/19/15.
//  Copyright (c) 2015 Fellas Group. All rights reserved.
//

import UIKit

class CarroTableViewCell: UITableViewCell {

    @IBOutlet weak var txtMasterLabel: UILabel!
    @IBOutlet weak var txtSlaveLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        let botao = UIButton(frame: CGRect(x: 220, y: 20, width: 80, height: 30))
        botao.setTitle("comprar", forState: .Normal)
        botao.backgroundColor = UIColor.blackColor()
        
        // Adiciona uma ação ao botão
        botao.addTarget(self, action: "botaoSelecionado", forControlEvents: .TouchUpInside)
        
        self.contentView.addSubview(botao)
        
        
        textLabel?.backgroundColor = UIColor.clearColor()
        
        
    }
    
    func botaoSelecionado() {
        println("botao acionado \(txtMasterLabel!.text!)")
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


    
}
