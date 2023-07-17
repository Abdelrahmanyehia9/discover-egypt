import '../../features/Guide/data/model/tour_package.dart';

/// Standard packages database
TourGuidePackageModel p1 = TourGuidePackageModel(tittle: 'Pyramids Trip'  ,
subTittle: "Escape Giza’s persistent hawkers and enjoy three classic Egyptian experiences in just half a day on this convenient door-to-door tour. Learn about ancient Egypt from your private guide as you admire the three pyramids, the Sphinx, and the Valley Temple, pose for iconic photos, and cruise across the desert sands on camel-back. Enjoy your Egyptian lunch in a traditional restaurant." ,
  images: ['https://d3rr2gvhjw0wwy.cloudfront.net/uploads/activity_galleries/272563/2000x2000-0-70-6bc8b9fb3d169496977eb5cb144e4e33.jpg' ,
    'https://d3rr2gvhjw0wwy.cloudfront.net/uploads/activity_headers/272563/900x600-1-50-d2159c080d07b1dde042fd1059c54ccd.jpg' ,
    'https://d1b3667xvzs6rz.cloudfront.net/2020/12/IMG-20201220-WA0004.jpg' ,
  ] ,
  price: "125.25" ,
  rating: 4.5 ,
  opening:  [ '8:00 am' , '3:00 pm']
) ;
TourGuidePackageModel p2 = TourGuidePackageModel(tittle: 'Egyptian  Museum '  ,
    subTittle: "This famous museum houses the world’s largest collection of ancient Egyption artifacts (more than 120,000 items on display) featuring the famous Tutankhamun collection with its beautiful gold death mask and sarcophagus and the royal Mummy room, which houses an additional eleven Pharaonic dignitaries.",
    images: ['https://www.egypttoday.com/siteimages/Larg/202104060425572557.jpg' ,
      'https://www.ocregister.com/wp-content/uploads/2023/03/IMG-2912-2-1.jpg' ,
      'https://www.wantedinafrica.com/i/preview/storage/uploads/2020/04/Grand_Egyptian_Museum_opening_shifted_to_2021.jpg' ,
    ] ,
    price: "125.25" ,
  opening:  [
'11:25 am' , '2:00 pm'
  ]
) ;
TourGuidePackageModel c1 = TourGuidePackageModel(tittle: 'Cairo Tower '  ,
subTittle: 'At a height of 600 feet, this tower offers magnificent views of the entire city and monuments from its revolving rooftop restaurant and bar' ,
    images: ['https://www.barcelo.com/guia-turismo/wp-content/uploads/2022/05/el-cairo-torre-888.jpg' ,
      'https://c8.alamy.com/comp/RDPH6G/daylight-shot-for-cairo-tower-in-egypt-the-cairo-tower-is-a-free-standing-concrete-tower-in-cairo-egypt-at-187-m-614-ft-it-has-been-the-tallest-RDPH6G.jpg' ,
    ] ,
    price: "15.75" ,
    opening:  [
      '9:00 am' , '5:00 pm'
    ] ,
  rating: 3.8 ,

) ;
TourGuidePackageModel l1 = TourGuidePackageModel(tittle: 'Luxor City'  ,
subTittle: 'Step back in time with a full-day tour of Luxor’s ancient tombs and treasures from Hurghada. Enjoy views of the Egyptian desert as you travel by air-conditioned vehicle, and explore the iconic sites on both sides of the Nile River. Step between two great lines of sphinxes as you enter Karnak Temple to see the buildings and sacred lake within the complex. Pause for lunch at a local restaurant before visiting the Valley of the Kings, and take in royal tombs and Queen Hatshepsut’s vast temple before returning to Hurghada.',
  images: [
    'https://d3rr2gvhjw0wwy.cloudfront.net/uploads/activity_galleries/40291/2000x2000-0-70-b8675c2ef7da677b99d489e97b6d1441.jpg',
    'https://www.toursfromhurghada.com/wp-content/uploads/2022/02/2-Days-Trip-From-Hurghada-to-Luxor-Tours-From-Hurghada.jpg' ,
    'https://diveukhurghada.co.uk/wp-content/uploads/2021/01/Luxor-Tour-and-Day-Trip-from-Sharm-El-Sheikh-by-Flight-1-10452.jpg' ,
    'https://media.tacdn.com/media/attractions-splice-spp-674x446/06/74/d3/b4.jpg' ,
  ] ,
  price: "499.99" ,

  rating: 4.4 ,

) ;
TourGuidePackageModel as1 = TourGuidePackageModel(tittle: 'Aswan City'  ,
subTittle: "Experience the wonders of Aswan with Emo Tours Egypt's private tours. Discover the ancient marvels of Philae Temple and High Dam on our exclusive day tour, or embark on a breathtaking journey to the iconic Abu Simbel Temple. With the best prices in town, book online now to secure your spot and create unforgettable memories in Aswan. Don't miss out on our additional day tour to Luxor from Aswan and more. Trust Emo Tours Egypt for an exceptional and professional travel experience."
  ,  images: [
        'https://joujoutravels.com/wp-content/uploads/2023/01/katoo-dool-nubian-village-colorful-places-egypt-819x1024.jpeg' ,
  ] ,
  price: "199.99" ,

  rating: 3.8 ,

) ;
List<TourGuidePackageModel>crisPack=[p1, p2 , l1 ];
List<TourGuidePackageModel>lioPack=[c1, as1 , p1 , p2];

