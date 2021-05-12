//
//  ViewController.swift
//  aaa
//
//  Created by Thomas Canhao Xu on 2020/3/23.
//  Copyright © 2020 Thomas Canhao Xu. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var grid: UITableView!

    var audioPlayer = AVAudioPlayer()
    
    var sounds = [Sound]()

    override func viewDidLoad() {
        super.viewDidLoad()
        grid.delegate = self
        grid.dataSource = self
        
//        let sound = Bundle.main.path(forResource: "mysound", ofType: "mp3")
//
//        do {
//            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
//        }
//        catch{
//            //print{error}
//        }
    }
    func configureSounds(){
        sounds.append(Sound(name: "bang"))
        sounds.append(Sound(name:"shocked"))
    }

    @IBAction func onClickPlaySound(_ sender: Any) {
        audioPlayer.play()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sounds.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let sound = sounds[indexPath.row]
        cell.textLabel?.text = sound.name
        cell.textLabel?.font = UIFont(name:"Helvetica-Bold", size:18)
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //curent sound
        let position = indexPath.row
        //beats
        guard let vc = storyboard?.instantiateViewController(identifier: "player")
        else{
            return
        }
        present(vc, animated:true)
    }
}
struct Sound {
    let name: String
    
}
