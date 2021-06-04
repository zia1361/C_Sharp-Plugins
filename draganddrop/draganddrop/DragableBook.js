Type.registerNamespace('Samples');
Samples.BookItem = function (element) {
    Samples.BookItem.initializeBase(this, [element]);
    this._bookId = null;
    this.dragStartLocation = null;
}
Samples.BookItem.prototype = {
    initialize: function () {
        Samples.BookItem.callBaseMethod(this, 'initialize');
        $addHandlers(this.get_element(),
            { mousedown: this._onMouseDown }, this);
    },
    dispose: function () {
        $clearHandlers(this.get_element());
        Samples.BookItem.callBaseMethod(this, 'dispose');
    },
    _onMouseDown: function (evt) {
        window._event = evt;
        evt.preventDefault();
        Sys.Preview.UI.DragDropManager.startDragDrop(this,
            this.get_element, null
        );
    },
    get_bookId: function () {
        return this._bookId;
    },
    set_bookId: function (value) {
        this._bookId = value;
    }
}
Samples.BookItem.registerClass('Samples.BookItem', Sys.UI.Control);

// Notify ScriptManager that this is the end of the script.
if (typeof (Sys) !== 'undefined') Sys.Application.notifyScriptLoaded();
