//
//  ViewController.swift
//  TODO
//
//  Created by  汪刚 on 2018/9/8.
//  Copyright © 2018年  汪刚. All rights reserved.
//

import UIKit

var todos: [ToDoItem] = []

class ViewController: UIViewController {

    @IBOutlet weak var todoTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
        
        todos = [ToDoItem(id: "1", image: "child-selected", title: "Go to Disney", date: dataFromString("2014-10-20")!),
                 ToDoItem(id: "2", image: "shopping-cart-selected", title: "Cicso Shopping", date: dataFromString("2014-10-28")!),
                 ToDoItem(id: "3", image: "phone-selected", title: "Phone to Jobs", date: dataFromString("2014-10-30")!),
                 ToDoItem(id: "4", image: "travel-selected", title: "Plan to Europe", date: dataFromString("2014-10-31")!)]
        
    
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        todoTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setMessageLable(_ messsageLable: UILabel,frame:CGRect,text:String,color:UIColor,numberofliness:Int ,textAligment:NSTextAlignment,font:UIFont)  {
        messsageLable.text = text
        messsageLable.textColor = color
        messsageLable.numberOfLines = numberofliness
        messsageLable.textAlignment = textAligment
        messsageLable.font = font;
        messsageLable.sizeToFit()
    }
 
    func setCellWithTodoItem(_ cell:UITableViewCell,todo:ToDoItem)  {
        let imageView: UIImageView = cell.viewWithTag(11) as! UIImageView
        imageView.image = UIImage(named: todo.image)
        
        let lable:UILabel = cell.viewWithTag(10) as! UILabel
        lable.text = todo.title;
        
    }
//
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editTodo" {
            let vc = segue.destination as! DetailViewController
            let indexPath = todoTableView.indexPathForSelectedRow
            if let indexPath = indexPath {
//                vc.todo = todos[(indexPath as NSIndexPath).row]
                  vc.todo = todos[(indexPath as NSIndexPath).row]
            }
        }
    }

    
}


extension ViewController :UITableViewDataSource {
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if todos.count != 0 {
            return todos.count
        }else{
            let messageLable: UILabel = UILabel()
            setMessageLable(messageLable, frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size
            .height), text: "无数据", color: UIColor.black, numberofliness: 0, textAligment: NSTextAlignment.center, font: UIFont.systemFont(ofSize: 12))
            self.todoTableView.backgroundView = messageLable
            self.todoTableView.separatorStyle = UITableViewCellSeparatorStyle.none
            return 0
        }
    }
    
    func tableView(_ tableView:UITableView,cellForRowAt indexPath:IndexPath) -> UITableViewCell{
        let cellIdentify:String = "todocell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentify,for:indexPath)
        setCellWithTodoItem(cell, todo: todos[(indexPath as NSIndexPath).row])
        return cell
    }
}


extension ViewController:UITableViewDelegate {
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            todos.remove(at: (indexPath as NSIndexPath).row)
            todoTableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
    }
    
   
}

