Type.registerNamespace('Samples');

Samples.BookItem = function (element) {
    console.log(element);
   Samples.BookItem.initializeBase(this, [element]);
    this._bookId = null;      
    this._bookName = null;
    this._dragStartLocation = null;
    this._visual = null;
}
Samples.BookItem.prototype = {
    initialize : function() {
        Samples.BookItem.callBaseMethod(this, 'initialize');
        
        $addHandlers(this.get_element(),                          
            {mousedown:this._onMouseDown}, this);               
    },
    
    dispose : function() {
        $clearHandlers(this.get_element());
        Samples.BookItem.callBaseMethod(this, 'dispose');
    },
    
    _onMouseDown: function (evt) {   
        
        window._event = evt;                                      
        evt.preventDefault();
        this._visual = this.get_element().cloneNode(true);
        this._visual.style.opacity = '0.4';
        this._visual.style.filter = 'progid:DXImageTransform.Microsoft.BasicImage(opacity=0.4)';
        this._visual.style.zIndex = 99999;
        this.get_element().parentNode.appendChild(this._visual);
        var location = Sys.UI.DomElement.getLocation(this.get_element());
        Sys.UI.DomElement.setLocation(this._visual, location.x, location.y);
        Sys.Preview.UI.DragDropManager.startDragDrop(this, this._visual, null);
        
        //this.get_element().parentNode.appendChild(this._visual);
        
        //Sys.Preview.UI.DragDropManager.startDragDrop(this, this._visual, null);
        
        //Sys.Preview.UI.DragDropManager.startDragDrop(this,
        //    element, null);                                      
    }, 
    
    get_dragDataType : function() {                                  
        return '__bookItem';                                         
    },

    getDragData: function (context) {
        return this.get_bookId();
    },

    get_dragMode : function() {
        return Sys.Preview.UI.DragMode.Move;                         
    },

    onDragStart : function() {
        Sys.Debug.trace('Drag and Drop started');
        
        this._dragStartLocation =                                    
            Sys.UI.DomElement.getLocation(this.get_element());       
    },

    onDrag : function() {
    },

    onDragEnd : function(cancelled) {
        Sys.Debug.trace('Drag and Drop ended');
        
        if (cancelled) {
            //Sys.UI.DomElement.setLocation(element, this._dragStartLocation.x, 
            //    this._dragStartLocation.y);
            
        }
        else {
            //alert('Item dropped! ISBN code: ' + this.get_bookId() + 'NAME: ' + this.get_bookName());
        }
        this._visual.remove();
    },

    get_bookId : function() {                                        
        return this._bookId;                                      
    },                                                        
    set_bookId : function(value) {                                
        this._bookId = value;                                     
    },
    get_bookName: function () {
        return this._bookName;
    },
    set_bookName: function (value) {
        this._bookName = value;
    }
}
Samples.BookItem.registerClass('Samples.BookItem', Sys.UI.Control, Sys.Preview.UI.IDragSource);










//Custom.UI.ColorDragSourceBehavior = function (element, color) {
//    Custom.UI.ColorDragSourceBehavior.initializeBase(this, [element]);
//    this._mouseDownHandler = Function.createDelegate(this, this.mouseDownHandler);
//    this._color = color; this._visual = null;
//} Custom.UI.ColorDragSourceBehavior.prototype = { // IDragSource methods
//    get_dragDataType: function () { return 'DragDropColor'; },
//    getDragData: function (context) { return this._color; },
//    get_dragMode: function () { return Sys.Preview.UI.DragMode.Copy; },
//    onDragStart: function () { }, onDrag: function () { },
//    onDragEnd: function (canceled) { if (this._visual) this.get_element().parentNode.removeChild(this._visual); },
//    // Other methods
//    initialize: function () {
//        Custom.UI.ColorDragSourceBehavior.callBaseMethod(this, 'initialize');
//        $addHandler(this.get_element(), 'mousedown', this._mouseDownHandler)
//    }, mouseDownHandler: function (ev) {
//    window._event = ev; // Needed internally by _DragDropManager
//        this._visual = this.get_element().cloneNode(true);
//        this._visual.style.opacity = '0.4';
//        this._visual.style.filter = 'progid:DXImageTransform.Microsoft.BasicImage(opacity=0.4)';
//        this._visual.style.zIndex = 99999;
//        this.get_element().parentNode.appendChild(this._visual);
//        var location = Sys.UI.DomElement.getLocation(this.get_element());
//        Sys.UI.DomElement.setLocation(this._visual, location.x, location.y);
//        Sys.Preview.UI.DragDropManager.startDragDrop(this, this._visual, null);
//    }, dispose: function () { if (this._mouseDownHandler) $removeHandler(this.get_element(), 'mousedown', this._mouseDownHandler); this._mouseDownHandler = null; Custom.UI.ColorDragSourceBehavior.callBaseMethod(this, 'dispose'); }
//} Custom.UI.ColorDragSourceBehavior.registerClass('Custom.UI.ColorDragSourceBehavior', Sys.UI.Behavior, Sys.Preview.UI.IDragSource);