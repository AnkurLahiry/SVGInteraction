//
//  SVGDetailsViewControllerViewController.swift
//  SVGInteraction
//
//  Created by Ankur Lahiry on 6/12/19.
//  Copyright © 2019 Prefeex. All rights reserved.
//

import UIKit

class SVGDetailsViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //segueFromContainerToLayout
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueFromContainerToLayout" {
            let destination = (segue.destination as! SVGLayoutViewController)
            destination.delegate = self
        }
    }
}

extension SVGDetailsViewController : SVGLayoutViewControllerDelegate {
    func getId(id : String?) {
        if let name = Helper.getCountryName(id : id) {
            nameLabel.text = name
        }
    }
}

let countryDict = [
    "AF" : "Afghanistan",
    "AO" : "Angola",
    "AL" : "Albania",
    "AE" : "United Arab Emirates",
    "AR" : "Argentina",
    "AM" : "Armenia",
    "AU" : "Australia",
    "AT" : "Austria",
    "AZ" : "Azerbaijan",
    "BI" : "Burundi",
    "BE" : "Belgium",
    "BJ" : "Benin",
    "BF" : "Burkina Faso",
    "BD" : "Bangladesh",
    "BG" : "Bulgaria",
    "BA" : "Bosnia and Herzegovina",
    "BY" : "Belarus",
    "BZ" : "Belize",
    "BO" : "Bolivia",
    "BR" : "Brazil",
    "BN" : "Brunei Darussalam",
    "BT" : "Bhutan",
    "BW" : "Botswana",
    "CF" : "Central African Republic",
    "CA" : "Canada",
    "CH" : "Switzerland",
    "CL" : "Chile",
    "CN" : "China",
    "CI" : "Côte d'Ivoire",
    "CM" : "Cameroon",
    "CD" : "Democratic Republic of the Congo",
    "CG" : "Republic of Congo",
    "CO" : "Colombia",
    "CR" : "Costa Rica",
    "CU" : "Cuba",
    "CZ" : "Czech Republic",
    "DE" : "Germany",
    "DJ" : "Djibouti",
    "DK" : "Denmark",
    "DO" : "Dominican Republic",
    "DZ" : "Algeria",
    "EC" : "Ecuador",
    "EG" : "Egypt",
    "ER" : "Eritrea",
    "EE" : "Estonia",
    "ET" : "Ethiopia",
    "FI" : "Finland",
    "FJ" : "Fiji",
    "GA" : "Gabon",
    "GB" : "United Kingdom",
    "GE" : "Georgia",
    "GH" : "Ghana",
    "GN" : "Guinea",
    "GM" : "The Gambia",
    "GW" : "Guinea-Bissau",
    "GQ" : "Equatorial Guinea",
    "GR" : "Greece",
    "GL" : "Greenland",
    "GT" : "Guatemala",
    "GY" : "Guyana",
    "HN" : "Honduras",
    "HR" : "Croatia",
    "HT" : "Haiti",
    "HU" : "Hungary",
    "ID" : "Indonesia",
    "IN" : "India",
    "IE" : "Ireland",
    "IR" : "Iran",
    "IQ" : "Iraq",
    "IS" : "Iceland",
    "IL" : "Israel",
    "IT" : "Italy",
    "JM" : "Jamaica",
    "JO" : "Jordan",
    "JP" : "Japan",
    "KZ" : "Kazakhstan",
    "KE" : "Kenya",
    "KG" : "Kyrgyzstan",
    "KH" : "Cambodia",
    "KR" : "Republic of Korea",
    "XK" : "Kosovo",
    "KW" : "Kuwait",
    "LA" : "Lao PDR",
    "LB" : "Lebanon",
    "LR" : "Liberia",
    "LY" : "Libya",
    "LK" : "Sri Lanka",
    "LS" : "Lesotho",
    "LT" : "Lithuania",
    "LU" : "Luxembourg",
    "LV" : "Latvia",
    "MA" : "Morocco",
    "MD" : "Moldova",
    "MG" : "Madagascar",
    "MX" : "Mexico",
    "MK" : "Macedonia",
    "ML" : "Mali",
    "MM" : "Myanmar",
    "ME" : "Montenegro",
    "MN" : "Mongolia",
    "MZ" : "Mozambique",
    "MR" : "Mauritania",
    "MW" : "Malawi",
    "MY" : "Malaysia",
    "NA" : "Namibia",
    "NE" : "Niger",
    "NG" : "Nigeria",
    "NI" : "Nicaragua",
    "NL" : "Netherlands",
    "NO" : "Norway",
    "NP" : "Nepal",
    "NZ" : "New Zealand",
    "OM" : "Oman",
    "PK" : "Pakistan",
    "PA" : "Panama",
    "PE" : "Peru",
    "PH" : "Philippines",
    "PG" : "Papua New Guinea",
    "PL" : "Poland",
    "KP" : "Dem. Rep. Korea",
    "PT" : "Portugal",
    "PY" : "Paraguay",
    "PS" : "Palestine",
    "QA" : "Qatar",
    "RO" : "Romania",
    "RU" : "Unnamed",
    "RW" : "Rwanda",
    "EH" : "Western Sahara",
    "SA" : "Saudi Arabia",
    "SD" : "Sudan",
    "SS" : "South Sudan",
    "SN" : "Senegal",
    "SL" : "Sierra Leone",
    "SV" : "El Salvador",
    "RS" : "Serbia",
    "SR" : "Suriname",
    "SK" : "Slovakia",
    "SI" : "Slovenia",
    "SE" : "Sweden",
    "SZ" : "Swaziland",
    "SY" : "Syria",
    "TD" : "Chad",
    "TG" : "Togo",
    "TH" : "Thailand",
    "TJ" : "Tajikistan",
    "TM" : "Turkmenistan",
    "TL" : "Timor-Leste",
    "TN" : "Tunisia",
    "TR" : "Turkey",
    "TW" : "Taiwan",
    "TZ" : "Tanzania",
    "UG" : "Uganda",
    "UA" : "Ukraine",
    "UY" : "Uruguay",
    "US" : "United States",
    "UZ" : "Uzbekistan",
    "VE" : "Venezuela",
    "VN" : "Vietnam",
    "VU" : "Vanuatu",
    "YE" : "Yemen",
    "ZA" : "South Africa",
    "ZM" : "Zambia",
    "ZW" : "Zimbabwe",
    "SO" : "Somalia",
    "GF" : "France",
    "FR" : "France",
    "ES" : "Spain",
    "AW" : "Aruba",
    "AI" : "Anguilla",
    "AD" : "Andorra",
    "AG" : "Antigua and Barbuda",
    "BS" : "Bahamas",
    "BM" : "Bermuda",
    "BB" : "Barbados",
    "KM" : "Comoros",
    "CV" : "Cape Verde",
    "KY" : "Cayman Islands",
    "DM" : "Dominica",
    "FK" : "Falkland Islands",
    "FO" : "Faeroe Islands",
    "GD" : "Grenada",
    "HK" : "Hong Kong",
    "KN" : "Saint Kitts and Nevis",
    "LC" : "Saint Lucia",
    "LI" : "Liechtenstein",
    "MF" : "Saint Martin (French)",
    "MV" : "Maldives",
    "MT" : "Malta",
    "MS" : "Montserrat",
    "MU" : "Mauritius",
    "NC" : "New Caledonia",
    "NR" : "Nauru",
    "PN" : "Pitcairn Islands",
    "PR" : "Puerto Rico",
    "PF" : "French Polynesia",
    "SG" : "Singapore",
    "SB" : "Solomon Islands",
    "ST" : "São Tomé and Principe",
    "SX" : "Saint Martin (Dutch)",
    "SC" : "Seychelles",
    "TC" : "Turks and Caicos Islands",
    "TO" : "Tonga",
    "TT" : "Trinidad and Tobago",
    "VC" : "Saint Vincent and the Grenadines",
    "VG" : "British Virgin Islands",
    "VI" : "United States Virgin Islands",
    "CY" : "Cyprus",
    "RE" : "Reunion (France)",
    "YT" : "Mayotte (France)",
    "MQ" : "Martinique (France)",
    "GP" : "Guadeloupe (France)",
    "CW" : "Curaco (Netherlands)",
    "IC" : "Canary Islands (Spain)"
]

class Helper {
    static func getCountryName(id : String?) -> String? {
        guard let id = id else {
            return nil
        }
        if let name = countryDict[id] {
            return name
        }
        return nil
    }
}
