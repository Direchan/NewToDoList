import UIKit

class CompletedList: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ToDoManager.shared.todoList.filter { $0.isCompleted }.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CompletedCell", for: indexPath)
        let completedTasks = ToDoManager.shared.todoList.filter { $0.isCompleted }
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = .byWordWrapping
        cell.textLabel?.text = completedTasks[indexPath.row].title
        return cell
    }

    @IBAction func clearCompletedTasks(_ sender: Any) {
        ToDoManager.shared.todoList.removeAll(where: { $0.isCompleted })
        ToDoManager.shared.saveToUserDefaults()
        tableView.reloadData()
    }
}
