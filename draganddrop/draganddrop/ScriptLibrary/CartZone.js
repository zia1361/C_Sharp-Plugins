Type.registerNamespace('Samples');

Samples.CartZone = function(element) {
    Samples.CartZone.initializeBase(this, [element]);
}
Samples.CartZone.prototype = {
    initialize : function() {
        Samples.CartZone.callBaseMethod(this, 'initialize');
        Sys.Preview.UI.DragDropManager.registerDropTarget(this);
    },
    
    dispose : function() {
        Sys.Preview.UI.DragDropManager.unregisterDropTarget(this);
        Samples.CartZone.callBaseMethod(this, 'dispose');
    },
    
    get_dropTargetElement : function() {
        return this.get_element();
    },

    canDrop : function(dragMode, dataType, dragData) {
        return dataType == '__bookItem';
    },

    drop: function (dragMode, dataType, dragData) {
        //console.log("droped: " + dragData);
        //var element = document.createElement('li');
        //element.innerHTML = dragData;
        //element.setAttribute('class', 'ui-state-default');
        //document.getElementById('cartZone').appendChild(element);
        //var child = document.createElement('button');
        //child.innerText = "CANCEL";
        //child.onclick = function (event) {
        //    event.preventDefault;
        //    element.remove();
        //    child.remove();
        //};
        //element.appendChild(child);
        this.get_element().style.backgroundColor = 'azure';
    },

    onDragEnterTarget : function(dragMode, dataType, dragData) {
        this.get_element().style.backgroundColor = '#808080';
    },

    onDragInTarget: function (dragMode, dataType, dragData) {
        console.log('drag in');
    },

    onDragLeaveTarget : function(dragMode, dataType, dragData) {
        this.get_element().style.backgroundColor = '#FFFFFF';
    }
}
Samples.CartZone.registerClass('Samples.CartZone', Sys.UI.Behavior, Sys.Preview.UI.IDropTarget);
