//
//  DetailViewController.swift
//  TODO
//
//  Created by  汪刚 on 2018/9/8.
//  Copyright © 2018年  汪刚. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var childButton: UIButton!
    
    @IBOutlet weak var phoneButton: UIButton!
    @IBOutlet weak var shoppingCarButton: UIButton!
    @IBOutlet weak var travelButton: UIButton!
    
    @IBOutlet weak var todoDatePicker: UIDatePicker!
    @IBOutlet weak var todoTitleLable: UILabel!
    @IBOutlet weak var todoTitleTextFeild: UITextField!
    
    var todo:ToDoItem?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let todo = todo {
            self.title = "edit todo"
            if todo.image == "child-selected" {
                childButton.isSelected = true
            }
            else if todo.image == "phone-selected"{
                phoneButton.isSelected = true
            }
            else if todo.image == "shopping-cart-selected"{
                shoppingCarButton.isSelected = true
            }
            else if todo.image == "travel-selected"{
                travelButton.isSelected = true
            }
            todoTitleLable.text = todo.title
            todoDatePicker.setDate(todo.date, animated: true)
        } else {
            title = "New Todo"
            childButton.isSelected = true
        }
     
        todoTitleTextFeild.text = todo?.title;
        // Do any additional setup after loading the view.
    }

    func resetButtons(){
        childButton.isSelected = false
        phoneButton.isSelected = false
        shoppingCarButton.isSelected = false
        travelButton.isSelected = false
    }
    
    @IBAction func selectChild(_ sender: Any) {
        resetButtons()
        childButton.isSelected = true
    }
    

    @IBAction func selectPhone(_ sender: Any) {
        resetButtons()
        phoneButton.isSelected = true
    }
    
    @IBAction func selectPhoneCar(_ sender: Any) {
        resetButtons()
        shoppingCarButton.isSelected = true
    }
    
    @IBAction func selectTravel(_ sender: Any) {
        resetButtons()
        travelButton.isSelected = true
    }
    
    
    
    @IBAction func tapDone(_ sender: UIButton) {
        var image = ""
        if childButton.isSelected {
            image = "child-selected"
        }else if shoppingCarButton.isSelected{
            image = "phone-selected"
        }else if travelButton.isSelected {
            image = "travel-selected"
        }
        
        if let todo = todo {
            todo.image = image
            todo.title = todoTitleLable.text!
            todo.date = todoDatePicker.date
        }else {
            let uuid = UUID().uuidString
            todo = ToDoItem(id: uuid, image: image, title: todoTitleTextFeild.text!, date: todoDatePicker.date)
            todos.append(todo!)
        }
    
        
      let _ =  navigationController?.popViewController(animated: true)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

 

}
