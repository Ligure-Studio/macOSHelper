//
//  ViewController.swift
//  macOSHelper
//
//  Created by Jerry XU on 2023/2/26.
//

import Cocoa

class ViewController: NSViewController {

    
    @IBAction func 官网(_ sender: NSButton) {
        NSWorkspace.shared.open(URL(string: "https://ligure.cn")!)
    }
    
    @IBAction func 开启全部来源(_ sender: NSButton) {
        runScript("do shell script \"sudo spctl --master-disable\" with administrator privileges")
        alert("完成！", "已开启✅")
    }
    
    @IBAction func 关闭全部来源(_ sender: NSButton) {
        runScript("do shell script \"sudo spctl --master-enable\" with administrator privileges")
        alert("完成！", "已关闭✅")
    }
    
    @IBAction func 解决已损坏问题(_ sender: NSButton) {
        let openURL = showOpenPanel()
        if openURL != "failed"
        {
            runScript("do shell script \"sudo xattr -r -d com.apple.quarantine " + openURL + "\" with administrator privileges")
            alert("完成！", "已解决✅")
        }
    }
    
    @IBAction func 复制HomeBrew安装命令(_ sender: NSButton) {
        copyStringToPasteboard(string: "/bin/bash -c \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\"")
        alert("完成！", "✅")
    }
    
    @IBAction func 取消四位密码限制(_ sender: NSButton) {
        runScript("do shell script \"pwpolicy -clearaccountpolicies\" with administrator privileges")
        alert("完成！", "已取消✅")
    }
    
    @IBAction func 重置Dock(_ sender: NSButton) {
        if (dialog("确定", "取消", "警告⚠️！", "是否确认重置？此操作会将Dock恢复为出厂设置"))
        {
            runScript("do shell script \"defaults delete com.apple.dock; killall Dock\" with administrator privileges")
            alert("已重置！", "✅")
        }
        else
        {
            alert("将不会重置！", "✅")
        }
    }
    
    @IBAction func 安装XcodeCLT(_ sender: NSButton) {
        alert("提示", "如关闭此窗口后未弹出安装窗口，可能您已安装Xcode CLT")
        runScript("xcode-select --install")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

