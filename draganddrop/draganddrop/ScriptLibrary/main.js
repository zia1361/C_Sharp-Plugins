//var script = document.createElement("SCRIPT");
//script.src = './ScriptLibrary/jquery.js';
//script.type = 'text/javascript';
//document.getElementsByTagName("head")[0].appendChild(script);
//var script2 = document.createElement("SCRIPT");
//script.src = './ScriptLibrary/jquery-ui.js';
//script.type = 'text/javascript';
//document.getElementsByTagName("head")[0].appendChild(script);

$(document).ready(function () {
    var moduleName = './ScriptLibrary/factory';
    require([moduleName], function (fooModule) {
        var abc = new Array();
        var mod = fooModule;
        
        $(".sortable").sortable({
            axis: "y",
            placeholder: "ui-state-highlight",
            classes: {
                'ui-sortable-helper': 'highlight'
            },
            revert: false,
            delay: 100,
            receive: function (event, ui) { // add this handler
                console.log("receive" + $(ui.helper).index());
                //var newIndex = $(this).data("type").currentItem.index();

                //var element = document.createElement('li');
                //element.innerHTML = ui.item.data('type');
                //element.setAttribute('class', 'ui-state-default');
                //this.appendChild(element);
                //var child = document.createElement('button');
                //child.innerText = "CANCEL";
                //child.onclick = function (event){
                //    event.preventDefault;
                //    element.remove();
                //    child.remove();
                //};
                //element.appendChild(child);
                //console.log(ui.item.helper.replaceWith(element)); // remove original item

            },

            update: function (event, ui) {
                //console.log('update');
                //console.log(ui.item.index());
            },

            beforeStop: function (event, ui) {
                var icon = document.createElement('i');
                icon.setAttribute('class', 'question-state fa fa-check fa-2x fa-fw pull-right');
                icon.style.color = 'green';
                if (ui.item.data('type') != undefined) {
                    var key = generateRef();
                    var obj = {
                        key: key,
                        type: ui.item.data('type'),
                        data: { question: 'what is this?' },
                        isTitle: false,
                        isRequired: true,
                        max: null,
                        min: null,
                        datetime_format: null,
                        set_to_current_datetime: false,
                        possible_answers: [],
                        jumps: [],
                        branch: [],
                        group: []
                    };
                    updateName('abcde');
                    addComponent(obj);
                    console.log(formData);
                    var element = document.createElement('li');
                    element.setAttribute('class', 'input ui-draggable ui-draggable-handle');
                    element.setAttribute('id', key);
                    element.style = "";
                    ui.helper.replaceWith(element);
                    var div = document.createElement('div');
                    div.setAttribute('class', 'input-inner');
                    element.appendChild(div);
                    div.innerHTML += ui.item.html();
                    div.children[0].appendChild(icon);
                    var form = document.createElement('form');
                    form.setAttribute('data-ref', key);
                    var btn = document.createElement('button');
                    btn.setAttribute('class', 'btn btn-danger');
                    btn.onclick = function (event) {
                        
                        event.preventDefault();
                        
                        var isPermitted = confirm('are u sure u want to delete?');
                            if(isPermitted){
                                element.remove();
                                deleteComponent(key);
                                //btn.remove();
                                form.remove();
                                
                            }
                        
                    };
                    var txtBox = document.createElement('input');
                    
                    form.appendChild(btn);
                    form.appendChild(txtBox);
                    txtBox.addEventListener('input', function (evt) {
                        evt.preventDefault();
                        var e = document.getElementById(key).children;
                        e[0].children[0].children[1].innerText = txtBox.value;
                    });
                    document.getElementsByClassName('input_properties__forms_wrapper')[0].appendChild(form);
                }
                //console.log("beforeStop: ");
                //abc.map((element) => {
                //    console.log(element);
                //});

            },
            stop: function (event, ui) {
                index = $(ui.item).index();

                //console.log('stop' + ui.helper.index());
            },
            start: function (event, ui) {
                //console.log('start');
                //var sourceIndex = $(ui.item).parent().children().index(ui.item);
                //console.log(sourceIndex);
            },
            change: function (event, ui) {
                //console.log('change');
                //console.log(ui.item.index());
            }

        });

        $(".sortable").disableSelection();

        $(".ui-draggable-handle").draggable({
            connectToSortable: ".sortable",
            helper: 'clone',
            stop: function (event, ui) {
                
            },
            create: function (event, ui) {
                
            }
        });
    });
    
})