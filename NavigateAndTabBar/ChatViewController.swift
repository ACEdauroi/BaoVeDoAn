//
//  ChatViewController.swift
//  NavigateAndTabBar
//
//  Created by Apple on 26/09/2021.
//

import UIKit
import MessageKit
struct Sender : SenderType {
        var senderId: String
        var displayName: String
}
struct Message: MessageType {
    var sender: SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKind
}

class ChatViewController: MessagesViewController, MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate {
   
    let currentUser = Sender(senderId: "self", displayName: "Thành Nguyễn")
    let otherUser = Sender(senderId: "other", displayName: "Vinholidays Fiesta    ")
    var messages = [MessageType]()

    override func viewDidLoad() {
        super.viewDidLoad()
        messages.append(Message(sender: currentUser, messageId: "1", sentDate: Date().addingTimeInterval(-86400), kind: .text("Chỗ mình còn phòng không ")))
        
        messages.append(Message(sender: otherUser, messageId: "2", sentDate: Date().addingTimeInterval(-66400), kind: .text("Chỗ Cảm ơn quý khách đã quan tâm đến dịch vụ khách sạn của chúng tôi, vui lòng chờ đợi giây lát....")))
        
        
        
        
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
    }
    

    func currentSender() -> SenderType {
        return currentUser
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }
}
