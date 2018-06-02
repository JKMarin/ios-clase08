//
//  ViewController.swift
//  JSONtoClass
//
//  Created by user139236 on 6/1/18.
//  Copyright © 2018 JCMA. All rights reserved.
//

import UIKit
import SwiftyJSON

class MainMenuController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func mostrarMensaje(mensaje:String){
        
        let alertView = UIAlertController(title: "Message", message:mensaje, preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
       
        self.show(alertView, sender: nil)
        
    }
    @IBAction func getPostPressed(_ sender: UIButton) {
        APIManager.sharedInstance.getPostWithId(postId: 1, onSuccess: { json in
            DispatchQueue.main.async {
                if let data = PostModel(jsonObject: json) {
                    let mensaje:String = "PostModel{\nuserId=\(data.userId)\nid=\(data.id)\ntitle=\"\(data.title)\"\n}"
                    self.mostrarMensaje(mensaje: mensaje)
                }
            }
        }, onFailure: { error in
            let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cerrar", style: .default, handler: nil))
            self.show(alert, sender: nil)
        })
    }
    
    @IBAction func getUsersPressed(_ sender: UIButton) {
        APIManager.sharedInstance.getUsers(onSuccess: { json in
            DispatchQueue.main.async {
                var users:[UserModel]=[]
                for (_,subJson):(String, JSON) in json {
                    if let user = UserModel(jsonObject: subJson){
                        users.append(user)
                    }
                }
                let cantidad = users.count
                let data = users[1]
                let mensaje:String = "[1..\(cantidad)]\nUserModel{\nid=\(data.id)\nname=\"\(data.name)\"\naddress={\ncity:\"\(data.address.city)\"}\n}"
                self.mostrarMensaje(mensaje: mensaje)
                
            }
        }, onFailure: { error in
            let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cerrar", style: .default, handler: nil))
            self.show(alert, sender: nil)
        })
    }
    @IBAction func getCommentsPressed(_ sender: UIButton) {
        APIManager.sharedInstance.getComments(onSuccess: { json in
            DispatchQueue.main.async {
                var comments:[CommentsModel]=[]
                for (_,subJson):(String, JSON) in json {
                    if let comment = CommentsModel(jsonObject: subJson){
                        comments.append(comment)
                    }
                }
                let cantidad = comments.count
                let data = comments[1]
                let mensaje:String = "[1..\(cantidad)]\nCommentsModel{\npostId=\(data.postId)\nid=\(data.id)\nname=\"\(data.name)\"\nemail=\"\(data.email)\"\nbody=\"\(data.body)\"\n}"
                self.mostrarMensaje(mensaje: mensaje)
                
            }
        }, onFailure: { error in
            let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cerrar", style: .default, handler: nil))
            self.show(alert, sender: nil)
        })
    }
}

