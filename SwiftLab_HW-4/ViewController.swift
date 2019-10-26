//
//  ViewController.swift
//  SwiftLab_HW-4
//
//  Created by Grigorij on 26/10/2019.
//  Copyright © 2019 Grigorij Verba. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pickerView: UIPickerView!
    
    let fruitNameEnglish = ["Fruits", "Apricot", "Chery", "Kiwi", "Lemon", "Orange", "Peach", "Pear", "Plum" ]
    let fruitNameRussian = ["Фрукты", "Абрикос", "Вишня", "Киви", "Лимон", "Апельсин", "Персик", "Груша", "Слива"]
    let fruitDescription = [
                                "Фру́кт (лат. fructus — плод) — сочный съедобный плод дерева или кустарника. Фрукты являются важной составляющей пищи человека и многих животных.",
                                "Там, где очень тепло, можно встретить удивительный фрукт в бархатном желто-оранжевом одеянии. Это — абрикос.",
                                "Плоды вишни сочные, приятного кисло-сладкого вкуса и очень полезные. В них много витамина С, Сахаров, солей кальция и железа.",
                                "Киви родом из Китая. Свое название этот фрукт получил за сходство своей формы с телом птички киви, обитающей в Новой Зеландии.",
                                "Лимоны, так же как апельсины и мандарины, относятся к роду цитрусовых растений. Цветы этого дерева душистые. Их лепестки белые или кремовые. Родиной лимона считаются Восточная Индия и Индокитай. Название фрукта произошло, вероятно, от малайского слова «лемо», что означает «полезный для матерей».",
                                "Апельсин — настоящее оранжевое чудо. Его любят дети и взрослые. Если у вас плохое настроение — взгляните на вазу с апельсинами. Оранжевые плоды — солнечные, круглые, красивые, наверняка, поднимут вам настроение. Съешьте ароматный плод и будьте уверены — всё будет хорошо!",
                                "Персик считают деликатесным фруктом. Его рекомендуют для улучшения аппетита, при изжогах и запорах. Витамин А в составе персика важен для зрения, витамин Е - сильный антиоксидант.  косточке персика содержится знаменитый витамин В17 и миндальное масло.",
                                "Плоды груши – природный антибиотик, а еще они обладают противогрибковыми свойствами. В них много питательных волокон, а по содержанию фолиевой кислоты этому фрукту просто нет равных.",
                                "Слива известна людям с незапамятных времён. Родина этого плодового растения – Северный Иран, Малая Азия, Кавказ. Плоды продолговатые, покрытые тонкой гладкой кожурой, то синей с голубоватым оттенком, то бело-розовой, то лилово-красной. Мякоть слив сочная, кисло-сладкая, очень приятная на вкус. В ней располагается удлиненная коричневая косточка с семечком."
                                ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        //imageView.image = nil
        imageView.image = UIImage(named: fruitNameEnglish[0])
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return fruitNameEnglish.count
        } else {
            return fruitNameRussian.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return fruitNameEnglish[row]
        } else {
            return fruitNameRussian[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 1 {
            imageView.image = UIImage(named: fruitNameEnglish[row])
        }
    }
    
    @IBAction func resultButton(_ sender: UIButton) {
        let rowEnglish = pickerView.selectedRow(inComponent: 0)
        let rowRussian = pickerView.selectedRow(inComponent: 1)
        
        var message = ""
        var alertTitle = "Result"
        
        if rowEnglish == rowRussian {
            alertTitle = fruitNameRussian[rowRussian]
            message = fruitDescription[rowRussian]
        } else {
            message = "Неправильно"
        }
        
        let alert = UIAlertController(title: alertTitle, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

