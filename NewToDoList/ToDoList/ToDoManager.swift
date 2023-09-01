import UIKit

struct TodoItem: Codable {
    var title: String
    var isCompleted: Bool = false
    var category: TodoCategory
}




class ToDoManager {

    static let shared = ToDoManager()

    var todoList: [TodoItem] = []

    private let todoListKey = "todoList"

    private init() {
        if let data = UserDefaults.standard.data(forKey: todoListKey) {
            let decoder = JSONDecoder()
            todoList = (try? decoder.decode([TodoItem].self, from: data)) ?? []
        }
    }

    func saveToUserDefaults() {
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(todoList) {
            UserDefaults.standard.set(data, forKey: todoListKey)
        }
    }
}
