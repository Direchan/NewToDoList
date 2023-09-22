import UIKit

enum TodoCategory: String, CaseIterable, Codable {
    case work = "Work"
    case life = "Life"
    case others = "Others"
}

class ToDoList: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableView.automaticDimension  // 행 높이를 동적으로 설정

    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return TodoCategory.allCases.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let currentCategory = TodoCategory.allCases[section]
        return ToDoManager.shared.todoList.filter { $0.category == currentCategory }.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? CustomToDoCell {
            if cell.todoLabel.numberOfLines == 1 {
                cell.todoLabel.numberOfLines = 0
                cell.todoLabel.lineBreakMode = .byWordWrapping  // 여기를 추가하세요
            } else {
                cell.todoLabel.numberOfLines = 1
                cell.todoLabel.lineBreakMode = .byTruncatingTail
            }
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }


    //section에 따른 table 생성
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as! CustomToDoCell
        let currentCategory = TodoCategory.allCases[indexPath.section]
        let itemsInCurrentCategory = ToDoManager.shared.todoList.filter { $0.category == currentCategory }
        
        let item = itemsInCurrentCategory[indexPath.row]
        cell.todoLabel.numberOfLines = 1
        cell.todoLabel.lineBreakMode = .byTruncatingTail
        cell.todoLabel.text = item.title
        cell.alpha = item.isCompleted ? 0.3 : 1
        cell.todoLabel.textColor = item.isCompleted ? UIColor.lightGray : UIColor.black
        cell.toggleSwitch.isOn = item.isCompleted

        cell.toggleAction = { [weak self] isOn in
            if let indexInOriginalList = ToDoManager.shared.todoList.firstIndex(where: { $0.title == item.title && $0.category == item.category }) {
                ToDoManager.shared.todoList[indexInOriginalList].isCompleted = isOn
                ToDoManager.shared.saveToUserDefaults()
                self?.tableView.reloadRows(at: [indexPath], with: .automatic)
            }
        }
        
        // 삭제 기능
        cell.deleteAction = { [weak self] in
            if let indexInOriginalList = ToDoManager.shared.todoList.firstIndex(where: { $0.title == item.title && $0.category == item.category }) {
                ToDoManager.shared.todoList.remove(at: indexInOriginalList)
                ToDoManager.shared.saveToUserDefaults()
                self?.tableView.reloadData()
            }
        }
        
        return cell
    }
    
   
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return TodoCategory.allCases[section].rawValue
    }

    @IBAction func addButton(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "할 일 추가", message: "\n\n\n\n\n\n\n\n", preferredStyle: .alert) 
        let pickerView = UIPickerView(frame: CGRect(x: 0, y: 50, width: 250, height: 120))
        pickerView.dataSource = self
        pickerView.delegate = self
        
        alertController.view.addSubview(pickerView)

        
        alertController.addTextField { (textField) in
            textField.placeholder = "할 일"
        }
        
        let addAction = UIAlertAction(title: "확인", style: .default) { [weak self] (action) in
                if let todoItemTitle = alertController.textFields?.first?.text, !todoItemTitle.isEmpty {
                    let selectedCategory = TodoCategory.allCases[pickerView.selectedRow(inComponent: 0)]
                    let item = TodoItem(title: todoItemTitle, isCompleted: false, category: selectedCategory)
                    ToDoManager.shared.todoList.append(item)
                    ToDoManager.shared.saveToUserDefaults()
                    self?.tableView.reloadData()
                }
            }
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
}

extension ToDoList: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return TodoCategory.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return TodoCategory.allCases[row].rawValue
    }
}




