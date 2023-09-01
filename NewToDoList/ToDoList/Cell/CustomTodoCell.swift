import UIKit

class CustomToDoCell: UITableViewCell {
    
    @IBOutlet weak var todoLabel: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var toggleSwitch: UISwitch!

    
    var deleteAction: (() -> Void)?
    var toggleAction: ((Bool) -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        // 초기화
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    //삭제 액션
    @IBAction func deleteButtonTapped(_ sender: UIButton) {
        deleteAction?()
    }

    //토글 스위치 액션
    @IBAction func switchValueChanged(_ sender: UISwitch) {
        toggleAction?(sender.isOn)
    }
}
