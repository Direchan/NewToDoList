//
//  ViewController.swift
//  NewToDoList
//
//  Created by t2023-m0091 on 2023/08/28.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var mainImage: UIImageView!
    
    @IBAction func pdvcTapped(_ sender: Any) {
        let vc = ProfileDesginViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadImageFromURL()
        	

    }

    func downloadImageFromURL() {
            guard let imageUrl = URL(string: "https://spartacodingclub.kr/css/images/scc-og.jpg") else {
                print("Invalid URL!")
                return
            }

            let task = URLSession.shared.dataTask(with: imageUrl) { (data, response, error) in
                guard let data = data, error == nil else {
                    print("Error downloading the image: \(error?.localizedDescription ?? "No description")")
                    return
                }
                DispatchQueue.main.async {
                    self.mainImage.image = UIImage(data: data)
                }
            }
            task.resume()
        }
    
    @IBAction func toDoList(_ sender: UIButton) {
    }
    
    
    @IBAction func completedList(_ sender: UIButton) {
    }
    
    }
    
    

