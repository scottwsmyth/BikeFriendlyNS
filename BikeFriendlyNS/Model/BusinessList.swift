//
//  BusinessList.swift
//  BikeFriendlyNS
//
//  Created by Scott Smyth on 2019-06-17.
//  Copyright © 2019 Scott Smyth. All rights reserved.
//

//["title":"","latitude": 0, "longitude": 0, "URL": "", "des2": "", "des": "", "img": UIImage(named: <#T##String#>)!]

import UIKit

//Class holds all of the businesses on the map view.

class BusinessList {
    
    var points = [
        
                ["title":"The New Glasgow Town Hall","latitude": 45.588, "longitude": -62.644, "URL":"https://www.facebook.com/pages/New-Glasgow-Town-Hall/499748663861117", "des2": "New Glasgow is a beautiful riverside town of 9,455 residents, located in northern Nova Scotia, which serves as the commercial-service centre for the region of Pictou County with a population of 46,513.", "des": "(902) 755-7788\n111 Provost St, New Glasgow, NS B2H 5E1", "img": UIImage(named: "NewGlasgow.png")!]

        ,
                ["title":"Holiday Inn Truro","latitude": 45.3663, "longitude": -63.2898, "URL": "https://www.facebook.com/holidayinntruro/", "des2": "A perfect choice for the business and leisure traveler, our beautiful hotel is 100% non-smoking, pet friendly and committed to the environment. As a 3 key rated hotel in the Green Key Eco-Rating program, our pool, hot tub and domestic hot water are heated by 26 solar panels on the top of the building. We also offer in-house dining at our restaurant and lounge, the Bistro on Prince, where kids under twelve eat free and there is truly something for everyone.", "des": "(902) 895-1651\n437 Prince St, Truro, NS B2N 1E6", "img": UIImage(named: "Holiday-Inn.png")!]
        ,
                ["title":"Mercator Vineyards","latitude": 45.1011, "longitude": -64.3277, "URL": "https://www.facebook.com/mercatorwine/", "des2": "Situated on a bluff above the historic Acadian dykelands, Mercator Vineyards sits at the point where the Cornwallis River enters the tidal bay of the Minas Basin. The vineyards are located just to the east of the town of Wolfville, Nova Scotia and adjacent to the Grand-Pré National Historic site.", "des": "(902) 542-7770\n88 Dyke Rd, Wolfville, NS B4P 2R1", "img": UIImage(named: "Mercator-Vineyards.png")!]
        ,
               ["title":"Halifax Cycles and Guitars","latitude": 44.6621, "longitude": -63.6176, "URL": "https://www.facebook.com/HalifaxCycles/", "des2": "Bicycle repair shop with new and used bicycles for sale. We repair all makes & models, carry wide range of bicycle lifestyle accessories as well as everything you need for your daily commuting/ recreation needs.", "des": "(902) 407-4222\n3600 Kempt Rd, Halifax, NS B3K 4X8", "img": UIImage(named: "Cycles-Guitars.png")!]
        ,
               ["title":"Hants Exhibition Grounds","latitude": 44.9912, "longitude": -64.1153, "URL": "https://www.facebook.com/hantscountyex/", "des2": "Hants County Exhibition is North America's Oldest Agricultural Fair established in 1765. The Exhibition is held over two weekends in September each year. The grounds also hosts many horse shows, musical shows and campouts throughout the summer months.", "des": "(902) 798-0000\n221 Wentworth Rd, Windsor, NS B0N 2T0", "img": UIImage(named: "Hants-Exhibition-Grounds.png")!]
        ,
               ["title":"Queens Place Emera Centre","latitude": 44.0491, "longitude": -64.7214, "URL": "https://www.facebook.com/wileslakefarmmarket/", "des2": "We have a unique combination of greenhouses, farm market, market kitchen and bakery. A great spot to enjoy locally grown produce from our farm and others in the area, get some freshly baked bread and sweets, comfort food to take home from our kitchen and shop for flowers and shrubs for your garden.", "des": "(902) 543-6082\n3254 NS-325, Wileville, NS B4V 5G8", "img": UIImage(named: "Queens-Place.png")!]
        ,
               ["title":"Wiles Lake Farmers Market","latitude": 44.3708, "longitude": -64.5688, "URL": "https://www.facebook.com/QueensPlaceEmeraCentre/", "des2": "Owned and operated by the Region of Queens Municipality, Queens Place Emera Centre is a major hub on Nova Scotia's South Shore for recreational, social, and cultural activity.", "des": "(902) 354-4422\n50 Queens Pl Dr, Liverpool, NS B0T 1K0", "img": UIImage(named: "Wiles-Lake.png")!]
        ,
               ["title":"Best Western Plus","latitude": 44.0508, "longitude": -64.7230, "URL": "https://www.facebook.com/bestwesternliverpoolhotel/", "des2": "Located just off the Highway 103 on Nova Scotia's South Shore, the Best Western Plus Liverpool Hotel & Conference Center offers the best in customer service & accommodations.", "des": "(902) 354-2377\n63 Queens Pl Dr, Liverpool, NS B0T 1K0", "img": UIImage(named: "Best-Western-Plus")!]
        ,
               ["title":"BernArt","latitude": 44.4354, "longitude": -64.4441, "URL": "https://www.facebook.com/bernartca/", "des2": "BernArt .... be aMAZEd is Canada's first art maze and outdoor gallery with lots of sculptures, mosaics and murals throughout. A surprise around every corner created by artists from around the world.", "des": "(902) 553-0790\n1136 NS-325, Blockhouse, NS B0J 1E0", "img": UIImage(named: "BernArt")!]

        ,
               ["title":"OceanStone Seaside Resort","latitude": 44.5208, "longitude": -63.9363, "URL": "https://www.facebook.com/oceanstoneresort/", "des2": "Oceanstone Resort is a gem on the South Shore of Nova Scotia, located minutes away from the picturesque Peggy’s Cove. Oceanstone Resort is a premiere location for weddings, corporate events, or a weekend getaway. We are ideally located 40 minutes from Halifax and 45 minutes from the airport.", "des": "(902) 823-2160\n8650 Peggys Cove Rd, Indian Harbour, NS B3Z 3P4", "img": UIImage(named: "OceanStone")!]
        ,
               ["title":"Velofix NS","latitude": 44.6445, "longitude": -63.6192, "URL": "https://www.facebook.com/velofixhrm/", "des2": "Velofix is your Nova Scotia mobile bike, ski and skate shop that comes to your home, workplace or event. Easy online booking and we come to you. Check out www.velofix.com #savetimeridemore", "des": "1 (855)-835-6349\nNo address: This is a mobile Bike Shop", "img": UIImage(named: "Velofix")!]
        ,
              ["title":"Meander River Brewery","latitude": 45.0046, "longitude": -63.9253, "URL": "https://www.facebook.com/MeanderRiverFarm/", "des2": "Consisting of 186 acres, the farm features 2.5 acres of hops, a newly built micro-brewery, lavender fields, lush gardens, Hants County's tallest waterfall, seasonal livestock and retail shop. The shop offers tours, tastings and handmade products created on the farm.", "des": "(902) 757-3484\n906 Woodville Rd, Newport, NS B0N 2A0", "img": UIImage(named: "Meander-Brewery")!]
        ,
              ["title":"Breton Brewery","latitude": 46.1193, "longitude": -60.2322, "URL": "https://www.facebook.com/bretonbrewing/", "des2": "Located on the majestic island of Cape Breton, Breton Brewing Co. crafts natural, unfiltered and preservative-free ales & lagers. Passion cascades in every pour from this locally owned and operated craft brewery. Crafted by Passion!", "des": "(902) 270-4677\n364 Keltic Dr, Sydney, NS B1R 1V7", "img": UIImage(named: "Breton")!]
        ,
              ["title":"Good Robot Brewery","latitude": 44.6565, "longitude": -63.5977, "URL": "https://www.facebook.com/goodrobotbrew/", "des2": "Welcome to Good Robot Brewing Company's Facebook page, where we're taking our love of beer to mundane and narcissistic levels. #goodrobotbrewingco", "des": "(902) 446-1692\n2736 Robie St, Halifax, NS B3K 4P2", "img": UIImage(named: "GoodRobot")!]
        ,
              ["title":"Tanner and Co. Brewing","latitude": 44.5792, "longitude": -64.3224, "URL": "https://www.facebook.com/TannerBrewing/", "des2": "A small brewery in the heart of the South Shore Nova Scotia, focusing on traditional German Ale recipes. But to keep things interesting my culinary roots draw me to experiment, so look forward to single batch non-traditional brews.", "des": "(902) 298-0032\n50 Hiltz Rd, Chester Basin, NS B0J 1K0", "img": UIImage(named: "Tanner")!]
        ,
              ["title":"River Ridge Lodge","latitude": 44.4846, "longitude": -64.3328, "URL": "https://www.facebook.com/NovaScotiaRiverRidgeLodge/", "des2": "A Bed & Breakfast in a newly renovated riverside historic farmhouse on 10 pastoral acres, located on Martin's River, minutes from Mahone Bay. We offer well-appointed and comfortable accommodations with modern amenities.", "des": "(902) 531-2284\n28 Silver Point Rd, Mahone Bay, NS B0J 2E0", "img": UIImage(named: "RiverRidge")!]
        ,
              ["title":"Train Station Bike and Bean","latitude": 44.6940, "longitude": -63.8866, "URL": "https://www.facebook.com/trainstationbikeandbean/", "des2": "Coffee, Muffins, Scones, Soup, Paninis, Wraps, Specialty Drinks!", "des": "(902) 820-3400\n5401 St Margarets Bay Rd, Upper Tantallon, NS B3Z 2H9", "img": UIImage(named: "Bike&Bean")!]
        ,
              ["title":"Cloud Nine Novelties","latitude": 44.9925, "longitude": -64.1402, "URL": "https://www.facebook.com/CloudNineNovelties/", "des2": "For all your cannabis paraphernalia/needs!", "des": "(902) 472-2630\n44 Albert St, Windsor, NS B0N 2T0", "img": UIImage(named: "CloudNineNovelties")!]
        ,
              ["title":"Cathedral Church of All Saints","latitude": 44.6401, "longitude": -63.5805, "URL": "https://www.facebook.com/asecathedral/", "des2": "Built in 1848 by the people of St. Thomas in thanksgiving to God for freedom from slavery. Because of a severe drought in 1848, molasses was used to mix the mortar used between the stones.", "des": "(902) 423-6002\n1330 Cathedral Ln, Halifax, NS B3H 2Z1", "img": UIImage(named: "CathedralChurch")!]
        ,
              ["title":"Garden House B&B","latitude": 45.0926, "longitude": -64.3526, "URL": "https://www.facebook.com/pages/category/Bed-and-Breakfast/Garden-House-Bed-and-Breakfast-Inn-652503178096854/", "des2": "Garden House is Key West Florida's FUN Bed and Breakfast Inn, with ten rooms and a heated lagoon-style pool, just a block from historic downtown.", "des": "1 (305) 296-5368", "img": UIImage(named: "GardenHouse")!]
        ,
              ["title":"Annapolis Valley Cider","latitude": 45.0919, "longitude": -64.3602, "URL": "https://www.facebook.com/drinkannapolis/", "des2": "We make ciders from 100% Annapolis Valley apples. Come visit our cidery and tasting bar on Main Street in Wolfville, Nova Scotia.", "des": "(902) 697-2707\n388 Main St, Wolfville, NS B4P 1C9", "img": UIImage(named: "Annapolis")!]
        ,
              ["title":"Garrison Brewery","latitude": 44.6398, "longitude": -63.5663, "URL": "https://www.facebook.com/garrisonbrewing/?rf=200387626663650", "des2": "Founded in 1997, Garrison Brewery has expanded its selection of fine ales from our inaugural batch of “Irish Red Ale” to over 12 fine craft beers. We remain focused on providing Nova Scotia with some of the best craft beer available.", "des": "(902) 453-5343\n1149 Marginal Rd, Halifax, NS B3H 4P7", "img": UIImage(named: "Garrison")!]
        ,
              ["title":"Northumberland Ferry Limited","latitude": 45.7310, "longitude": -62.6917, "URL": "", "des2": "", "des": "", "img": UIImage(named: "Northumberland")!]
        ,
              ["title":"Bay Ferry Ltd “Fundy Rose”","latitude": 44.6601, "longitude": -65.7568, "URL": "", "des2": "Check the Northumberland Ferries schedule for ferry crossings between Caribou, Nova Scotia and Wood Islands, PEI.", "des": "1 (877) 762-7245\nTrans-Canada Hwy, Pictou, NS B0K 1H0", "img": UIImage(named: "BayFerry")!]
        ,
              ["title":"Duncans Pub","latitude": 45.8281, "longitude": -64.2162, "URL": "https://www.facebook.com/DuncansPub/", "des2": "Where memories are made.", "des": "(902) 660-3111\n49 Victoria St E, Amherst, NS B4H 1X4", "img": UIImage(named: "DuncansPub")!]
        ,
              ["title":"Kaulbach House","latitude": 44.3771, "longitude": -64.3115, "URL": "https://www.facebook.com/KaulbachHouse/", "des2": "Kaulbach House is a Bed & Breakfast built in 1880 and located in the centre of the World Heritage town of Lunenburg. On-site parking and a warm welcome.", "des": "(902) 634-8818\n75 Pelham St, Lunenburg, NS B0J 2C0", "img": UIImage(named: "KaulbackHouse")!]
        ,
              ["title":"The Union Street Cafe","latitude": 45.0423, "longitude": -64.7353, "URL": "https://www.facebook.com/pg/theunionstreet/about/?ref=page_internal", "des2": "Luscious and local since 2000!", "des": "(902) 538-7787\n183 Commercial St, Berwick, NS B0P 1E0", "img": UIImage(named: "UnionStreet")!]
        ,
              ["title":"Harbour Guesthouse","latitude": 43.4410, "longitude": -65.6262, "URL": "https://www.facebook.com/CapeSableIslandBedandBreakfast/", "des2": "New charming guest house located on Cape Sable Island, Nova Scotia.", "des": "(902) 307-4731\n2897 Main St, Clark's Harbour, NS B0W 1P0", "img": UIImage(named: "HarbourGuesthouse")!]
        ,
              ["title":"Bear River Millyard and Recreation","latitude": 44.5794, "longitude": -65.6411, "URL": "https://www.facebook.com/MillyardRecreation", "des2": "Located along the tidal Bear River, we have created a unique design of camp cottages, which combine upscale camping accommodations, gazebos, and an exceptional view of the tidal river.", "des": "(902) 249-0250\n1145 River Rd, Smiths Cove, NS B0S 1S0", "img": UIImage(named: "BearRiver")!]
        ,
              ["title":"Mountain Equipment Coop","latitude": 44.6457, "longitude": -63.5728, "URL": "https://www.facebook.com/mec/", "des2": "Canada’s leading outdoor retailer, MEC (Mountain Equipment Co-op) is passionate about inspiring and enabling everyone to lead active outdoor lifestyles.", "des": "(902) 421-2667\n1550 Granville St, Halifax, NS B3J 1X1", "img": UIImage(named: "MEC")!]
        ,
              ["title":"We’re Outside Outdoor Outfitters","latitude": 45.0915, "longitude": -64.3632, "URL": "https://www.facebook.com/were.outside.outdoor.outfitters/", "des2": "We're an independent high quality apparel and footwear store. Blundstones Arc'teryx Birkenstock Salomon Keen OluKai Smartwool Icebreaker NorthFace UGG.", "des": "(902) 542-3065\n462 Main St, Wolfville, NS B4P 1E2", "img": UIImage(named: "OutsideOutdoor")!]
        ,
              ["title":"Sportwheels Sports Excellence","latitude": 44.7587, "longitude": -63.6682, "URL": "https://www.facebook.com/sportwheels.sec/", "des2": "Sportwheels Sports Excellence is a family owned business serving and supporting the community of Halifax for over 65 years.", "des": "(902) 865-9033\n209 Sackville Dr, Lower Sackville, NS B4C 2R5", "img": UIImage(named: "Sportwheels")!]
        ,
              ["title":"Berwick and District Library","latitude": 45.0465, "longitude": -64.7361, "URL": "https://www.facebook.com/berwicklibrary/", "des2": "The Berwick Public Library has wonderful collections for children, young adults, and adults; comfortable spaces for enjoying books and periodicals; and special activities covering a variety of interests. All are welcome. Library cards are free to all Berwick residents. We are in the Southern Maine Library District.", "des": "(902) 538-8060\n236 Commercial St, Berwick, NS B0P 1E0", "img": UIImage(named: "Berwick&District")!]
        ,
              ["title":"Rumb Line Bicycles","latitude": 44.3763, "longitude": -64.3082, "URL": "https://www.facebook.com/pg/LunenburgBikeShop/photos/?ref=page_internal", "des2": "Lunenburg's Bicycle Repair, Retail & Rental Shop. We sell new and used Canadian designed bikes for both kids & adults - Mountain, Hybrid, City, Electric Assist, Road and more. In addition to selling, repairing & renting bikes, we also carry a line of locally handcrafted goods for on and off the bicycle. We look forward to having you come visit our unique bike shop!", "des": "(902) 521-6115\n151 Montague St, Lunenburg, NS B0J 2C0", "img": UIImage(named: "RumbLine")!]
        ,
              ["title":"Earltown General Store","latitude": 45.5773, "longitude": -63.1371, "URL": "https://www.facebook.com/downtownearltown/", "des2": "Nestled in the hills of the Cobequid Mountains, we can't be missed at the crossroads in Downtown Earltown. Established in 1890 - we provide goods and services to the local community and travelers. Stop by on your way to the North Shore.", "des": "(902) 657-9001\n5556 NS-311, Tatamagouche, NS B0K 1V0", "img": UIImage(named: "Earltown")!]
        ,
              ["title":"Tangled Gardens","latitude": 45.1053, "longitude": -64.2963, "URL": "https://www.facebook.com/TangledGardenHerbs/", "des2": "We create special herb jellies such as Raspberry Lavender and Garlic Rosemary. We also produce delicious jams, chutneys, mustards, vinegars and liqueurs.", "des": "(902) 542-9811\n11827 Nova Scotia Trunk 1, Grand Pré, NS B0P 1M0", "img": UIImage(named: "TangledGardens")!]
        ,
              ["title":"Cyclesmith","latitude": 44.6549, "longitude": -63.5927, "URL": "https://www.facebook.com/CyclesmithHfx/", "des2": "Giving you the best service and selection has been Cyclesmith's focus for twenty eight years and has established us as the premier bike store in Halifax and Atlantic Canada. We offer the best brands in the industry, the largest selection of bikes, accessories and clothing, a complete full service repair department, and friendly and knowledgeable personnel.", "des": "(902) 425-1756\n2553 Agricola St, Halifax, NS B3K 4C4", "img": UIImage(named: "Cyclesmith")!]
        ,
              ["title":"Lane's Privateer Inn","latitude": 44.0416, "longitude": -64.7181, "URL": "https://www.facebook.com/lanesprivateerinn/", "des2": "Historic inn, restaurant, bookstore, gourmet shop located on the Mersey River in Liverpool, Nova Scotia. Amazing venue for weddings, concerts, wine tasting.", "des": "(902) 354-3456\n27 Bristol Ave, Liverpool, NS B0T 1K0", "img": UIImage(named: "Lanes")!]
        ,
              ["title":"Francis Independent Grocer","latitude": 44.3752, "longitude": -64.3251, "URL": "https://b-m.facebook.com/francisindependentgrocer/", "des2": "Today: Your Independent Grocer® operates 54 one-stop-shop-supermarkets throughout Ontario predominantly in northern Ontario, Sudbury, and Ottawa regions.", "des": "(902) 634-3751\n143 Victoria Road, Lunenburg, NS B0J 2C0", "img": UIImage(named: "Francis")!]
        ,
              ["title":"Isle Madame iFIT Centre","latitude": 45.5137, "longitude": -61.0260, "URL": "https://www.facebook.com/ifitcentreifit/?rf=391133487706364", "des2": "Fitness Centre/ centre d'activité, cardio & Weight Equipment/a d'équipement de cardio et poids. A multi-purpose room/ une salle multifonctionnelle.", "des": "(902) 226-0204\n2359 Route 206, Arichat, Nova Scotia B0E 1A0", "img": UIImage(named: "iFIT")!]
        ,
              ["title":"The Scotsman Inn","latitude": 45.6761, "longitude": -62.7087, "URL": "https://www.facebook.com/pages/The-Scotsman-Inn/1050161868448283", "des2": "Welcome to The Scotsman Inn built in 1865, situated in the heart of historic Pictou. This Pictou Historic building at the top of Pictou's main street gives little indication of the elegant Inn awaiting within, which combines the charm of a bed and breakfast with the privacy of an inn, all in a graceful setting and a short walk to the waterfront, museums, restaurants, shops and live musical performances.", "des": "(902) 485-1433\n78 Coleraine St, Pictou, NS B0K 1H0", "img": UIImage(named: "Scotsman")!]
        ,
              ["title":"The Dancing Goat Café and Bakery","latitude": 46.3256, "longitude": -61.0022, "URL": "https://www.facebook.com/DancingGoatCafe/", "des2": "The Dancing Goat is a cafe/bakery in Margaree, Cape Breton. Located directly on the Cabot Trail #6289.", "des": "(902) 248-2727\n6289 Cabot Trail, Margaree Valley, NS B0E 2C0", "img": UIImage(named: "DancingGoat")!]
        ,
              ["title":"Lacey Mines Campground","latitude": 44.5686, "longitude": -64.3288, "URL": "https://www.facebook.com/zencamping/", "des2": "A family camping experience for the body, mind and soul.Keeping it simple since 2018!", "des": "(902) 275-2446\n371 Lacey Mines Rd, Chester Basin, NS B0J 1K0", "img": UIImage(named: "LaceyMines")!]
        ,
              ["title":"Hub Cycle","latitude": 45.3638, "longitude": -63.2761, "URL": "https://www.facebook.com/hubcycletruro/", "des2": "We are a locally owned and operated bicycle shop in Truro, NS. We carry Specialized, Giant and Norco bikes primarily, and also numerous BMX brands. In the wintertime we carry snowshoes and cross-country skis in many different brands.", "des": "(902) 897-2482\n33 Inglis Pl, Truro, NS B2N 4B5", "img": UIImage(named: "HubCycle")!]
        ,
              ["title":"The Maven Gypsy B&B and Cottages","latitude": 46.5492, "longitude": -60.4117, "URL": "https://www.facebook.com/pages/The-Maven-Gypsy/942393009137918", "des2": "Bed & Breakfast and Cottages. On the Cabot Trail at Wreck Cove, Cape Breton, Nova Scotia. 3. Your Home Base While Exploring the Cabot Trail. ", "des": "(902) 929-2246\n41682 Cabot Trail, Wreck Cove, Cape Breton Island, Victoria, Subd. A, NS B0C 1H0", "img": UIImage(named: "Maven")!]
        ,
              ["title":"Jeff’s Old Volkswagon Home","latitude": 44.5897, "longitude": -64.1870, "URL": "https://www.facebook.com/pages/category/Motor-Vehicle-Company/Jeffs-Old-Volks-Home-330716820460427/", "des2": "Jeff's Old Volks Home, Your East Coast connection for all things Volkswagen. We're suppliers and installers of the worlds finest Volkswagen Accessories.", "des": "(902) 273-2208\n2376 Nova Scotia Trunk 3, Chester, NS B0J 1J0", "img": UIImage(named: "Jeffs")!]
        ,
              ["title":"Mabou River Inn","latitude": 46.0690, "longitude": -61.3983, "URL": "https://www.facebook.com/mabouriverinnpizza/", "des2": "Come experience traditional Cape Breton Island hospitality at Mabou River Inn, Inverness County, Nova Scotia, and enjoy the excellent food, spectacular beaches, beautiful highlands setting, Celtic music and Scottish culture.", "des": "(902) 945-2356\n19 SW Ridge Rd, Mabou, NS B0E 1X0", "img": UIImage(named: "Mabou")!]
        ,
              ["title":"Snow White Laundry and Convenience","latitude": 45.8347, "longitude": -64.2119, "URL": "https://www.facebook.com/pages/Snow-White-Laundry-Convenience/169903323604438", "des2": "Snow White Laundry & Convenience is a partnership owned and operated by Jambhala Inc. The store is located in the heart of downtown Amherst, Nova Scotia, Canada. We provide grocery products and coin operated self- service laundry to the customers.", "des": "(902) 667-1922\n109 Victoria St E, Amherst, NS B4H 1X9", "img": UIImage(named: "SnowWhite")!]
        ,
              ["title":"Pavia Espresso Bar and Cafe","latitude": 44.5702, "longitude": -63.5685, "URL": "https://www.facebook.com/paviahalifax/", "des2": "At PAVIA we strive to provide you with an exceptional experience. Whether it is a grilled panino, a freshly baked ricciarelli, or an italian-style cappuccino, we take great care to provide authentic touches.", "des": "(902) 407-4008\n5440 Spring Garden Rd, Halifax, NS B3J 1E9", "img": UIImage(named: "Pavia")!]
        ,
              ["title":"The Burlington Rose","latitude": 45.0691, "longitude": -64.1088, "URL": "https://www.facebook.com/Burlington-Rose-Holiday-Home-219431038848413/", "des2": "House history: This house was built circa 1860. It has been owned by 2 families - Burgess (who built the home) and Sanford. This house has changed very little from the early days, yet has all the modern amenities.", "des": "(902) 757-3330\n3459 HWY 215, B0N 1E0, NS", "img": UIImage(named: "BurlingtonRose")!]
        ,
              ["title":"Velo Baie Sainte-Marie","latitude": 44.2576, "longitude": -66.1285, "URL": "https://www.facebook.com/velobaiesaintemarie/", "des2": "Vélo Baie Sainte-Marie is a new, locally owned bike store located in Saulnierville, NS, in the heart of the Acadian Municipality of Clare. We provide a large variety of GIANT bikes, gear and accessories.", "des": "(902) 769-0221\n9976 Nova Scotia Trunk 1, Saulnierville, NS B0W 2Z0", "img": UIImage(named: "VeloBaie")!]
        ,
              ["title":"The Bicycle Specialist","latitude": 45.8268, "longitude": -64.1975, "URL": "https://www.facebook.com/TheBicycleSpecialist/", "des2": "A small retail store that's BIG ON SERVICE with experience in bicycle repair, skate sharpening and ski tuning. After hours phone: 902-667-1645.", "des": "(902) 660-3393\n198 Church Street, Amherst, Nova Scotia B4H 3C6", "img": UIImage(named: "BicycleSpecialist")!]
        ,
              ["title":"Frameworks Cycles and Fitness","latitude": 46.1400, "longitude": -60.1926, "URL": "https://www.facebook.com/frameworkcycle/", "des2": "The #1 source on Cape Breton Island for road, mountain, urban and BMX bicycles, pro scooters and all makes of fitness equipment for home or commercial use.", "des": "(902) 567-1909\n333 George St, Sydney, NS B1P 1J7", "img": UIImage(named: "Frameworks")!]
        ,
              ["title":"Bike Monkey","latitude": 45.3628, "longitude": -63.2753, "URL": "https://www.facebook.com/bikemonkey.ca/", "des2": "Full-service bicycle shop, family owned and community oriented since 2014, featuring skate service (both hockey and figure) and accessories.", "des": "(902) 843-7111\n130 Esplanade St, Truro, NS B2N 2K3", "img": UIImage(named: "BikeMonkey")!]
        ,
              ["title":"Bank Bikes","latitude": 45.0919, "longitude": -64.3590, "URL": "https://www.facebook.com/banksbikes/", "des2": "With a staff as passionate about cycling as I am, we plan on creating a shop that will help start, or further your obsession with cycling. So welcome to Banks Bikes, hold on, we are going to have a lot of fun!", "des": "(902) 542-2596\n360 Main St, Wolfville, Nova Scotia B4P 1C4", "img": UIImage(named: "BanksBikes")!]
        ,
              ["title":"Idealbikes","latitude": 44.6380, "longitude": -63.6657, "URL": "https://www.facebook.com/idealbikeschainlake/", "des2": "Bicycle sales, service & rentals. Specialized core store. Felt & Raleigh dealer.", "des": "(902) 444-7487\n103 Chain Lake Dr, Halifax, NS B3S 0G1", "img": UIImage(named: "IdealBikes")!]
        ,
              ["title":"Highland Bike Shop","latitude": 45.6224, "longitude": -61.9909, "URL": "https://www.facebook.com/HighlandBikeShop/", "des2": "Highland Bike Shop started business in 2013, and is now owned and operated by Matthieu Fraser and Ralene Chelsea Doiron (and our dog Inuk). We started out focusing on bikes, but we have grown to support snowshoes, skiing, trail running and hiking. We support a local bike club, support local races, and support our local Keppoch Mtn. multi-use park.", "des": "(902) 735-3320\n", "img": UIImage(named: "Highland")!]
    ]
    
    init(){
        
    }
    
   
    
    
}

