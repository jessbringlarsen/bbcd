/*
     Initialize and render the MenuBar when its elements are ready 
     to be scripted.
*/

YAHOO.util.Event.onContentReady("bbcdmenuitems", function () {

    /*
         Instantiate a MenuBar:  The first argument passed to the 
         constructor is the id of the element in the page 
         representing the MenuBar; the second is an object literal 
         of configuration properties.
    */

    var oMenuBar = new YAHOO.widget.MenuBar("bbcdmenuitems", { 
                                                autosubmenudisplay: true, 
                                                hidedelay: 750, 
                                                lazyload: true });

    /*
         Define an array of object literals, each containing 
         the data necessary to create a submenu.
    */

    var aSubmenuData = [
    
        {
            id: "shopping", 
            itemdata: [
                { text: "Auctions", url: "http://auctions.shopping.yahoo.com" },
                { text: "Autos", url: "http://autos.yahoo.com" },
                { text: "Classifieds", url: "http://classifieds.yahoo.com" },
                { text: "Flowers & Gifts", url: "http://shopping.yahoo.com/b:Flowers%20%26%20Gifts:20146735" },
                { text: "Real Estate", url: "http://realestate.yahoo.com" },
                { text: "Travel", url: "http://travel.yahoo.com" },
                { text: "Wallet", url: "http://wallet.yahoo.com" },
                { text: "Yellow Pages", url: "http://yp.yahoo.com" }                    
            ]    
        },
        
        {
            id: "entertainment", 
            itemdata: [
                { text: "Fantasy Sports", url: "http://fantasysports.yahoo.com" },
                { text: "Games", url: "http://games.yahoo.com" },
                { text: "Kids", url: "http://www.yahooligans.com" },
                { text: "Music", url: "http://music.yahoo.com" },
                { text: "Movies", url: "http://movies.yahoo.com" },
                { text: "Radio", url: "http://music.yahoo.com/launchcast" },
                { text: "Travel", url: "http://travel.yahoo.com" },
                { text: "TV", url: "http://tv.yahoo.com" }              
            ] 
        },
        
        {
            id: "information",
            itemdata: [
                { text: "Downloads", url: "http://downloads.yahoo.com" },
                { text: "Finance", url: "http://finance.yahoo.com" },
                { text: "Health", url: "http://health.yahoo.com" },
                { text: "Local", url: "http://local.yahoo.com" },
                { text: "Maps & Directions", url: "http://maps.yahoo.com" },
                { text: "My Yahoo!", url: "http://my.yahoo.com" },
                { text: "News", url: "http://news.yahoo.com" },
                { text: "Search", url: "http://search.yahoo.com" },
                { text: "Small Business", url: "http://smallbusiness.yahoo.com" },
                { text: "Weather", url: "http://weather.yahoo.com" }
            ]
        }                    
    ];


    /*
         Subscribe to the "beforerender" event, adding a submenu 
         to each of the items in the MenuBar instance.
    */

    oMenuBar.subscribe("beforeRender", function () {

        if (this.getRoot() == this) {

            // this.getItem(0) - resereveret til 'Forside'
            this.getItem(1).cfg.setProperty("submenu", aSubmenuData[0]);
            this.getItem(2).cfg.setProperty("submenu", aSubmenuData[1]);
            this.getItem(3).cfg.setProperty("submenu", aSubmenuData[2]);

        }

    });


    /*
         Call the "render" method with no arguments since the 
         markup for this MenuBar instance is already exists in 
         the page.
    */

    oMenuBar.render();         

});