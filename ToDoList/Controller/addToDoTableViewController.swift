//
//  addToDoTableViewController.swift
//  ToDoList
//
//  Created by Thomas De lange on 26-11-17.
//  Copyright © 2017 Thomas De lange. All rights reserved.
//

import UIKit

class addToDoTableViewController: UITableViewController {
    // Initiate variable for hidden datepicker and ToDo object
    var isPickerHidden = true
    var todo: ToDo?
    // Initiate outletes for the view
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var isCompleteButton: UIButton!
    @IBOutlet weak var dueDateLabel: UILabel!
    @IBOutlet weak var dueDatePuckerView: UIDatePicker!
    @IBOutlet weak var notesTextView: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    // Call the updateSaveButtonState after button press.
    @IBAction func textEditingChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    // Enable retrun key to dismiss keyboard.
    @IBAction func returnPressed(_ sender: UITextField) {
        titleTextField.resignFirstResponder()
    }
    // If puched deselected. else selected. 
    @IBAction func isCompleteButtonTapped(_ sender: UIButton) {
        isCompleteButton.isSelected = !isCompleteButton.isSelected
    }
    // action for the datepicker.
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        updateDueDateLabel(date: dueDatePuckerView.date)
    }
    
    // Helper method to update the save button.
    // If text is in titleTextField button isEnabled.
    func updateSaveButtonState() {
        let text = titleTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
    
    // Helper method to update the date label
    func updateDueDateLabel(date: Date) {
        dueDateLabel.text = ToDo.dueDateFormatter.string(from: date)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let todo = todo {
            navigationItem.title = "To-Do"
            titleTextField.text = todo.title
            isCompleteButton.isSelected = todo.isComplete
            dueDatePuckerView.date = todo.dueDate
            notesTextView.text = todo.notes
        } else {
            dueDatePuckerView.date = Date().addingTimeInterval(24*60*60)
        }

        updateDueDateLabel(date: dueDatePuckerView.date)
        updateSaveButtonState()
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let normalCellHeight = CGFloat(44)
        let largeCellHeight = CGFloat(200)
        
        switch (indexPath) {
        case [1,0]: // Due Date Cell
            return isPickerHidden ? normalCellHeight : largeCellHeight
        case [2,0]: // Notes Cell
            return largeCellHeight
        default: return normalCellHeight
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch (indexPath) {
        case [1,0]:
            isPickerHidden = !isPickerHidden
            
            dueDateLabel.textColor = isPickerHidden ? .black : tableView.tintColor
            
            tableView.beginUpdates()
            tableView.endUpdates()
        default: break
        }
    }
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        super.prepare(for: segue, sender: sender)
        
        guard segue.identifier == "saveUnwind" else { return }
        
        let title = titleTextField.text!
        let isComplete = isCompleteButton.isSelected
        let dueDate = dueDatePuckerView.date
        let notes = notesTextView.text
        
        todo = ToDo(title: title, isComplete: isComplete, dueDate: dueDate, notes: notes)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
*/  /*
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
*/
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

}
