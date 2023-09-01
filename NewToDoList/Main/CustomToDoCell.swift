//import UIKit
//
//class CustomToDoCell: UITableViewCell {
//
//    @IBOutlet weak var todoLabel: UILabel!
//    @IBOutlet weak var deleteButton: UIButton!
//    @IBOutlet weak var toggleSwitch: UISwitch!
//
//    var deleteAction: (() -> Void)?
//    var toggleAction: ((Bool) -> Void)?
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//    }
//
//    @IBAction func deleteButtonTapped(_ sender: UIButton) {
//        deleteAction?()
//    }
//
//    @IBAction func switchValueChanged(_ sender: UISwitch) {
//        toggleAction?(sender.isOn)
//    }
//}
