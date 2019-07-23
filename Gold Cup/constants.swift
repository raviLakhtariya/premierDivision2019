//
//  Constants.swift
//  LogoFInder
//
//  Created by Janki on 04/06/19.
//  Copyright © 2019 ravi. All rights reserved.
//

import Foundation
import UIKit

let  APPDELEGATE =  UIApplication.shared.delegate as! AppDelegate
let preferenceHelper = PreferenceHelper.preferenceHelper    
struct DialogTags {
    static let networkDialog:Int = 400
}
struct  Webservice {
    static let BASE_URL_SEASON = "http://v1.liga.365plus.ro/ajax/get-season"
    static let BASE_URL_LEAGUE = "http://v1.liga.365plus.ro/ajax/get-league"
    static let LOGO_SMALL_URL = "http://v1.liga.365plus.ro/logo/small/"
    static let LOGO_MEDIUM_URL = "http://v1.liga.365plus.ro/logo/medium/"
    /*/2212/logo-827cd74e5038f7df8616c1fd0873b483e4db5bbf.png
     */
}
struct PARAMS {
    static let query = "query"
    static let id_league = "id_league"
    static let id_season = "id_season"
}
struct DateFormat
{
    static let TIME_FORMAT_AM_PM = "hh:mm a"
    static let WEB   = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
    static let CustomFormat = "yyyy-MM-dd HH:mm:ss"
    static let DATE_TIME_FORMAT = "dd MMMM yyyy, HH:mm"
    
    static let HISTORY_TIME_FORMAT = "hh:mm a"
    static let DATE_FORMAT = "yyyy-MM-dd"
    static let DATE_FORMAT_MONTH = "MMMM yyyy"
    static let DATE_MM_DD_YYYY = "MM/dd/yyyy"
    static let TIME_FORMAT_HH_MM = "HH:mm"
    static let DATE_TIME_FORMAT_AM_PM = "yyyy-MM-dd hh:mm a"
    static let SCHEDUALE_DATE_FORMATE = "EEEE d MMMM 'at' HH:mm"
    
    
}
