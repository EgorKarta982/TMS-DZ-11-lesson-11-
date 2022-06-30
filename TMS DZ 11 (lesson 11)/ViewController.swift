

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    
    let myView = UIView(frame: CGRect(x: 0, y: 500, width: 100, height: 100))
    var isDown = false
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myView.backgroundColor = .darkGray
        self.view.addSubview(myView)
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let image = UIImage(named: "Foto")
        self.imageView.image = image
    }
    
    @IBAction func animationGoButtonPressed(_ sender: UIButton) {
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.moveView()
        }
        timer.fire() //запуск таймера без задержки
        
    }
    
    private func moveView(){
        let position = isDown == true ? self.myView.frame.origin.y - 200 : self.myView.frame.origin.y + 200
        self.isDown = !self.isDown
        
        UIView.animate(withDuration: 0.3) {
            self.myView.frame.origin.y = position
        }
    }
    
    @IBAction func stopTimerButtonPressed(_ sender: UIButton) {
        self.timer.invalidate()
    }
}
