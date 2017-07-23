//
//  CLSNNNetworkNode.swift
//  CLSNearNetworking
//
//  Created by Cc on 2017/2/5.
//  Copyright © 2017年 Cc. All rights reserved.
//

import UIKit

public protocol CLSNNNetworkNodeDelegate: NSObjectProtocol {
    
    func dgClient_EndSendMsgToServer(writer: CLSNNSendDataWriter)
    
    func dgServer_ReceiveMsgFromClient(identifier: Int32, reader: CLSNNReceiveDataReader)
    
    func dgNode_Connected()
}

public class CLSNNNetworkNode: NSObject {

    public weak var  pDelegate: CLSNNNetworkNodeDelegate?
    
    private lazy var pArrDataPackages = NSMutableArray.init()
   
    private let mLock = NSConditionLock.init()
    
    public func fBeginMsg(identifier: Int32, block: (_ writer: CLSNNSendDataWriter)->Void) {
        
        let wri = CLSNNSendDataWriter.init()
        wri.fWriteInt32(identifier)
        block(wri)
        self.pArrDataPackages.add(wri)
        self.fSendAllMsg()
    }
    
    func fSendAllMsg() {
        
        if self.pArrDataPackages.count > 0 {
            
            let tmpW = self.pArrDataPackages.firstObject as? CLSNNSendDataWriter
            if let writer = tmpW {
                
                if writer.pSendState == .eInit {
                    
                    writer.pSendState = .eBeginSendHead
                    self.fOnSendMsgToOther(writer: writer)
                }
                
                if (writer.pSendState == .eSendEnd) {
                    
                    self.pArrDataPackages.remove(writer)
                    self.fSendAllMsg()
                }
            }
        }
    }
    
    func fOnSendMsgToOther(writer: CLSNNSendDataWriter) {
        
        // 子类实现
        assert(false)
        writer.pSendState = .eSendEnd
    }
}

