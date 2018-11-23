//
//  FilePickerViewController.swift
//  LearnIos
//
//  Created by 杜李 on 2018/11/23.
//  Copyright © 2018 杜李. All rights reserved.
//

import UIKit
import MediaPlayer

class FilePickerViewController: UIViewController,UIImagePickerControllerDelegate,MPMediaPickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var musicLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func selectImage(_ sender: Any) {
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion:nil)
    }
    //MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Set photoImageView to display the selected image.
        photoImageView.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)

    }
    
    @IBAction func selectMusic(_ sender: Any) {
        let mediaPicker: MPMediaPickerController = MPMediaPickerController(mediaTypes: MPMediaType.music)
        mediaPicker.prompt = "Choose a few songs to play"
        mediaPicker.allowsPickingMultipleItems = false
        mediaPicker.delegate = self
        present(mediaPicker, animated: true)
    }
    func mediaPicker(_ mediaPicker: MPMediaPickerController, didPickMediaItems mediaItemCollection: MPMediaItemCollection) {
        
        dismiss(animated: true, completion: nil)
        playMusic(mediaItemCollection)
    }
    private func playMusic(_ mediaItemCollection: MPMediaItemCollection){
        let musicPlayer: MPMusicPlayerController = MPMusicPlayerController.systemMusicPlayer
        musicLabel.text = "《"+mediaItemCollection.items[0].title!+"》—— "+mediaItemCollection.items[0].artist!
//        print (mediaItemCollection.items[0].title)
        musicPlayer.setQueue(with: mediaItemCollection)
        musicPlayer.play()
    }

}
