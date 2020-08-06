//
//  ViewController.swift
//  password
//
//  Created by fun on 2020/7/31.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageOne: UIImageView!
    @IBOutlet weak var imageTwo: UIImageView!
    
    @IBOutlet weak var imageThree: UIImageView!
    @IBOutlet weak var imageFour: UIImageView!
    
 
    struct defaultSet{
        static var image = UIImage(named: "image")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    var password = ""
    var inputNum = ""

    
    func clearPassword(){
        imageOne.image = defaultSet.image
        imageTwo.image = defaultSet.image
        imageThree.image = defaultSet.image
        imageFour.image = defaultSet.image
        password = ""
    
    }
    func correctOrWrong(){
        if password == "0310"{
            let alert = UIAlertController(title: "完全正確!", message: "Good!", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK!", style: .cancel, handler: nil)
            alert.addAction(action)
            present(alert, animated: false, completion: clearPassword)
        }else{
            let alert = UIAlertController(title: "錯誤!", message: "答案錯了", preferredStyle: .alert)
            let action = UIAlertAction(title: "再試一次", style: .cancel, handler: nil)
            alert.addAction(action)
            present(alert, animated: false, completion: clearPassword)

            
        }
        
    }

    
    
    
    func showPasswordCount(){
        if password.count == 0 {
            imageOne.image = defaultSet.image
            imageTwo.image = defaultSet.image
            imageThree.image = defaultSet.image
            imageFour.image = defaultSet.image
        }else if password.count == 1 {
            imageOne.image = UIImage(named:"flower1")
            imageTwo.image = defaultSet.image
            imageThree.image = defaultSet.image
            imageFour.image = defaultSet.image
        }else if password.count == 2 {
            imageOne.image = UIImage(named:"flower1")
            imageTwo.image = UIImage(named:"flower2")
            imageThree.image = defaultSet.image
            imageFour.image = defaultSet.image
        }else if password.count == 3 {
            imageOne.image = UIImage(named:"flower1")
            imageTwo.image = UIImage(named:"flower2")
            imageThree.image = UIImage(named:"flower1")
            imageFour.image = UIImage(named:"image")
            
    }else if password.count == 4 {
        imageOne.image = UIImage(named:"flower1")
        imageTwo.image = UIImage(named:"flower2")
        imageThree.image = UIImage(named:"flower1")
        imageFour.image = UIImage(named:"flower2")
        correctOrWrong()
        
    }
}
    
    @IBAction func inputNumer(_ sender: UIButton) {
        
        if let inputText = sender.titleLabel?.text ,password.count<4{
            password.append(inputText)
            print(password)
            showPasswordCount()
        }
        
    }
    
    func removeInputNum(){
        if(password.count>0 && password.count<4){
            password.removeLast()
       }
    }
    
 
    
    func renderDefaultPic(){
     var inputCount = password.count+1
        switch inputCount{
      case 3:
        imageThree.image = defaultSet.image
      case 2:
        imageTwo.image = defaultSet.image
      case 1:
        imageOne.image = defaultSet.image
      default:
        restartTyping()
        
        }
          
          
      }
    func restartTyping(){
       imageOne.image = defaultSet.image
       imageTwo.image = defaultSet.image
       imageThree.image = defaultSet.image
       imageFour.image = defaultSet.image
       inputNum = ""
    }
    
    
    @IBAction func deletePassword(_ sender: UIButton) {
        removeInputNum()
      renderDefaultPic()
        print(password)
    }
}

