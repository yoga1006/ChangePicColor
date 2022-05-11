//
//  ViewController.swift
//  ChangePicColor
//
//  Created by Yoga on 2022/5/10.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var alphaLabel: UILabel!
    
    
    @IBOutlet weak var picSenment: UISegmentedControl!
    
    
    @IBOutlet weak var cornerRadiusSlider: UISlider!
    @IBOutlet weak var borderWidthSlider: UISlider!
    @IBOutlet weak var shadowSlider: UISlider!
    
    @IBOutlet weak var cornerRadiusSwitch: UISwitch!
    @IBOutlet weak var borderWidthSwitch: UISwitch!
    @IBOutlet weak var shadowSwitch: UISwitch!
    
    @IBOutlet weak var shadowView: UIView!
    
    @IBOutlet weak var pattenImageView: UIImageView!
    
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      //  imageView.frame=CGRect(x: 0, y: 0, width: 250, height: 310)
       // shadowView.frame=CGRect(x: 82, y: 44, width: 250, height: 310)
       // pattenImageView.frame=CGRect(x: 0, y: 0, width: 250, height: 310)
        
        redLabel.text="0"
        blueLabel.text="0"
        greenLabel.text="0"
        alphaLabel.text="0"
       
    }

    
    @IBAction func changeColor(_ sender: Any) {
        
        imageView.backgroundColor=UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
        
        redLabel.text=String(format:"%.2f",redSlider.value)
        blueLabel.text=String(format:"%.2f",blueSlider.value)
        greenLabel.text=String(format:"%.2f",greenSlider.value)
        alphaLabel.text=String(format:"%.2f",alphaSlider.value)
        //希望數字僅顯示到小數點後第二位
        
        
    }
    
    
    @IBAction func random(_ sender: Any) {
        
        redSlider.value=Float.random(in: 0...1)
        blueSlider.value=Float.random(in: 0...1)
        greenSlider.value=Float.random(in: 0...1)
        alphaSlider.value=Float.random(in: 0...1)
        
        imageView.backgroundColor=UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
        
        redLabel.text=String(format:"%.2f",redSlider.value)
        blueLabel.text=String(format:"%.2f",blueSlider.value)
        greenLabel.text=String(format:"%.2f",greenSlider.value)
        alphaLabel.text=String(format:"%.2f",alphaSlider.value)
        
        
    }
    
    
    
    @IBAction func clearAll(_ sender: Any) {
        
        redSlider.value=0
        blueSlider.value=0
        greenSlider.value=0
        alphaSlider.value=0
        
        redLabel.text="0"
        blueLabel.text="0"
        greenLabel.text="0"
        alphaLabel.text="0"
        
        cornerRadiusSwitch.isOn=false
        borderWidthSwitch.isOn=false
        shadowSwitch.isOn=false
        cornerRadiusSlider.value=0
        borderWidthSlider.value=0
        shadowSlider.value=0
        imageView.backgroundColor=UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        imageView.layer.cornerRadius=0
        imageView.layer.borderWidth=0
        imageView.layer.shadowOpacity=0
        
        
    }
    
   //圓角
    @IBAction func cornerRadiusChange(_ sender: Any) {
        
        if cornerRadiusSwitch.isOn{
            
            cornerRadiusSlider.isHidden=false
            //storyboard有先把slider做Hidden的勾選，當switch開啟，Hidden就為false，代表Slider要出現不被Hidden
            
            imageView.clipsToBounds=true
            //若imageview要顯示圓角效果，clipsToBounds要記得設定為true
            imageView.layer.cornerRadius=CGFloat(cornerRadiusSlider.value)
            shadowView.layer.cornerRadius=CGFloat(cornerRadiusSlider.value)
            //陰影面的圓角設定，否則會有白色缺塊
            //相對，陰影的View也要加上圓角，不然執行圓角時會露出四邊會漏陰影的白邊
            pattenImageView.clipsToBounds=true
            pattenImageView.layer.cornerRadius=CGFloat(cornerRadiusSlider.value)
            
        }
        else{
            
            cornerRadiusSlider.isHidden=true
            imageView.layer.cornerRadius=0
            
        }
        
    }
    
    //邊框
    @IBAction func borderWidthChange(_ sender: Any) {
        
        if borderWidthSwitch.isOn{
            
            imageView.layer.borderColor=CGColor(red: 1, green: 1, blue: 1, alpha: 1)
            //設定邊框的顏色
            borderWidthSlider.isHidden=false
            imageView.layer.borderWidth=CGFloat(borderWidthSlider.value)
            //邊框大小由slider的value值得出
        }
        else{
            
            borderWidthSlider.isHidden=true
            imageView.layer.borderWidth=0
            //若將switch關閉，邊框顏色會變清空
        }
        
    }
    
    //陰影
    @IBAction func shadowChange(_ sender: Any) {
        
        if shadowSwitch.isOn{
            
            shadowSlider.isHidden=false
            shadowView.layer.masksToBounds=false
            //超過邊框的sublayers選擇不裁切

            shadowView.layer.shadowColor=UIColor.darkGray.cgColor
            //陰影的顏色
            shadowView.layer.shadowOffset=CGSize(width: 7, height: 7)
            //陰影偏移位置
            shadowView.layer.shadowOpacity=0.3
            //陰影透明度
            shadowView.layer.shadowRadius = CGFloat(shadowSlider.value)
            //陰影擴散範圍
            
        }
        else{
            
            shadowSlider.isHidden=true
            imageView.layer.shadowRadius=0
            
        }
        
    }
    
    
    @IBAction func segmentPicChange(_ sender: Any) {
        
        index=picSenment.selectedSegmentIndex
        
        if index==0{
            
            pattenImageView.isHidden=true
            imageView.backgroundColor=UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
            view.addSubview(imageView)
            imageView.frame=CGRect(x: 82, y: 43, width: 250, height: 310)
           
            
        }
        
        if index==1{
            
            pattenImageView.isHidden=false
            imageView.backgroundColor=UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
            pattenImageView.addSubview(imageView)
            imageView.frame=CGRect(x: 0, y: 0, width: 250, height: 310)
            shadowView.frame=CGRect(x: 82, y: 44, width: 250, height: 310)
            pattenImageView.frame=CGRect(x: 0, y: 0, width: 250, height: 310)
        
        }
        
    }
    
    
    
}

