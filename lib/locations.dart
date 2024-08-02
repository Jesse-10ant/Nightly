class Location {
  String name;
  String address;
  String url;
  String website;
  String description;
  String hours;
  String neighborhood;
  String vibe;
  String price;

  Location(
      {required this.name,
      required this.address,
      required this.website,
      required this.description,
      required this.hours,
      required this.vibe,
      required this.price,
      required this.neighborhood,
      required this.url});
  static List<Location> favoriteLocations = [];
  static List<Location> locationsList = [
    //------DANCE------
    Location(
        name: 'The Lets Go! Disco & Cocktail Club',
        address: "710 E 4th Pl, Los Angeles, CA 90013",
        website: "https://www.theletsgodisco.com/",
        description:
            "The Let's Go! Disco is a 1970s-themed Italian disco in Downtown that's one of the most fun places to dance in LA",
        hours: "5-1 Mon-Sat ",
        vibe: "Dance",
        price: r"$",
        neighborhood: "Downtown",
        url:
            'https://res.cloudinary.com/the-infatuation/image/upload/c_fill,w_1200,ar_4:3,g_center,f_auto/Let_s_Go_Disco_whlect'),
    Location(
        name: 'El Cid',
        address: "336 S Hill St, Los Angeles, CA 90013",
        website: "https://www.elcidsunset.com/",
        description:
            "The cocktails are cheap, the crowd is cool, and the two-tiered patio (with old movies projecting on the wall) is the ideal casual hangout spot. There’s also a fantastic little theater attached with nightly events ranging from live music to flamenco lessons.",
        hours: "11pm -2am Mon-Sat ",
        vibe: "Dance",
        price: r"$$",
        neighborhood: "East Side",
        url:
            'https://res.cloudinary.com/the-infatuation/image/upload/c_fill,w_1200,ar_4:3,g_center,f_auto/cms/JakobLayman.ElCid_003'),
    Location(
        name: 'Boardners',
        address: "1652 N Cherokee Ave, Los Angeles, CA 90028",
        website: "https://boardners.com/",
        description:
            "he drinks are cheap, the food menu is surprisingly solid, and the crowd watching never disappoints. You know you’re in a true Old Hollywood bar when the guy who’s measuring his hands with a tape measure at the bar isn’t the weirdest thing you see that night.",
        hours: "5pm -2am Mon-Sat ",
        vibe: "Dance",
        price: r"$$$",
        neighborhood: "Hollywood",
        url:
            'https://res.cloudinary.com/the-infatuation/image/upload/c_fill,w_1200,ar_4:3,g_center,f_auto/Boardners_2_vskeps'),

    //------GAME--------

    Location(
        name: 'EightyTwo',
        address: "707 E 4th Pl, Los Angeles, CA 90013",
        website: "https://www.eightytwo.la/",
        description:
            "Part vintage arcade, part lounge venue, part nightlife destination and part communal retail and recreational space, EightyTwo was founded in 2014 and is open 6 days per week. EightyTwo features over 55 vintage pinball and arcade machines, a full bar with 10 draft beers and seasonal craft cocktails, 3000 sq feet of outdoor green patio space, and a listening bar with a full-time DJ program.",
        hours: "5pm -2am Mon-Sat ",
        vibe: "Game",
        price: r"$",
        neighborhood: "Downtown",
        url:
            'https://res.cloudinary.com/the-infatuation/image/upload/c_fill,w_1200,ar_4:3,g_center,f_auto/images/Eighty_Two_yeciid'),
    Location(
        name: 'Button Mash',
        address: "1391 Sunset Blvd, Los Angeles, CA 90026",
        website: "https://www.buttonmashla.com/",
        description:
            "Part vintage arcade, part lounge venue, part nightlife destination and part communal retail and recreational space, EightyTwo was founded in 2014 and is open 6 days per week. EightyTwo features over 55 vintage pinball and arcade machines, a full bar with 10 draft beers and seasonal craft cocktails, 3000 sq feet of outdoor green patio space, and a listening bar with a full-time DJ program.",
        hours: "5pm -2am Mon-Sat ",
        vibe: "Game",
        price: r"$$",
        neighborhood: "East Side",
        url:
            'https://res.cloudinary.com/the-infatuation/image/upload/c_fill,w_1200,ar_4:3,g_center,f_auto/images/Eighty_Two_yeciid'),
    Location(
        name: 'Busbys West',
        address: "3110 Santa Monica Blvd, Santa Monica, CA 90404",
        website: "https://www.busbyswest.com/menu/",
        description:
            "Clubby, multi-room sports bar with flat-screen TVs, ping pong, darts, simple pub grub & dancing.",
        hours: "5pm -2am Mon-Sat ",
        vibe: "Game",
        price: r"$$$",
        neighborhood: 'Hollywood',
        url:
            'https://res.cloudinary.com/the-infatuation/image/upload/c_fill,w_1200,ar_4:3,g_center,f_auto/images/Eighty_Two_yeciid'),

    //Live Music
    Location(
        name: 'Kibitz Room',
        address: "Kibitz Room 410 N Fairfax Ave, Los Angeles, CA 90036",
        website: "https://www.eightytwo.la/",
        description:
            "Part vintage arcade, part lounge venue, part nightlife destination and part communal retail and recreational space, EightyTwo was founded in 2014 and is open 6 days per week. EightyTwo features over 55 vintage pinball and arcade machines, a full bar with 10 draft beers and seasonal craft cocktails, 3000 sq feet of outdoor green patio space, and a listening bar with a full-time DJ program.",
        hours: "5pm -2am Mon-Sat ",
        vibe: "Live Music",
        price: r"$",
        neighborhood: "East Side",
        url:
            'https://res.cloudinary.com/the-infatuation/image/upload/c_fill,w_1200,ar_4:3,g_center,f_auto/Kibitz_pf7oeo'),
    Location(
        name: 'Tower Bar',
        address: "1391 Sunset Blvd, Los Angeles, CA 90026",
        website: "https://www.TowerBar.com/",
        description:
            "Part vintage arcade, part lounge venue, part nightlife destination and part communal retail and recreational space, EightyTwo was founded in 2014 and is open 6 days per week. EightyTwo features over 55 vintage pinball and arcade machines, a full bar with 10 draft beers and seasonal craft cocktails, 3000 sq feet of outdoor green patio space, and a listening bar with a full-time DJ program.",
        hours: "5pm -2am Mon-Sat ",
        vibe: "Live Music",
        price: r"$$",
        neighborhood: "Downtown",
        url:
            'https://res.cloudinary.com/the-infatuation/image/upload/c_fill,w_1200,ar_4:3,g_center,f_auto/cms/beta/Sunset_20Tower'),

    Location(
        name: 'Tramp Stamp Granny’s',
        address: "3110 Santa Monica Blvd, Santa Monica, CA 90404",
        website: "https://www.Trampstampgranny.com/menu/",
        description:
            "Clubby, multi-room sports bar with flat-screen TVs, ping pong, darts, simple pub grub & dancing.",
        hours: "5pm -2am Mon-Sat ",
        vibe: "Live Music",
        price: r"$$$",
        neighborhood: 'Hollywood',
        url:
            'https://res.cloudinary.com/the-infatuation/image/upload/c_fill,w_1200,ar_4:3,g_center,f_auto/cms/reviews/tramp-stamp-grannys/banners/1553280039.07'), //Kareoke

    //Kar
    Location(
        name: 'Cafe Brass Monkey',
        address: "707 E 4th Pl, Los Angeles, CA 90013",
        website: "https://www.eightytwo.la/",
        description:
            "Part vintage arcade, part lounge venue, part nightlife destination and part communal retail and recreational space, EightyTwo was founded in 2014 and is open 6 days per week. EightyTwo features over 55 vintage pinball and arcade machines, a full bar with 10 draft beers and seasonal craft cocktails, 3000 sq feet of outdoor green patio space, and a listening bar with a full-time DJ program.",
        hours: "5pm -2am Mon-Sat ",
        vibe: "Karaoke",
        price: r"$",
        neighborhood: "Downtown",
        url:
            'https://res.cloudinary.com/the-infatuation/image/upload/c_fill,w_1200,ar_4:3,g_center,f_auto/images/Eighty_Two_yeciid'),
    Location(
        name: 'Stowaway',
        address: "1391 Sunset Blvd, Los Angeles, CA 90026",
        website: "https://www.stoaway.com/",
        description:
            "Part vintage arcade, part lounge venue, part nightlife destination and part communal retail and recreational space, EightyTwo was founded in 2014 and is open 6 days per week. EightyTwo features over 55 vintage pinball and arcade machines, a full bar with 10 draft beers and seasonal craft cocktails, 3000 sq feet of outdoor green patio space, and a listening bar with a full-time DJ program.",
        hours: "5pm -2am Mon-Sat ",
        vibe: "Karaoke",
        price: r"$$",
        neighborhood: "East Side",
        url:
            'https://res.cloudinary.com/the-infatuation/image/upload/c_fill,w_1200,ar_4:3,g_center,f_auto/images/The_Stowaway_jw0bqs'),
    Location(
        name: 'Brass Monkey',
        address: "3110 Santa Monica Blvd, Santa Monica, CA 90404",
        website: "https://www.BrassMonkey.com/menu/",
        description:
            "Clubby, multi-room sports bar with flat-screen TVs, ping pong, darts, simple pub grub & dancing.",
        hours: "5pm -2am Mon-Sat ",
        vibe: "Karaoke",
        price: r"$$$",
        neighborhood: 'Hollywood',
        url:
            'https://res.cloudinary.com/the-infatuation/image/upload/c_fill,w_1200,ar_4:3,g_center,f_auto/images/Eighty_Two_yeciid'),
  ];

  static List<Location> getAllLocations() {
    return locationsList;
  }
}
