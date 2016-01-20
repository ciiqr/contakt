//
//  ContactLoader.swift
//  contakt
//
//  Created by William Villeneuve on 2016-01-19.
//  Copyright © 2016 William Villeneuve. All rights reserved.
//

import Foundation

class ContactLoader {
    
    // TODO: Should load this from some data store(core data, sqlite, etc.) instead... This was just quick to do with sublime-text
    //      I could have loaded it from json directly but NSJSONSerialization.JSONObjectWithData leads to quite messy code in swift and I wanted to avoid external libraries initially
    static func loadContacts(handler: ([Contact]) -> Void)
    {
        handler([
            Contact(firstName: "Jamie", middleName: "Derrick", lastName: "Adams", nickName: "bigsnake521", gender: .Female, contactMethods: [
                ContactMethod(.Email("jamie.adams@example.com"), label: "main"),
                ]),
            Contact(firstName: "Alan", middleName: "Willie", lastName: "Adams", nickName: "brownmeercat838", gender: .Male, contactMethods: [
                ContactMethod(.Phone("(061)486-7596"), label: "home"),
                ContactMethod(.Phone("(040)3588-057"), label: "cell")
                ]),
            Contact(firstName: "Mark", middleName: "Letitia", lastName: "Adams", nickName: "silverwolf567", gender: .Male, contactMethods: [
                ContactMethod(.Email("mark.adams@example.com"), label: "main"),
                ContactMethod(.Phone("(064)780-6860"), label: "home"),
                ContactMethod(.Phone("(042)7266-569"), label: "cell")
                ]),
            Contact(firstName: "Allen", middleName: "Josephine", lastName: "Austin", nickName: "heavymeercat174", gender: .Male, contactMethods: [
                ContactMethod(.Email("allen.austin@example.com"), label: "main"),
                ContactMethod(.Phone("(084)211-0962"), label: "home"),
                ContactMethod(.Phone("(048)7697-553"), label: "cell")
                ]),
            Contact(firstName: "Vanessa", middleName: "Aubree", lastName: "Austin", nickName: "orangegoose545", gender: .Female, contactMethods: [
                ContactMethod(.Email("vanessa.austin@example.com"), label: "main"),
                ContactMethod(.Phone("(009)723-9747"), label: "home"),
                ContactMethod(.Phone("(046)3263-028"), label: "cell")
                ]),
            Contact(firstName: "Suzanne", middleName: "Marc", lastName: "Bailey", nickName: "blackdog981", gender: .Female, contactMethods: [
                ContactMethod(.Email("suzanne.bailey@example.com"), label: "main"),
                ContactMethod(.Phone("(001)396-8146"), label: "home"),
                ContactMethod(.Phone("(040)4166-688"), label: "cell")
                ]),
            Contact(firstName: "Billy", middleName: "Danielle", lastName: "Bailey", nickName: "blackgorilla293", gender: .Male, contactMethods: [
                ContactMethod(.Email("billy.bailey@example.com"), label: "main"),
                ContactMethod(.Phone("(027)656-8095"), label: "home"),
                ContactMethod(.Phone("(041)1802-801"), label: "cell")
                ]),
            Contact(firstName: "Rita", middleName: "Madison", lastName: "Baker", nickName: "browngorilla259", gender: .Female, contactMethods: [
                ContactMethod(.Email("rita.baker@example.com"), label: "main"),
                ContactMethod(.Phone("(088)412-8149"), label: "home"),
                ContactMethod(.Phone("(049)9348-777"), label: "cell")
                ]),
            Contact(firstName: "Katrina", middleName: "Fred", lastName: "Baker", nickName: "crazyladybug964", gender: .Female, contactMethods: [
                ContactMethod(.Email("katrina.baker@example.com"), label: "main"),
                ContactMethod(.Phone("(031)222-2181"), label: "home"),
                ContactMethod(.Phone("(045)6365-889"), label: "cell")
                ]),
            Contact(firstName: "Sue", middleName: "Ivan", lastName: "Byrd", nickName: "organicelephant239", gender: .Female, contactMethods: [
                ContactMethod(.Email("sue.byrd@example.com"), label: "main"),
                ContactMethod(.Phone("(050)646-7219"), label: "home"),
                ContactMethod(.Phone("(048)9164-914"), label: "cell")
                ]),
            Contact(firstName: "Mary", middleName: "Ray", lastName: "Byrd", nickName: "purpleelephant375", gender: .Female, contactMethods: [
                ContactMethod(.Email("mary.byrd@example.com"), label: "main"),
                ContactMethod(.Phone("(013)003-7989"), label: "home"),
                ContactMethod(.Phone("(040)7594-278"), label: "cell")
                ]),
            Contact(firstName: "Ernest", middleName: "Hunter", lastName: "Byrd", nickName: "ticklishfrog134", gender: .Male, contactMethods: [
                ContactMethod(.Email("ernest.byrd@example.com"), label: "main"),
                ContactMethod(.Phone("(033)177-3172"), label: "home"),
                ContactMethod(.Phone("(046)3503-567"), label: "cell")
                ]),
            Contact(firstName: "Kevin", middleName: "Dean", lastName: "Byrd", nickName: "yellowfrog827", gender: .Male, contactMethods: [
                ContactMethod(.Email("kevin.byrd@example.com"), label: "main"),
                ContactMethod(.Phone("(035)257-5545"), label: "home"),
                ContactMethod(.Phone("(048)9250-638"), label: "cell")
                ]),
            Contact(firstName: "Lance", middleName: "Shawn", lastName: "Caldwell", nickName: "blacktiger377", gender: .Male, contactMethods: [
                ContactMethod(.Email("lance.caldwell@example.com"), label: "main"),
                ContactMethod(.Phone("(071)606-3141"), label: "home"),
                ContactMethod(.Phone("(045)9738-406"), label: "cell")
                ]),
            Contact(firstName: "Kenneth", middleName: "Shelly", lastName: "Caldwell", nickName: "brownpanda597", gender: .Male, contactMethods: [
                ContactMethod(.Email("kenneth.caldwell@example.com"), label: "main"),
                ContactMethod(.Phone("(049)006-8573"), label: "home"),
                ContactMethod(.Phone("(040)3224-267"), label: "cell")
                ]),
            Contact(firstName: "Lesa", middleName: "Christina", lastName: "Curtis", nickName: "redbird402", gender: .Female, contactMethods: [
                ContactMethod(.Email("lesa.curtis@example.com"), label: "main"),
                ContactMethod(.Phone("(081)137-2019"), label: "home"),
                ContactMethod(.Phone("(045)5874-899"), label: "cell")
                ]),
            Contact(firstName: "Stanley", middleName: "Amber", lastName: "Curtis", nickName: "redbutterfly143", gender: .Male, contactMethods: [
                ContactMethod(.Email("stanley.curtis@example.com"), label: "main"),
                ContactMethod(.Phone("(076)792-4303"), label: "home"),
                ContactMethod(.Phone("(040)4581-139"), label: "cell")
                ]),
            Contact(firstName: "Kristen", middleName: "Bernice", lastName: "Curtis", nickName: "ticklishduck471", gender: .Female, contactMethods: [
                ContactMethod(.Email("kristen.curtis@example.com"), label: "main"),
                ContactMethod(.Phone("(035)030-2574"), label: "home"),
                ContactMethod(.Phone("(047)1566-700"), label: "cell")
                ]),
            Contact(firstName: "Lois", middleName: "Elsie", lastName: "Curtis", nickName: "tinyfrog364", gender: .Female, contactMethods: [
                ContactMethod(.Email("lois.curtis@example.com"), label: "main"),
                ContactMethod(.Phone("(048)180-5041"), label: "home"),
                ContactMethod(.Phone("(040)3089-033"), label: "cell")
                ]),
            Contact(firstName: "Edna", middleName: "Herbert", lastName: "Curtis", nickName: "tinygorilla482", gender: .Female, contactMethods: [
                ContactMethod(.Email("edna.curtis@example.com"), label: "main"),
                ContactMethod(.Phone("(094)006-0236"), label: "home"),
                ContactMethod(.Phone("(046)9993-874"), label: "cell")
                ]),
            Contact(firstName: "Martin", middleName: "Micheal", lastName: "Daniels", nickName: "blackswan535", gender: .Male, contactMethods: [
                ContactMethod(.Email("martin.daniels@example.com"), label: "main"),
                ContactMethod(.Phone("(038)215-1371"), label: "home"),
                ContactMethod(.Phone("(047)6473-055"), label: "cell")
                ]),
            Contact(firstName: "Wanda", middleName: "Carter", lastName: "Daniels", nickName: "brownelephant947", gender: .Female, contactMethods: [
                ContactMethod(.Email("wanda.daniels@example.com"), label: "main"),
                ContactMethod(.Phone("(018)402-7472"), label: "home"),
                ContactMethod(.Phone("(040)7757-084"), label: "cell")
                ]),
            Contact(firstName: "Olivia", middleName: "Anne", lastName: "Daniels", nickName: "purpletiger468", gender: .Female, contactMethods: [
                ContactMethod(.Email("olivia.daniels@example.com"), label: "main"),
                ContactMethod(.Phone("(036)212-6317"), label: "home"),
                ContactMethod(.Phone("(048)5980-240"), label: "cell")
                ]),
            Contact(firstName: "Ricardo", middleName: "Sally", lastName: "Daniels", nickName: "silvermeercat877", gender: .Male, contactMethods: [
                ContactMethod(.Email("ricardo.daniels@example.com"), label: "main"),
                ContactMethod(.Phone("(090)436-2066"), label: "home"),
                ContactMethod(.Phone("(044)7487-164"), label: "cell")
                ]),
            Contact(firstName: "Cecil", middleName: "Gina", lastName: "Davidson", nickName: "beautifulrabbit165", gender: .Male, contactMethods: [
                ContactMethod(.Email("cecil.davidson@example.com"), label: "main"),
                ContactMethod(.Phone("(013)815-0736"), label: "home"),
                ContactMethod(.Phone("(047)9654-895"), label: "cell")
                ]),
            Contact(firstName: "Leslie", middleName: "Bessie", lastName: "Dunn", nickName: "bluewolf355", gender: .Male, contactMethods: [
                ContactMethod(.Email("leslie.dunn@example.com"), label: "main"),
                ContactMethod(.Phone("(008)679-0839"), label: "home"),
                ContactMethod(.Phone("(040)7807-879"), label: "cell")
                ]),
            Contact(firstName: "Joshua", middleName: "Jeanette", lastName: "Dunn", nickName: "greengorilla685", gender: .Male, contactMethods: [
                ContactMethod(.Email("joshua.dunn@example.com"), label: "main"),
                ContactMethod(.Phone("(080)686-6639"), label: "home"),
                ContactMethod(.Phone("(045)7800-270"), label: "cell")
                ]),
            Contact(firstName: "Alex", middleName: "Ethel", lastName: "Dunn", nickName: "heavyelephant916", gender: .Male, contactMethods: [
                ContactMethod(.Email("alex.dunn@example.com"), label: "main"),
                ContactMethod(.Phone("(061)795-9555"), label: "home"),
                ContactMethod(.Phone("(041)3404-167"), label: "cell")
                ]),
            Contact(firstName: "Alexander", middleName: "Shawn", lastName: "Dunn", nickName: "lazymouse912", gender: .Male, contactMethods: [
                ContactMethod(.Email("alexander.dunn@example.com"), label: "main"),
                ContactMethod(.Phone("(097)542-1329"), label: "home"),
                ContactMethod(.Phone("(040)7048-592"), label: "cell")
                ]),
            Contact(firstName: "Roland", middleName: "Bryan", lastName: "Dunn", nickName: "orangegorilla626", gender: .Male, contactMethods: [
                ContactMethod(.Email("roland.dunn@example.com"), label: "main"),
                ContactMethod(.Phone("(023)405-4174"), label: "home"),
                ContactMethod(.Phone("(041)2889-274"), label: "cell")
                ]),
            Contact(firstName: "Christopher", middleName: "Terri", lastName: "Edwards", nickName: "bluegoose874", gender: .Male, contactMethods: [
                ContactMethod(.Email("christopher.edwards@example.com"), label: "main"),
                ContactMethod(.Phone("(069)758-2547"), label: "home"),
                ContactMethod(.Phone("(048)1751-332"), label: "cell")
                ]),
            Contact(firstName: "Clayton", middleName: "Glen", lastName: "Edwards", nickName: "crazybear837", gender: .Male, contactMethods: [
                ContactMethod(.Email("clayton.edwards@example.com"), label: "main"),
                ContactMethod(.Phone("(095)162-1449"), label: "home"),
                ContactMethod(.Phone("(044)6854-413"), label: "cell")
                ]),
            Contact(firstName: "Jamie", middleName: "Kirk", lastName: "Edwards", nickName: "lazykoala876", gender: .Female, contactMethods: [
                ContactMethod(.Email("jamie.edwards@example.com"), label: "main"),
                ContactMethod(.Phone("(081)622-0419"), label: "home"),
                ContactMethod(.Phone("(049)9569-485"), label: "cell")
                ]),
            Contact(firstName: "Elizabeth", middleName: "John", lastName: "Evans", nickName: "silverbutterfly865", gender: .Female, contactMethods: [
                ContactMethod(.Email("elizabeth.evans@example.com"), label: "main"),
                ContactMethod(.Phone("(034)728-7408"), label: "home"),
                ContactMethod(.Phone("(041)2121-924"), label: "cell")
                ]),
            Contact(firstName: "Liam", middleName: "Christina", lastName: "Evans", nickName: "silverelephant460", gender: .Male, contactMethods: [
                ContactMethod(.Email("liam.evans@example.com"), label: "main"),
                ContactMethod(.Phone("(065)290-4958"), label: "home"),
                ContactMethod(.Phone("(040)3720-101"), label: "cell")
                ]),
            Contact(firstName: "Kelly", middleName: "Beatrice", lastName: "Evans", nickName: "ticklishpeacock524", gender: .Female, contactMethods: [
                ContactMethod(.Email("kelly.evans@example.com"), label: "main"),
                ContactMethod(.Phone("(048)213-5760"), label: "home"),
                ContactMethod(.Phone("(049)3326-223"), label: "cell")
                ]),
            Contact(firstName: "Deanna", middleName: "Mark", lastName: "Evans", nickName: "ticklishtiger789", gender: .Female, contactMethods: [
                ContactMethod(.Email("deanna.evans@example.com"), label: "main"),
                ContactMethod(.Phone("(070)391-9466"), label: "home"),
                ContactMethod(.Phone("(042)0979-732"), label: "cell")
                ]),
            Contact(firstName: "Mark", middleName: "Jessie", lastName: "Evans", nickName: "yellowpanda463", gender: .Male, contactMethods: [
                ContactMethod(.Email("mark.evans@example.com"), label: "main"),
                ContactMethod(.Phone("(073)009-8215"), label: "home"),
                ContactMethod(.Phone("(045)2486-742"), label: "cell")
                ]),
            Contact(firstName: "Sue", middleName: "Renee", lastName: "Ferguson", nickName: "bigladybug727", gender: .Female, contactMethods: [
                ContactMethod(.Email("sue.ferguson@example.com"), label: "main"),
                ContactMethod(.Phone("(065)150-9793"), label: "home"),
                ContactMethod(.Phone("(043)0913-937"), label: "cell")
                ]),
            Contact(firstName: "Guy", middleName: "Charlie", lastName: "Ferguson", nickName: "yellowgorilla776", gender: .Male, contactMethods: [
                ContactMethod(.Email("guy.ferguson@example.com"), label: "main"),
                ContactMethod(.Phone("(045)501-8258"), label: "home"),
                ContactMethod(.Phone("(047)2081-739"), label: "cell")
                ]),
            Contact(firstName: "Marian", middleName: "Rodney", lastName: "Fuller", nickName: "ticklishcat872", gender: .Female, contactMethods: [
                ContactMethod(.Email("marian.fuller@example.com"), label: "main"),
                ContactMethod(.Phone("(063)184-8998"), label: "home"),
                ContactMethod(.Phone("(044)7214-502"), label: "cell")
                ]),
            Contact(firstName: "Rene", middleName: "Brent", lastName: "Garcia", nickName: "beautifulmouse452", gender: .Male, contactMethods: [
                ContactMethod(.Email("rene.garcia@example.com"), label: "main"),
                ContactMethod(.Phone("(007)634-4534"), label: "home"),
                ContactMethod(.Phone("(043)2215-574"), label: "cell")
                ]),
            Contact(firstName: "Danielle", middleName: "Megan", lastName: "Garcia", nickName: "beautifulmouse635", gender: .Female, contactMethods: [
                ContactMethod(.Email("danielle.garcia@example.com"), label: "main"),
                ContactMethod(.Phone("(076)247-6958"), label: "home"),
                ContactMethod(.Phone("(046)7132-914"), label: "cell")
                ]),
            Contact(firstName: "Salvador", middleName: "James", lastName: "Garcia", nickName: "crazymouse600", gender: .Male, contactMethods: [
                ContactMethod(.Email("salvador.garcia@example.com"), label: "main"),
                ContactMethod(.Phone("(092)188-1121"), label: "home"),
                ContactMethod(.Phone("(047)5789-119"), label: "cell")
                ]),
            Contact(firstName: "Sonia", middleName: "Lori", lastName: "Garcia", nickName: "heavyfish568", gender: .Female, contactMethods: [
                ContactMethod(.Email("sonia.garcia@example.com"), label: "main"),
                ContactMethod(.Phone("(065)712-4092"), label: "home"),
                ContactMethod(.Phone("(041)0785-037"), label: "cell")
                ]),
            Contact(firstName: "Serenity", middleName: "Zachary", lastName: "Garcia", nickName: "lazyleopard756", gender: .Female, contactMethods: [
                ContactMethod(.Email("serenity.garcia@example.com"), label: "main"),
                ContactMethod(.Phone("(014)635-3175"), label: "home"),
                ContactMethod(.Phone("(049)4204-443"), label: "cell")
                ]),
            Contact(firstName: "Thomas", middleName: "Joy", lastName: "Garcia", nickName: "redfish642", gender: .Male, contactMethods: [
                ContactMethod(.Email("thomas.garcia@example.com"), label: "main"),
                ContactMethod(.Phone("(047)043-0331"), label: "home"),
                ContactMethod(.Phone("(044)8131-105"), label: "cell")
                ]),
            Contact(firstName: "William", middleName: "Sherri", lastName: "Garcia", nickName: "smallwolf136", gender: .Male, contactMethods: [
                ContactMethod(.Email("william.garcia@example.com"), label: "main"),
                ContactMethod(.Phone("(026)156-2103"), label: "home"),
                ContactMethod(.Phone("(048)8437-928"), label: "cell")
                ]),
            Contact(firstName: "Lewis", middleName: "Terry", lastName: "Garcia", nickName: "yellowcat898", gender: .Male, contactMethods: [
                ContactMethod(.Email("lewis.garcia@example.com"), label: "main"),
                ContactMethod(.Phone("(055)830-6980"), label: "home"),
                ContactMethod(.Phone("(044)6136-835"), label: "cell")
                ]),
            Contact(firstName: "Aiden", middleName: "Thomas", lastName: "Gutierrez", nickName: "blueduck816", gender: .Male, contactMethods: [
                ContactMethod(.Email("aiden.gutierrez@example.com"), label: "main"),
                ContactMethod(.Phone("(013)026-5569"), label: "home"),
                ContactMethod(.Phone("(046)8464-661"), label: "cell")
                ]),
            Contact(firstName: "Bobbie", middleName: "Sheila", lastName: "Gutierrez", nickName: "heavyelephant608", gender: .Female, contactMethods: [
                ContactMethod(.Email("bobbie.gutierrez@example.com"), label: "main"),
                ContactMethod(.Phone("(000)196-4047"), label: "home"),
                ContactMethod(.Phone("(041)2608-665"), label: "cell")
                ]),
            Contact(firstName: "Clinton", middleName: "Jose", lastName: "Gutierrez", nickName: "lazyfish327", gender: .Male, contactMethods: [
                ContactMethod(.Email("clinton.gutierrez@example.com"), label: "main"),
                ContactMethod(.Phone("(062)845-0443"), label: "home"),
                ContactMethod(.Phone("(049)3836-689"), label: "cell")
                ]),
            Contact(firstName: "Jerry", middleName: "Steve", lastName: "Gutierrez", nickName: "smallduck862", gender: .Male, contactMethods: [
                ContactMethod(.Email("jerry.gutierrez@example.com"), label: "main"),
                ContactMethod(.Phone("(054)142-0943"), label: "home"),
                ContactMethod(.Phone("(041)1908-237"), label: "cell")
                ]),
            Contact(firstName: "Larry", middleName: "Jessie", lastName: "Gutierrez", nickName: "smallswan464", gender: .Male, contactMethods: [
                ContactMethod(.Email("larry.gutierrez@example.com"), label: "main"),
                ContactMethod(.Phone("(023)391-1999"), label: "home"),
                ContactMethod(.Phone("(047)1538-114"), label: "cell")
                ]),
            Contact(firstName: "Terri", middleName: "Nellie", lastName: "Gutierrez", nickName: "ticklishdog562", gender: .Female, contactMethods: [
                ContactMethod(.Email("terri.gutierrez@example.com"), label: "main"),
                ContactMethod(.Phone("(081)079-7359"), label: "home"),
                ContactMethod(.Phone("(045)7027-885"), label: "cell")
                ]),
            Contact(firstName: "Mia", middleName: "Jill", lastName: "Gutierrez", nickName: "ticklishkoala403", gender: .Female, contactMethods: [
                ContactMethod(.Email("mia.gutierrez@example.com"), label: "main"),
                ContactMethod(.Phone("(075)501-0321"), label: "home"),
                ContactMethod(.Phone("(042)7065-936"), label: "cell")
                ]),
            Contact(firstName: "Justin", middleName: "Abigail", lastName: "Hale", nickName: "bigdog559", gender: .Male, contactMethods: [
                ContactMethod(.Email("justin.hale@example.com"), label: "main"),
                ContactMethod(.Phone("(060)698-2509"), label: "home"),
                ContactMethod(.Phone("(043)9048-417"), label: "cell")
                ]),
            Contact(firstName: "Irene", middleName: "Marvin", lastName: "Hale", nickName: "crazyswan469", gender: .Female, contactMethods: [
                ContactMethod(.Email("irene.hale@example.com"), label: "main"),
                ContactMethod(.Phone("(029)075-2022"), label: "home"),
                ContactMethod(.Phone("(048)4094-360"), label: "cell")
                ]),
            Contact(firstName: "Wyatt", middleName: "Penny", lastName: "Hale", nickName: "redbear478", gender: .Male, contactMethods: [
                ContactMethod(.Email("wyatt.hale@example.com"), label: "main"),
                ContactMethod(.Phone("(022)729-4338"), label: "home"),
                ContactMethod(.Phone("(046)8748-156"), label: "cell")
                ]),
            Contact(firstName: "Roberto", middleName: "Armando", lastName: "Hale", nickName: "redsnake925", gender: .Male, contactMethods: [
                ContactMethod(.Email("roberto.hale@example.com"), label: "main"),
                ContactMethod(.Phone("(031)601-6375"), label: "home"),
                ContactMethod(.Phone("(047)2619-524"), label: "cell")
                ]),
            Contact(firstName: "Johnny", middleName: "Jessica", lastName: "Hale", nickName: "silverladybug168", gender: .Male, contactMethods: [
                ContactMethod(.Email("johnny.hale@example.com"), label: "main"),
                ContactMethod(.Phone("(011)477-9090"), label: "home"),
                ContactMethod(.Phone("(043)2769-322"), label: "cell")
                ]),
            Contact(firstName: "Deanna", middleName: "Audrey", lastName: "Hale", nickName: "whitebutterfly498", gender: .Female, contactMethods: [
                ContactMethod(.Email("deanna.hale@example.com"), label: "main"),
                ContactMethod(.Phone("(028)910-0149"), label: "home"),
                ContactMethod(.Phone("(049)4333-589"), label: "cell")
                ]),
            Contact(firstName: "Elsie", middleName: "Yvonne", lastName: "Hall", nickName: "greenpeacock665", gender: .Female, contactMethods: [
                ContactMethod(.Email("elsie.hall@example.com"), label: "main"),
                ContactMethod(.Phone("(098)230-3147"), label: "home"),
                ContactMethod(.Phone("(044)1432-250"), label: "cell")
                ]),
            Contact(firstName: "Pedro", middleName: "Lonnie", lastName: "Hansen", nickName: "heavydog465", gender: .Male, contactMethods: [
                ContactMethod(.Email("pedro.hansen@example.com"), label: "main"),
                ContactMethod(.Phone("(078)498-6433"), label: "home"),
                ContactMethod(.Phone("(047)7773-565"), label: "cell")
                ]),
            Contact(firstName: "Regina", middleName: "Kelly", lastName: "Hansen", nickName: "lazygoose408", gender: .Female, contactMethods: [
                ContactMethod(.Email("regina.hansen@example.com"), label: "main"),
                ContactMethod(.Phone("(042)047-1167"), label: "home"),
                ContactMethod(.Phone("(045)8879-700"), label: "cell")
                ]),
            Contact(firstName: "Nina", middleName: "Sandra", lastName: "Hansen", nickName: "ticklishswan172", gender: .Female, contactMethods: [
                ContactMethod(.Email("nina.hansen@example.com"), label: "main"),
                ContactMethod(.Phone("(009)868-7507"), label: "home"),
                ContactMethod(.Phone("(046)8131-177"), label: "cell")
                ]),
            Contact(firstName: "Annette", middleName: "Zoe", lastName: "Hanson", nickName: "brownsnake813", gender: .Female, contactMethods: [
                ContactMethod(.Email("annette.hanson@example.com"), label: "main"),
                ContactMethod(.Phone("(071)073-4915"), label: "home"),
                ContactMethod(.Phone("(040)8848-364"), label: "cell")
                ]),
            
            Contact(firstName: "Meghan", middleName: "Lesa", lastName: "Hunter", nickName: "lazyleopard955", gender: .Female, contactMethods: [
                ContactMethod(.Email("meghan.hunter@example.com"), label: "main"),
                ContactMethod(.Phone("(083)530-9328"), label: "home"),
                ContactMethod(.Phone("(042)8084-501"), label: "cell")
                ]),
            Contact(firstName: "Scott", middleName: "Mary", lastName: "Hunter", nickName: "smallmeercat750", gender: .Male, contactMethods: [
                ContactMethod(.Email("scott.hunter@example.com"), label: "main"),
                ContactMethod(.Phone("(012)155-4683"), label: "home"),
                ContactMethod(.Phone("(045)7451-252"), label: "cell")
                ]),
            Contact(firstName: "Sarah", middleName: "Austin", lastName: "Hunter", nickName: "tinybear655", gender: .Female, contactMethods: [
                ContactMethod(.Email("sarah.hunter@example.com"), label: "main"),
                ContactMethod(.Phone("(071)880-7524"), label: "home"),
                ContactMethod(.Phone("(049)0661-955"), label: "cell")
                ]),
            Contact(firstName: "Vanessa", middleName: "Bob", lastName: "Hunter", nickName: "tinycat798", gender: .Female, contactMethods: [
                ContactMethod(.Email("vanessa.hunter@example.com"), label: "main"),
                ContactMethod(.Phone("(040)393-7087"), label: "home"),
                ContactMethod(.Phone("(041)8816-615"), label: "cell")
                ]),
            Contact(firstName: "Felicia", middleName: "Roy", lastName: "Jackson", nickName: "bigbutterfly428", gender: .Female, contactMethods: [
                ContactMethod(.Email("felicia.jackson@example.com"), label: "main"),
                ContactMethod(.Phone("(041)251-2483"), label: "home"),
                ContactMethod(.Phone("(047)7228-824"), label: "cell")
                ]),
            Contact(firstName: "Aubree", middleName: "Dwayne", lastName: "Jackson", nickName: "bluemouse348", gender: .Female, contactMethods: [
                ContactMethod(.Email("aubree.jackson@example.com"), label: "main"),
                ContactMethod(.Phone("(039)279-7755"), label: "home"),
                ContactMethod(.Phone("(040)5344-714"), label: "cell")
                ]),
            Contact(firstName: "Thomas", middleName: "Leo", lastName: "Jackson", nickName: "silverduck348", gender: .Male, contactMethods: [
                ContactMethod(.Email("thomas.jackson@example.com"), label: "main"),
                ContactMethod(.Phone("(090)222-3539"), label: "home"),
                ContactMethod(.Phone("(046)4906-903"), label: "cell")
                ]),
            Contact(firstName: "Johnni", middleName: "Owen", lastName: "Jackson", nickName: "smallbear258", gender: .Male, contactMethods: [
                ContactMethod(.Email("johnni.jackson@example.com"), label: "main"),
                ContactMethod(.Phone("(046)363-9439"), label: "home"),
                ContactMethod(.Phone("(048)3621-884"), label: "cell")
                ]),
            Contact(firstName: "Austin", middleName: "Carrie", lastName: "Jacobs", nickName: "brownsnake161", gender: .Male, contactMethods: [
                ContactMethod(.Email("austin.jacobs@example.com"), label: "main"),
                ContactMethod(.Phone("(044)131-1048"), label: "home"),
                ContactMethod(.Phone("(044)5646-684"), label: "cell")
                ]),
            Contact(firstName: "Ritthy", middleName: "Terrance", lastName: "Jacobs", nickName: "goldenbutterfly133", gender: .Male, contactMethods: [
                ContactMethod(.Email("ritthy.jacobs@example.com"), label: "main"),
                ContactMethod(.Phone("(002)360-8550"), label: "home"),
                ContactMethod(.Phone("(041)6066-699"), label: "cell")
                ]),
            Contact(firstName: "Ida", middleName: "Rick", lastName: "Jacobs", nickName: "orangegoose243", gender: .Female, contactMethods: [
                ContactMethod(.Email("ida.jacobs@example.com"), label: "main"),
                ContactMethod(.Phone("(047)648-0292"), label: "home"),
                ContactMethod(.Phone("(048)8352-472"), label: "cell")
                ]),
            Contact(firstName: "Judith", middleName: "Valerie", lastName: "Jacobs", nickName: "orangeleopard137", gender: .Female, contactMethods: [
                ContactMethod(.Email("judith.jacobs@example.com"), label: "main"),
                ContactMethod(.Phone("(033)888-8427"), label: "home"),
                ContactMethod(.Phone("(048)8504-124"), label: "cell")
                ]),
            Contact(firstName: "Nina", middleName: "Roberto", lastName: "James", nickName: "bluefish328", gender: .Female, contactMethods: [
                ContactMethod(.Email("nina.james@example.com"), label: "main"),
                ContactMethod(.Phone("(020)828-4951"), label: "home"),
                ContactMethod(.Phone("(049)4275-159"), label: "cell")
                ]),
            Contact(firstName: "Ricky", middleName: "Clinton", lastName: "Jordan", nickName: "orangeostrich557", gender: .Male, contactMethods: [
                ContactMethod(.Email("ricky.jordan@example.com"), label: "main"),
                ContactMethod(.Phone("(009)628-9590"), label: "home"),
                ContactMethod(.Phone("(043)9819-444"), label: "cell")
                ]),
            Contact(firstName: "Crystal", middleName: "Josephine", lastName: "Jordan", nickName: "purpletiger808", gender: .Female, contactMethods: [
                ContactMethod(.Email("crystal.jordan@example.com"), label: "main"),
                ContactMethod(.Phone("(096)433-8137"), label: "home"),
                ContactMethod(.Phone("(048)6169-944"), label: "cell")
                ]),
            Contact(firstName: "James", middleName: "Kyle", lastName: "Jordan", nickName: "silvertiger805", gender: .Male, contactMethods: [
                ContactMethod(.Email("james.jordan@example.com"), label: "main"),
                ContactMethod(.Phone("(000)269-5598"), label: "home"),
                ContactMethod(.Phone("(049)9042-377"), label: "cell")
                ]),
            Contact(firstName: "Billie", middleName: "Zoe", lastName: "Jordan", nickName: "tinylion387", gender: .Female, contactMethods: [
                ContactMethod(.Email("billie.jordan@example.com"), label: "main"),
                ContactMethod(.Phone("(044)784-4957"), label: "home"),
                ContactMethod(.Phone("(042)4341-959"), label: "cell")
                ]),
            Contact(firstName: "Jerry", middleName: "Nathan", lastName: "Kelley", nickName: "goldenpanda890", gender: .Male, contactMethods: [
                ContactMethod(.Email("jerry.kelley@example.com"), label: "main"),
                ContactMethod(.Phone("(053)218-0727"), label: "home"),
                ContactMethod(.Phone("(044)4138-535"), label: "cell")
                ]),
            Contact(firstName: "Eric", middleName: "Joanne", lastName: "Kelley", nickName: "lazybird103", gender: .Male, contactMethods: [
                ContactMethod(.Email("eric.kelley@example.com"), label: "main"),
                ContactMethod(.Phone("(095)170-9676"), label: "home"),
                ContactMethod(.Phone("(042)5834-612"), label: "cell")
                ]),
            Contact(firstName: "Amber", middleName: "Nathaniel", lastName: "Knight", nickName: "greenduck542", gender: .Female, contactMethods: [
                ContactMethod(.Email("amber.knight@example.com"), label: "main"),
                ContactMethod(.Phone("(083)174-5239"), label: "home"),
                ContactMethod(.Phone("(045)4472-568"), label: "cell")
                ]),
            Contact(firstName: "Leon", middleName: "Luke", lastName: "Knight", nickName: "heavyelephant736", gender: .Male, contactMethods: [
                ContactMethod(.Email("leon.knight@example.com"), label: "main"),
                ContactMethod(.Phone("(010)768-9864"), label: "home"),
                ContactMethod(.Phone("(046)0471-368"), label: "cell")
                ]),
            Contact(firstName: "Owen", middleName: "Dylan", lastName: "Knight", nickName: "organicwolf704", gender: .Male, contactMethods: [
                ContactMethod(.Email("owen.knight@example.com"), label: "main"),
                ContactMethod(.Phone("(032)502-0932"), label: "home"),
                ContactMethod(.Phone("(042)1766-988"), label: "cell")
                ]),
            Contact(firstName: "Anne", middleName: "Sharlene", lastName: "Knight", nickName: "smallswan261", gender: .Female, contactMethods: [
                ContactMethod(.Email("anne.knight@example.com"), label: "main"),
                ContactMethod(.Phone("(071)049-6363"), label: "home"),
                ContactMethod(.Phone("(040)1288-983"), label: "cell")
                ]),
            Contact(firstName: "Leta", middleName: "Jose", lastName: "Kuhn", nickName: "browngorilla848", gender: .Female, contactMethods: [
                ContactMethod(.Email("leta.kuhn@example.com"), label: "main"),
                ContactMethod(.Phone("(099)535-2888"), label: "home"),
                ContactMethod(.Phone("(043)1902-244"), label: "cell")
                ]),
            Contact(firstName: "Robin", middleName: "Darrell", lastName: "Kuhn", nickName: "greenfrog774", gender: .Female, contactMethods: [
                ContactMethod(.Email("robin.kuhn@example.com"), label: "main"),
                ContactMethod(.Phone("(068)531-6452"), label: "home"),
                ContactMethod(.Phone("(047)3401-994"), label: "cell")
                ]),
            Contact(firstName: "Scott", middleName: "Carl", lastName: "Kuhn", nickName: "organicwolf610", gender: .Male, contactMethods: [
                ContactMethod(.Email("scott.kuhn@example.com"), label: "main"),
                ContactMethod(.Phone("(043)222-4998"), label: "home"),
                ContactMethod(.Phone("(049)7184-790"), label: "cell")
                ]),
            Contact(firstName: "Stephen", middleName: "Harold", lastName: "Kuhn", nickName: "silverswan444", gender: .Male, contactMethods: [
                ContactMethod(.Email("stephen.kuhn@example.com"), label: "main"),
                ContactMethod(.Phone("(088)309-2766"), label: "home"),
                ContactMethod(.Phone("(043)1757-806"), label: "cell")
                ]),
            Contact(firstName: "Gail", middleName: "Noelle", lastName: "Kuhn", nickName: "yellowcat994", gender: .Female, contactMethods: [
                ContactMethod(.Email("gail.kuhn@example.com"), label: "main"),
                ContactMethod(.Phone("(091)402-6394"), label: "home"),
                ContactMethod(.Phone("(045)6586-540"), label: "cell")
                ]),
            Contact(firstName: "Cindy", middleName: "Byron", lastName: "Lambert", nickName: "bigbear754", gender: .Female, contactMethods: [
                ContactMethod(.Email("cindy.lambert@example.com"), label: "main"),
                ContactMethod(.Phone("(092)087-0176"), label: "home"),
                ContactMethod(.Phone("(046)3572-627"), label: "cell")
                ]),
            Contact(firstName: "Lynn", middleName: "Fernando", lastName: "Lambert", nickName: "goldenpanda493", gender: .Female, contactMethods: [
                ContactMethod(.Email("lynn.lambert@example.com"), label: "main"),
                ContactMethod(.Phone("(072)941-2082"), label: "home"),
                ContactMethod(.Phone("(048)7552-820"), label: "cell")
                ]),
            Contact(firstName: "Chris", middleName: "Bernice", lastName: "Lane", nickName: "brownsnake158", gender: .Male, contactMethods: [
                ContactMethod(.Email("chris.lane@example.com"), label: "main"),
                ContactMethod(.Phone("(010)627-9903"), label: "home"),
                ContactMethod(.Phone("(045)0547-972"), label: "cell")
                ]),
            Contact(firstName: "Elmer", middleName: "Audrey", lastName: "Lane", nickName: "greenbutterfly648", gender: .Male, contactMethods: [
                ContactMethod(.Email("elmer.lane@example.com"), label: "main"),
                ContactMethod(.Phone("(030)244-2233"), label: "home"),
                ContactMethod(.Phone("(041)0092-846"), label: "cell")
                ]),
            Contact(firstName: "Melanie", middleName: "Chloe", lastName: "Lopez", nickName: "orangesnake157", gender: .Female, contactMethods: [
                ContactMethod(.Email("melanie.lopez@example.com"), label: "main"),
                ContactMethod(.Phone("(060)135-2569"), label: "home"),
                ContactMethod(.Phone("(040)2257-423"), label: "cell")
                ]),
            Contact(firstName: "Brooklyn", middleName: "Jean", lastName: "Lopez", nickName: "redkoala759", gender: .Female, contactMethods: [
                ContactMethod(.Email("brooklyn.lopez@example.com"), label: "main"),
                ContactMethod(.Phone("(027)224-2306"), label: "home"),
                ContactMethod(.Phone("(045)7128-447"), label: "cell")
                ]),
            Contact(firstName: "Terry", middleName: "Joyce", lastName: "Lopez", nickName: "silverbear852", gender: .Male, contactMethods: [
                ContactMethod(.Email("terry.lopez@example.com"), label: "main"),
                ContactMethod(.Phone("(005)585-8644"), label: "home"),
                ContactMethod(.Phone("(041)6031-986"), label: "cell")
                ]),
            Contact(firstName: "Hazel", middleName: "Roland", lastName: "Marshall", nickName: "beautifulbear384", gender: .Female, contactMethods: [
                ContactMethod(.Email("hazel.marshall@example.com"), label: "main"),
                ContactMethod(.Phone("(058)995-7924"), label: "home"),
                ContactMethod(.Phone("(043)3348-634"), label: "cell")
                ]),
            Contact(firstName: "Emily", middleName: "Zachary", lastName: "Marshall", nickName: "beautifulkoala937", gender: .Female, contactMethods: [
                ContactMethod(.Email("emily.marshall@example.com"), label: "main"),
                ContactMethod(.Phone("(027)679-7526"), label: "home"),
                ContactMethod(.Phone("(047)0240-077"), label: "cell")
                ]),
            Contact(firstName: "Maureen", middleName: "Louise", lastName: "Marshall", nickName: "crazypeacock453", gender: .Female, contactMethods: [
                ContactMethod(.Email("maureen.marshall@example.com"), label: "main"),
                ContactMethod(.Phone("(081)060-1698"), label: "home"),
                ContactMethod(.Phone("(042)3926-830"), label: "cell")
                ]),
            Contact(firstName: "Christian", middleName: "Loretta", lastName: "Marshall", nickName: "purplepanda341", gender: .Male, contactMethods: [
                ContactMethod(.Email("christian.marshall@example.com"), label: "main"),
                ContactMethod(.Phone("(055)933-2420"), label: "home"),
                ContactMethod(.Phone("(041)4082-738"), label: "cell")
                ]),
            Contact(firstName: "Isaiah", middleName: "Dwight", lastName: "Marshall", nickName: "redfrog420", gender: .Male, contactMethods: [
                ContactMethod(.Email("isaiah.marshall@example.com"), label: "main"),
                ContactMethod(.Phone("(074)794-2642"), label: "home"),
                ContactMethod(.Phone("(049)3733-772"), label: "cell")
                ]),
            Contact(firstName: "Jeanne", middleName: "Terri", lastName: "Marshall", nickName: "silverpeacock649", gender: .Female, contactMethods: [
                ContactMethod(.Email("jeanne.marshall@example.com"), label: "main"),
                ContactMethod(.Phone("(094)905-7446"), label: "home"),
                ContactMethod(.Phone("(041)1941-675"), label: "cell")
                ]),
            Contact(firstName: "Jacob", middleName: "Rodney", lastName: "Marshall", nickName: "whiterabbit421", gender: .Male, contactMethods: [
                ContactMethod(.Email("jacob.marshall@example.com"), label: "main"),
                ContactMethod(.Phone("(003)290-9397"), label: "home"),
                ContactMethod(.Phone("(043)8066-165"), label: "cell")
                ]),
            Contact(firstName: "Philip", middleName: "Tyrone", lastName: "Morris", nickName: "reddog124", gender: .Male, contactMethods: [
                ContactMethod(.Email("philip.morris@example.com"), label: "main"),
                ContactMethod(.Phone("(036)559-2214"), label: "home"),
                ContactMethod(.Phone("(045)8763-314"), label: "cell")
                ]),
            Contact(firstName: "Chloe", middleName: "Nina", lastName: "Morris", nickName: "silverwolf557", gender: .Female, contactMethods: [
                ContactMethod(.Email("chloe.morris@example.com"), label: "main"),
                ContactMethod(.Phone("(050)985-2402"), label: "home"),
                ContactMethod(.Phone("(041)9725-272"), label: "cell")
                ]),
            Contact(firstName: "Leona", middleName: "Mathew", lastName: "Morrison", nickName: "bigbear886", gender: .Female, contactMethods: [
                ContactMethod(.Email("leona.morrison@example.com"), label: "main"),
                ContactMethod(.Phone("(044)863-9010"), label: "home"),
                ContactMethod(.Phone("(044)2350-783"), label: "cell")
                ]),
            Contact(firstName: "Chris", middleName: "Steve", lastName: "Murphy", nickName: "crazykoala542", gender: .Male, contactMethods: [
                ContactMethod(.Email("chris.murphy@example.com"), label: "main"),
                ContactMethod(.Phone("(023)926-3098"), label: "home"),
                ContactMethod(.Phone("(041)4968-464"), label: "cell")
                ]),
            Contact(firstName: "Alvin", middleName: "Marshall", lastName: "Myers", nickName: "whiteladybug661", gender: .Male, contactMethods: [
                ContactMethod(.Email("alvin.myers@example.com"), label: "main"),
                ContactMethod(.Phone("(085)188-6378"), label: "home"),
                ContactMethod(.Phone("(048)7111-968"), label: "cell")
                ]),
            Contact(firstName: "Elmer", middleName: "Arron", lastName: "Myers", nickName: "whitesnake490", gender: .Male, contactMethods: [
                ContactMethod(.Email("elmer.myers@example.com"), label: "main"),
                ContactMethod(.Phone("(026)744-1951"), label: "home"),
                ContactMethod(.Phone("(045)1083-730"), label: "cell")
                ]),
            Contact(firstName: "Allan", middleName: "Luke", lastName: "Neal", nickName: "greenostrich137", gender: .Male, contactMethods: [
                ContactMethod(.Email("allan.neal@example.com"), label: "main"),
                ContactMethod(.Phone("(089)130-3085"), label: "home"),
                ContactMethod(.Phone("(046)4313-821"), label: "cell")
                ]),
            Contact(firstName: "Richard", middleName: "Glen", lastName: "Neal", nickName: "organicostrich527", gender: .Male, contactMethods: [
                ContactMethod(.Email("richard.neal@example.com"), label: "main"),
                ContactMethod(.Phone("(024)812-7287"), label: "home"),
                ContactMethod(.Phone("(048)4563-049"), label: "cell")
                ]),
            Contact(firstName: "Mathew", middleName: "Lydia", lastName: "Nichols", nickName: "goldenwolf372", gender: .Male, contactMethods: [
                ContactMethod(.Email("mathew.nichols@example.com"), label: "main"),
                ContactMethod(.Phone("(022)405-3628"), label: "home"),
                ContactMethod(.Phone("(045)5485-209"), label: "cell")
                ]),
            Contact(firstName: "Lynn", middleName: "Genesis", lastName: "Nichols", nickName: "lazybear206", gender: .Female, contactMethods: [
                ContactMethod(.Email("lynn.nichols@example.com"), label: "main"),
                ContactMethod(.Phone("(007)435-7553"), label: "home"),
                ContactMethod(.Phone("(041)8642-057"), label: "cell")
                ]),
            Contact(firstName: "Alyssa", middleName: "Renee", lastName: "Nichols", nickName: "organicmeercat351", gender: .Female, contactMethods: [
                ContactMethod(.Email("alyssa.nichols@example.com"), label: "main"),
                ContactMethod(.Phone("(093)983-7001"), label: "home"),
                ContactMethod(.Phone("(046)7078-958"), label: "cell")
                ]),
            Contact(firstName: "Lesa", middleName: "Joe", lastName: "Nichols", nickName: "redbear670", gender: .Female, contactMethods: [
                ContactMethod(.Email("lesa.nichols@example.com"), label: "main"),
                ContactMethod(.Phone("(077)518-3769"), label: "home"),
                ContactMethod(.Phone("(049)9146-586"), label: "cell")
                ]),
            Contact(firstName: "Freddie", middleName: "Peyton", lastName: "Nichols", nickName: "whitebird447", gender: .Male, contactMethods: [
                ContactMethod(.Email("freddie.nichols@example.com"), label: "main"),
                ContactMethod(.Phone("(022)758-9126"), label: "home"),
                ContactMethod(.Phone("(047)9995-826"), label: "cell")
                ]),
            Contact(firstName: "Dianne", middleName: "Travis", lastName: "Obrien", nickName: "bigbird403", gender: .Female, contactMethods: [
                ContactMethod(.Email("dianne.obrien@example.com"), label: "main"),
                ContactMethod(.Phone("(062)047-4769"), label: "home"),
                ContactMethod(.Phone("(048)3005-675"), label: "cell")
                ]),
            Contact(firstName: "Steve", middleName: "Jared", lastName: "Obrien", nickName: "bigbird532", gender: .Male, contactMethods: [
                ContactMethod(.Email("steve.obrien@example.com"), label: "main"),
                ContactMethod(.Phone("(031)734-3215"), label: "home"),
                ContactMethod(.Phone("(046)4802-992"), label: "cell")
                ]),
            Contact(firstName: "Brad", middleName: "Andrew", lastName: "Obrien", nickName: "yellowbird298", gender: .Male, contactMethods: [
                ContactMethod(.Email("brad.obrien@example.com"), label: "main"),
                ContactMethod(.Phone("(004)971-4059"), label: "home"),
                ContactMethod(.Phone("(049)6421-009"), label: "cell")
                ]),
            Contact(firstName: "Sebastian", middleName: "Gene", lastName: "Oliver", nickName: "beautifulgorilla617", gender: .Male, contactMethods: [
                ContactMethod(.Email("sebastian.oliver@example.com"), label: "main"),
                ContactMethod(.Phone("(022)484-0608"), label: "home"),
                ContactMethod(.Phone("(043)9994-227"), label: "cell")
                ]),
            Contact(firstName: "Amy", middleName: "George", lastName: "Oliver", nickName: "goldenrabbit393", gender: .Female, contactMethods: [
                ContactMethod(.Email("amy.oliver@example.com"), label: "main"),
                ContactMethod(.Phone("(095)036-2541"), label: "home"),
                ContactMethod(.Phone("(045)6457-500"), label: "cell")
                ]),
            Contact(firstName: "Clifford", middleName: "Tracey", lastName: "Owens", nickName: "goldentiger769", gender: .Male, contactMethods: [
                ContactMethod(.Email("clifford.owens@example.com"), label: "main"),
                ContactMethod(.Phone("(034)038-3742"), label: "home"),
                ContactMethod(.Phone("(043)5171-823"), label: "cell")
                ]),
            Contact(firstName: "Alma", middleName: "Jorge", lastName: "Owens", nickName: "smallwolf217", gender: .Female, contactMethods: [
                ContactMethod(.Email("alma.owens@example.com"), label: "main"),
                ContactMethod(.Phone("(046)570-8182"), label: "home"),
                ContactMethod(.Phone("(043)9853-912"), label: "cell")
                ]),
            Contact(firstName: "Brett", middleName: "Genesis", lastName: "Palmer", nickName: "blackmeercat175", gender: .Male, contactMethods: [
                ContactMethod(.Email("brett.palmer@example.com"), label: "main"),
                ContactMethod(.Phone("(041)980-4979"), label: "home"),
                ContactMethod(.Phone("(046)7475-551"), label: "cell")
                ]),
            Contact(firstName: "Marlene", middleName: "Norma", lastName: "Palmer", nickName: "brownbear107", gender: .Female, contactMethods: [
                ContactMethod(.Email("marlene.palmer@example.com"), label: "main"),
                ContactMethod(.Phone("(098)352-4111"), label: "home"),
                ContactMethod(.Phone("(043)0529-701"), label: "cell")
                ]),
            Contact(firstName: "Gary", middleName: "Leonard", lastName: "Parker", nickName: "lazyswan121", gender: .Male, contactMethods: [
                ContactMethod(.Email("gary.parker@example.com"), label: "main"),
                ContactMethod(.Phone("(003)517-9922"), label: "home"),
                ContactMethod(.Phone("(047)9829-375"), label: "cell")
                ]),
            Contact(firstName: "Naomi", middleName: "Roland", lastName: "Price", nickName: "ticklishbear115", gender: .Female, contactMethods: [
                ContactMethod(.Email("naomi.price@example.com"), label: "main"),
                ContactMethod(.Phone("(083)121-6490"), label: "home"),
                ContactMethod(.Phone("(043)1492-545"), label: "cell")
                ]),
            Contact(firstName: "Isobel", middleName: "Lloyd", lastName: "Price", nickName: "ticklishbird993", gender: .Female, contactMethods: [
                ContactMethod(.Email("isobel.price@example.com"), label: "main"),
                ContactMethod(.Phone("(023)984-2037"), label: "home"),
                ContactMethod(.Phone("(049)4267-947"), label: "cell")
                ]),
            Contact(firstName: "Colleen", middleName: "Cindy", lastName: "Price", nickName: "tinyladybug729", gender: .Female, contactMethods: [
                ContactMethod(.Email("colleen.price@example.com"), label: "main"),
                ContactMethod(.Phone("(000)833-1204"), label: "home"),
                ContactMethod(.Phone("(045)7572-360"), label: "cell")
                ]),
            Contact(firstName: "Beverly", middleName: "Vanessa", lastName: "Price", nickName: "whitebutterfly946", gender: .Female, contactMethods: [
                ContactMethod(.Email("beverly.price@example.com"), label: "main"),
                ContactMethod(.Phone("(070)146-6550"), label: "home"),
                ContactMethod(.Phone("(047)9585-942"), label: "cell")
                ]),
            Contact(firstName: "Sara", middleName: "Glen", lastName: "Ramirez", nickName: "blueelephant112", gender: .Female, contactMethods: [
                ContactMethod(.Email("sara.ramirez@example.com"), label: "main"),
                ContactMethod(.Phone("(014)616-3044"), label: "home"),
                ContactMethod(.Phone("(045)4660-501"), label: "cell")
                ]),
            Contact(firstName: "Zoey", middleName: "Nicholas", lastName: "Ramirez", nickName: "bluesnake204", gender: .Female, contactMethods: [
                ContactMethod(.Email("zoey.ramirez@example.com"), label: "main"),
                ContactMethod(.Phone("(024)286-6845"), label: "home"),
                ContactMethod(.Phone("(049)2150-258"), label: "cell")
                ]),
            Contact(firstName: "Oscar", middleName: "Landon", lastName: "Ryan", nickName: "brownladybug175", gender: .Male, contactMethods: [
                ContactMethod(.Email("oscar.ryan@example.com"), label: "main"),
                ContactMethod(.Phone("(047)813-1437"), label: "home"),
                ContactMethod(.Phone("(042)2157-754"), label: "cell")
                ]),
            Contact(firstName: "Donald", middleName: "Brianna", lastName: "Ryan", nickName: "heavydog684", gender: .Male, contactMethods: [
                ContactMethod(.Email("donald.ryan@example.com"), label: "main"),
                ContactMethod(.Phone("(027)870-3217"), label: "home"),
                ContactMethod(.Phone("(046)8182-386"), label: "cell")
                ]),
            Contact(firstName: "Ava", middleName: "Javier", lastName: "Ryan", nickName: "lazyrabbit607", gender: .Female, contactMethods: [
                ContactMethod(.Email("ava.ryan@example.com"), label: "main"),
                ContactMethod(.Phone("(052)718-4873"), label: "home"),
                ContactMethod(.Phone("(048)9771-021"), label: "cell")
                ]),
            Contact(firstName: "Andre", middleName: "Camila", lastName: "Ryan", nickName: "whitewolf347", gender: .Male, contactMethods: [
                ContactMethod(.Email("andre.ryan@example.com"), label: "main"),
                ContactMethod(.Phone("(027)754-3391"), label: "home"),
                ContactMethod(.Phone("(049)8726-756"), label: "cell")
                ]),
            Contact(firstName: "Lance", middleName: "William", lastName: "Sanchez", nickName: "beautifulpeacock744", gender: .Male, contactMethods: [
                ContactMethod(.Email("lance.sanchez@example.com"), label: "main"),
                ContactMethod(.Phone("(092)577-6649"), label: "home"),
                ContactMethod(.Phone("(040)1053-410"), label: "cell")
                ]),
            Contact(firstName: "Clayton", middleName: "Aubrey", lastName: "Sutton", nickName: "smallkoala471", gender: .Male, contactMethods: [
                ContactMethod(.Email("clayton.sutton@example.com"), label: "main"),
                ContactMethod(.Phone("(032)484-0773"), label: "home"),
                ContactMethod(.Phone("(041)9529-894"), label: "cell")
                ]),
            Contact(firstName: "Jean", middleName: "Wayne", lastName: "Sutton", nickName: "ticklishgorilla246", gender: .Female, contactMethods: [
                ContactMethod(.Email("jean.sutton@example.com"), label: "main"),
                ContactMethod(.Phone("(078)782-0213"), label: "home"),
                ContactMethod(.Phone("(042)0163-346"), label: "cell")
                ]),
            Contact(firstName: "Willie", middleName: "Jose", lastName: "Sutton", nickName: "whitelion689", gender: .Male, contactMethods: [
                ContactMethod(.Email("willie.sutton@example.com"), label: "main"),
                ContactMethod(.Phone("(026)348-3283"), label: "home"),
                ContactMethod(.Phone("(043)3125-452"), label: "cell")
                ]),
            Contact(firstName: "Matthew", middleName: "Suzanne", lastName: "Sutton", nickName: "yellowrabbit595", gender: .Male, contactMethods: [
                ContactMethod(.Email("matthew.sutton@example.com"), label: "main"),
                ContactMethod(.Phone("(030)046-5487"), label: "home"),
                ContactMethod(.Phone("(048)6173-537"), label: "cell")
                ]),
            Contact(firstName: "Catherine", middleName: "Daisy", lastName: "Taylor", nickName: "bigcat556", gender: .Female, contactMethods: [
                ContactMethod(.Email("catherine.taylor@example.com"), label: "main"),
                ContactMethod(.Phone("(055)552-0467"), label: "home"),
                ContactMethod(.Phone("(048)5194-924"), label: "cell")
                ]),
            Contact(firstName: "Darryl", middleName: "Minnie", lastName: "Taylor", nickName: "bluebutterfly970", gender: .Male, contactMethods: [
                ContactMethod(.Email("darryl.taylor@example.com"), label: "main"),
                ContactMethod(.Phone("(040)102-4947"), label: "home"),
                ContactMethod(.Phone("(044)8258-193"), label: "cell")
                ]),
            Contact(firstName: "Arron", middleName: "Frank", lastName: "Tucker", nickName: "yellowpeacock605", gender: .Male, contactMethods: [
                ContactMethod(.Email("arron.tucker@example.com"), label: "main"),
                ContactMethod(.Phone("(083)355-7947"), label: "home"),
                ContactMethod(.Phone("(041)7251-064"), label: "cell")
                ]),
            Contact(firstName: "Julia", middleName: "Dave", lastName: "Turner", nickName: "heavymeercat899", gender: .Female, contactMethods: [
                ContactMethod(.Email("julia.turner@example.com"), label: "main"),
                ContactMethod(.Phone("(014)573-7378"), label: "home"),
                ContactMethod(.Phone("(049)9384-390"), label: "cell")
                ]),
            Contact(firstName: "Andy", middleName: "Mark", lastName: "Turner", nickName: "orangewolf120", gender: .Male, contactMethods: [
                ContactMethod(.Email("andy.turner@example.com"), label: "main"),
                ContactMethod(.Phone("(001)489-4430"), label: "home"),
                ContactMethod(.Phone("(042)7998-825"), label: "cell")
                ]),
            Contact(firstName: "Julian", middleName: "Willie", lastName: "Turner", nickName: "smallbear383", gender: .Male, contactMethods: [
                ContactMethod(.Email("julian.turner@example.com"), label: "main"),
                ContactMethod(.Phone("(005)752-9780"), label: "home"),
                ContactMethod(.Phone("(046)1891-661"), label: "cell")
                ]),
            Contact(firstName: "Charles", middleName: "Lori", lastName: "Vargas", nickName: "beautifuldog950", gender: .Male, contactMethods: [
                ContactMethod(.Email("charles.vargas@example.com"), label: "main"),
                ContactMethod(.Phone("(090)220-3138"), label: "home"),
                ContactMethod(.Phone("(049)4423-301"), label: "cell")
                ]),
            Contact(firstName: "Judy", middleName: "Andy", lastName: "Vasquez", nickName: "heavyduck964", gender: .Female, contactMethods: [
                ContactMethod(.Email("judy.vasquez@example.com"), label: "main"),
                ContactMethod(.Phone("(085)561-0833"), label: "home"),
                ContactMethod(.Phone("(043)4574-595"), label: "cell")
                ]),
            Contact(firstName: "Katrina", middleName: "Arron", lastName: "Vasquez", nickName: "heavyduck999", gender: .Female, contactMethods: [
                ContactMethod(.Email("katrina.vasquez@example.com"), label: "main"),
                ContactMethod(.Phone("(079)455-3912"), label: "home"),
                ContactMethod(.Phone("(046)7374-908"), label: "cell")
                ]),
            Contact(firstName: "Jeanette", middleName: "Leslie", lastName: "Vasquez", nickName: "heavyelephant664", gender: .Female, contactMethods: [
                ContactMethod(.Email("jeanette.vasquez@example.com"), label: "main"),
                ContactMethod(.Phone("(036)612-9903"), label: "home"),
                ContactMethod(.Phone("(042)4579-737"), label: "cell")
                ]),
            Contact(firstName: "Robert", middleName: "Martin", lastName: "Vasquez", nickName: "lazylion810", gender: .Male, contactMethods: [
                ContactMethod(.Email("robert.vasquez@example.com"), label: "main"),
                ContactMethod(.Phone("(025)762-1413"), label: "home"),
                ContactMethod(.Phone("(045)9184-623"), label: "cell")
                ]),
            Contact(firstName: "Jacqueline", middleName: "Darryl", lastName: "Vasquez", nickName: "lazyostrich347", gender: .Female, contactMethods: [
                ContactMethod(.Email("jacqueline.vasquez@example.com"), label: "main"),
                ContactMethod(.Phone("(060)509-1738"), label: "home"),
                ContactMethod(.Phone("(042)1022-613"), label: "cell")
                ]),
            Contact(firstName: "Jimmie", middleName: "Javier", lastName: "Vasquez", nickName: "lazyswan344", gender: .Male, contactMethods: [
                ContactMethod(.Email("jimmie.vasquez@example.com"), label: "main"),
                ContactMethod(.Phone("(014)087-1376"), label: "home"),
                ContactMethod(.Phone("(041)6682-147"), label: "cell")
                ]),
            Contact(firstName: "Terrence", middleName: "Serenity", lastName: "Vasquez", nickName: "lazywolf942", gender: .Male, contactMethods: [
                ContactMethod(.Email("terrence.vasquez@example.com"), label: "main"),
                ContactMethod(.Phone("(015)733-5449"), label: "home"),
                ContactMethod(.Phone("(041)1939-713"), label: "cell")
                ]),
            Contact(firstName: "Lloyd", middleName: "Anne", lastName: "Vasquez", nickName: "ticklishbutterfly391", gender: .Male, contactMethods: [
                ContactMethod(.Email("lloyd.vasquez@example.com"), label: "main"),
                ContactMethod(.Phone("(055)370-5762"), label: "home"),
                ContactMethod(.Phone("(041)5966-124"), label: "cell")
                ]),
            Contact(firstName: "Glen", middleName: "Beatrice", lastName: "Wade", nickName: "bluedog244", gender: .Male, contactMethods: [
                ContactMethod(.Email("glen.wade@example.com"), label: "main"),
                ContactMethod(.Phone("(088)268-3390"), label: "home"),
                ContactMethod(.Phone("(048)7241-203"), label: "cell")
                ]),
            Contact(firstName: "Priscilla", middleName: "Gilbert", lastName: "Wright", nickName: "biglion810", gender: .Female, contactMethods: [
                ContactMethod(.Email("priscilla.wright@example.com"), label: "main"),
                ContactMethod(.Phone("(026)647-3172"), label: "home"),
                ContactMethod(.Phone("(048)7534-523"), label: "cell")
                ]),
            Contact(firstName: "Vincent", middleName: "Serenity", lastName: "Wright", nickName: "lazyfrog446", gender: .Male, contactMethods: [
                ContactMethod(.Email("vincent.wright@example.com"), label: "main"),
                ContactMethod(.Phone("(037)836-7469"), label: "home"),
                ContactMethod(.Phone("(045)8837-293"), label: "cell")
                ]),
            Contact(firstName: "Leona", middleName: "Rachel", lastName: "Wright", nickName: "tinyladybug828", gender: .Female, contactMethods: [
                ContactMethod(.Email("leona.wright@example.com"), label: "main"),
                ContactMethod(.Phone("(064)384-3098"), label: "home"),
                ContactMethod(.Phone("(047)2249-075"), label: "cell")
                ]),
            Contact(firstName: "Avery", middleName: "Frederick", lastName: "Wright", nickName: "tinymeercat561", gender: .Female, contactMethods: [
                ContactMethod(.Email("avery.wright@example.com"), label: "main"),
                ContactMethod(.Phone("(010)011-4452"), label: "home"),
                ContactMethod(.Phone("(048)7870-439"), label: "cell")
                ]),
            Contact(firstName: "Miguel", middleName: "Melvin", lastName: "Young", nickName: "beautifulduck773", gender: .Male, contactMethods: [
                ContactMethod(.Email("miguel.young@example.com"), label: "main"),
                ContactMethod(.Phone("(002)343-9363"), label: "home"),
                ContactMethod(.Phone("(041)5490-153"), label: "cell")
                ]),
            Contact(firstName: "Jamie", middleName: "Mattie", lastName: "Young", nickName: "bigpanda898", gender: .Male, contactMethods: [
                ContactMethod(.Email("jamie.young@example.com"), label: "main"),
                ContactMethod(.Phone("(008)916-5586"), label: "home"),
                ContactMethod(.Phone("(048)2561-185"), label: "cell")
                ]),
            ])
    }
}