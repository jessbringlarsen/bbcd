(function() {
    var Dom = YAHOO.util.Dom,
        Event = YAHOO.util.Event;

    Event.onDOMReady(function() {
        var layout = new YAHOO.widget.Layout({
            units: [
                { position: 'top', 
                	height: 50, 
                	body: 'top1', 
                	header: 'Top', 
                	gutter: '5px', 
                	collapse: true, 
                	resize: true 
                },
                { position: 'right', 
                	header: 'Profil', 
                	width: 175, 
                	resize: false, 
                	gutter: '5px', 
                	collapse: false, 
                	scroll: true, 
                	body: 'right1', 
                	animate: false 
                },
                { position: 'bottom', 
                	header: 'Bottom', 
                	height: 100, 
                	resize: true, 
                	body: 'bottom1', 
                	gutter: '5px', 
                	collapse: true },
                { position: 'left', 
                	width: 175, 
                	header: 'Menu',
                	resize: false, 
                	body: 'left1', 
                	gutter: '5px', 
                	collapse: false, 
                	close: false, 
                	collapseSize: 50, 
                	scroll: true, 
                	animate: false },
                { position: 'center', 
                	body: 'center1' }
            ]
        });
        layout.on('render', function() {
            layout.getUnitByPosition('left').on('close', function() {
                closeLeft();
            });
        });
        layout.render();
        Event.on('tLeft', 'click', function(ev) {
            Event.stopEvent(ev);
            layout.getUnitByPosition('left').toggle();
        });
        Event.on('tRight', 'click', function(ev) {
            Event.stopEvent(ev);
            layout.getUnitByPosition('right').toggle();
        });
        Event.on('padRight', 'click', function(ev) {
            Event.stopEvent(ev);
            var pad = prompt('CSS gutter to apply: ("2px" or "2px 4px" or any combination of the 4 sides)', layout.getUnitByPosition('right').get('gutter'));
            layout.getUnitByPosition('right').set('gutter', pad);
        });
        var closeLeft = function() {
            var a = document.createElement('a');
            a.href = '#';
            a.innerHTML = 'Add Left Unit';
            Dom.get('closeLeft').parentNode.appendChild(a);

            Dom.setStyle('tLeft', 'display', 'none');
            Dom.setStyle('closeLeft', 'display', 'none');
            Event.on(a, 'click', function(ev) {
                Event.stopEvent(ev);
                Dom.setStyle('tLeft', 'display', 'inline');
                Dom.setStyle('closeLeft', 'display', 'inline');
                a.parentNode.removeChild(a);
                layout.addUnit(layout.get('units')[3]);
                layout.getUnitByPosition('left').on('close', function() {
                    closeLeft();
                });
            });
        };
        Event.on('closeLeft', 'click', function(ev) {
            Event.stopEvent(ev);
            layout.getUnitByPosition('left').close();
        });
    });
})();
