class BootStrapData {
    
    static loadLicenseClassData() {

        // Nedenstående er taget fra DBTU turneringsrelement.
        def pusling = new LicenseClassAge(id: 1, ageFrom: 0, ageTo: 10).save()    // puslinge
        def yngre = new LicenseClassAge(id: 2, ageFrom: 11, ageTo: 12).save()   // yngre p/d
        def pige = new LicenseClassAge(id: 3, ageFrom: 13, ageTo: 14).save()   // pige/dreng
        def junior = new LicenseClassAge(id: 4, ageFrom: 15, ageTo: 17).save()   // junior
        def u21 = new LicenseClassAge(id: 5, ageFrom: 18, ageTo: 21).save()   // u21
        def senior = new LicenseClassAge(id: 6, ageFrom: 22, ageTo: 34).save()   // senior
        def oldBoys = new LicenseClassAge(id: 7, ageFrom: 35, ageTo: 99).save()   // old boys
        def oldGirls = new LicenseClassAge(id: 8, ageFrom: 30, ageTo: 99).save()   // old girls

        def licenseClassOne = new LicenseClassPrice(id: 1, price: 500000).save();
        def licenseClassTwo = new LicenseClassPrice(id: 2, price: 400000).save();
        def licenseClassThree = new LicenseClassPrice(id: 3, price: 300000).save();
        def licenseClassFour = new LicenseClassPrice(id: 4, price: 200000).save();
        def licenseClassFive = new LicenseClassPrice(id: 5, price: 100000).save();
        def licenseClassSix = new LicenseClassPrice(id: 6, price: 50000).save();

        new LicenseClass(id: 1, className: "Puslinge Drenge D", gender: "0", minRating: 0, maxRating: 949, price: licenseClassSix, age: pusling).save()
        new LicenseClass(id: 2, className: "Puslinge Drenge C", gender: "0", minRating: 950, maxRating: 999, price: licenseClassSix, age: pusling).save()
        new LicenseClass(id: 3, className: "Puslinge Drenge B", gender: "0", minRating: 1000, maxRating: 1049, price: licenseClassSix, age: pusling).save()
        new LicenseClass(id: 4, className: "Puslinge Drenge A", gender: "0", minRating: 1050, maxRating: 9999, price: licenseClassFive, age: pusling).save()
        new LicenseClass(id: 5, className: "Yngre Drenge C", gender:    "0", minRating: 1000, maxRating: 1099, price: licenseClassSix, age: yngre).save()
        new LicenseClass(id: 6, className: "Yngre Drenge B", gender:    "0", minRating: 1100, maxRating: 1199, price: licenseClassSix, age: yngre).save()
        new LicenseClass(id: 7, className: "Yngre Drenge A", gender:    "0", minRating: 1200, maxRating: 9999, price: licenseClassFive, age: yngre).save()
        new LicenseClass(id: 8, className: "Drenge D", gender:          "0", minRating: 0, maxRating: 1049, price: licenseClassSix, age: pige).save()
        new LicenseClass(id: 9, className: "Drenge C", gender:          "0", minRating: 1050, maxRating: 1149, price: licenseClassSix, age: pige).save()
        new LicenseClass(id: 10, className: "Drenge B", gender:         "0", minRating: 1150, maxRating: 1449, price: licenseClassFive, age: pige).save()
        new LicenseClass(id: 11, className: "Drenge A", gender:         "0", minRating: 1450, maxRating: 9999, price: licenseClassFour, age: pige).save()
        new LicenseClass(id: 12, className: "Herre Junior C", gender:   "0", minRating: 0, maxRating: 1249, price: licenseClassSix, age: junior).save()
        new LicenseClass(id: 13, className: "Herre Junior B", gender:   "0", minRating: 1250, maxRating: 1649, price: licenseClassThree, age: junior).save()
        new LicenseClass(id: 14, className: "Herre Junior A", gender:   "0", minRating: 1650, maxRating: 9999, price: licenseClassTwo, age: junior).save()
        new LicenseClass(id: 15, className: "U21 B", gender:            "0", minRating: 0, maxRating: 1999, price: licenseClassThree, age: u21).save()
        new LicenseClass(id: 16, className: "U21 A", gender:            "0", minRating: 2000, maxRating: 9999, price: licenseClassTwo, age: u21).save()
        new LicenseClass(id: 17, className: "Klasse 5", gender:         "0", minRating: 0, maxRating: 1299, price: licenseClassSix, age: senior).save()
        new LicenseClass(id: 18, className: "Klasse 4", gender:         "0", minRating: 1300, maxRating: 1499, price: licenseClassFive, age: senior).save()
        new LicenseClass(id: 19, className: "Klasse 3", gender:         "0", minRating: 1500, maxRating: 1699, price: licenseClassFour, age: senior).save()
        new LicenseClass(id: 20, className: "Klasse 2", gender:         "0", minRating: 1700, maxRating: 1999, price: licenseClassThree, age: senior).save()
        new LicenseClass(id: 21, className: "Klasse 1", gender:         "0", minRating: 2000, maxRating: 2299, price: licenseClassTwo, age: senior).save()
        new LicenseClass(id: 22, className: "Elite", gender:            "0", minRating: 2300, maxRating: 9999, price: licenseClassOne, age: senior).save()
        new LicenseClass(id: 23, className: "Old Boys C", gender:       "0", minRating: 0, maxRating: 1499, price: licenseClassSix, age: oldBoys).save()
        new LicenseClass(id: 24, className: "Old Boys B", gender:       "0", minRating: 1500, maxRating: 1699, price: licenseClassSix, age: oldBoys).save()
        new LicenseClass(id: 25, className: "Old Boys A", gender:       "0", minRating: 1700, maxRating: 9999, price: licenseClassSix, age: oldBoys).save()

        new LicenseClass(id: 26, className: "Puslinge Pige", gender:    "1", minRating: 0, maxRating: 9999, price: licenseClassSix, age: pusling).save()
        new LicenseClass(id: 27, className: "Yngre Pige B", gender:     "1", minRating: 0, maxRating: 1049, price: licenseClassSix, age: yngre).save()
        new LicenseClass(id: 28, className: "Yngre Pige A", gender:     "1", minRating: 1050, maxRating: 9999, price: licenseClassFive, age: yngre).save()
        new LicenseClass(id: 29, className: "Pige B", gender:           "1", minRating: 0, maxRating: 1149, price: licenseClassSix, age: pige).save()
        new LicenseClass(id: 30, className: "Pige A", gender:           "1", minRating: 1150, maxRating: 9999, price: licenseClassFive, age: pige).save()
        new LicenseClass(id: 31, className: "Dame Junior B", gender:    "1", minRating: 0, maxRating: 1249, price: licenseClassSix, age: junior).save()
        new LicenseClass(id: 32, className: "Dame Junior A", gender:    "1", minRating: 1250, maxRating: 9999, price: licenseClassFive, age: junior).save()
        new LicenseClass(id: 33, className: "U21", gender:              "1", minRating: 0, maxRating: 9999, price: licenseClassTwo, age: u21).save()
        new LicenseClass(id: 34, className: "Klasse 4", gender:         "1", minRating: 0, maxRating: 1099, price: licenseClassFive, age: senior).save()
        new LicenseClass(id: 35, className: "Klasse 3", gender:         "1", minRating: 1100, maxRating: 1249, price: licenseClassFour, age: senior).save()
        new LicenseClass(id: 36, className: "Klasse 2", gender:         "1", minRating: 1250, maxRating: 1499, price: licenseClassThree, age: senior).save()
        new LicenseClass(id: 37, className: "Klasse 1", gender:         "1", minRating: 1500, maxRating: 1749, price: licenseClassTwo, age: senior).save()
        new LicenseClass(id: 38, className: "Elite", gender:            "1", minRating: 1750, maxRating: 9999, price: licenseClassOne, age: senior).save()
        new LicenseClass(id: 39, className: "Old Girls", gender:        "1", minRating: 0, maxRating: 9999, price: licenseClassSix, age: oldGirls).save()
    }
}