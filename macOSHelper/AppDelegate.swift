//
//  AppDelegate.swift
//  macOSHelper
//
//  Created by Jerry XU on 2023/2/26.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }
    
    @IBAction func 官网(_ sender: NSButton) {
        print("官网")
    }
    
    @IBAction func 开启全部来源(_ sender: NSButton) {
        print("打开全部来源")
    }
    
    @IBAction func 关闭全部来源(_ sender: NSButton) {
        print("关闭全部来源")
    }
    
    @IBAction func 解决已损坏问题(_ sender: NSButton) {
        print("解决“已损坏”问题")
    }
    
    @IBAction func 复制HomeBrew安装命令(_ sender: NSButton) {
        print("重置Dock")
    }
    
    @IBAction func 取消四位密码限制(_ sender: NSButton) {
        print("取消四位密码限制")
    }
    
    @IBAction func 重置Dock(_ sender: NSButton) {
        print("重置Dock")
    }


}

