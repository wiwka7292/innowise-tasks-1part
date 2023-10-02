//
//  ViewController.swift
//  task_5
//
//  Created by Жека on 01/10/2023.
//

/*
 Профиль обновляется каждые 5 секунда на другой профиль.
 Значение статистика профиля( likes, comments, views, userRecommends....) обновляются рандомно кодом.
 */
import UIKit

class MainVC: UIViewController {
    
    var numberOfUsers = 56
    var timer: Timer?
    var counter = 0
    var usersArray = ["Izabella Zhang, Mariot Cort, Donald Duck, Micky Mouse, Tom Jerry, Carl Tissot, James Bond, Piotr Karlovski, Konstanta Slovetskiy, Vasily Basta"]
    
    var mainView: MainView { view as! MainView}
    
    override func loadView() {
        view = MainView()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateRandomProfile()
        timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(runFunction), userInfo: nil, repeats: true)
    }
    
    @objc func runFunction() {
        if counter < 10 {
            generateRandomProfile()
            counter += 1
        } else {
            timer?.invalidate()
            timer = nil
        }
    }
    
    
    
    func generateRandomProfile(){
        let recommendUsers = Int.random(in: 1...56)
        mainView.recommendUsersLabel.text = "\(recommendUsers) / \(numberOfUsers)"
        
        let postViews = Int.random(in: 100...9999)
        mainView.userViewsButton.setTitle("\(postViews)", for: .normal)
        
        let postLikes = Int.random(in: 50...999)
        mainView.userLikesButton.setTitle("\(postLikes)", for: .normal)
        
        let postComments = Int.random(in: 1...999)
        mainView.userCommentsButton.setTitle("\(postComments)", for: .normal)
        
        let onlineStatus = Int.random(in: 1...8)
        mainView.onlineStatusLabel.text = "\(onlineStatus) Days Ago"
        
        let sumOfRecommendUser = Int.random(in: 5...60)
        mainView.othersRecommendUsers.setTitle("+\(sumOfRecommendUser)", for: .normal)
        
        guard let nextName = getNextName() else {
                return
            }
        
        mainView.profileNameLabel.text = nextName
    }
    
    func getNextName() -> String? {
        let names = usersArray[0].components(separatedBy: ", ")
        let nextName = names[counter]
        counter += 1
        
        return nextName
    }
}

