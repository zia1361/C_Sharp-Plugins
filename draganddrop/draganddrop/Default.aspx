<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="draganddrop.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous"/>
   <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="./ScriptLibrary/jquery-ui.css"/>
    <link rel="stylesheet" href="./css/style.css"/>
    <script src="./ScriptLibrary/jquery.js"></script>
  <script src="./ScriptLibrary/jquery-ui.js"></script>
     <script  src="./ScriptLibrary/require.js"></script>
    <script src="./ScriptLibrary/main.js"></script>
   
</head>
<body>

    <form id="form1" runat="server">
         <%--<asp:ScriptManager ID="TheScriptManager" runat="server">
        <Scripts>
            <asp:ScriptReference Assembly="Microsoft.Web.Preview" Name="PreviewScript.js"/>
            <asp:ScriptReference Assembly="Microsoft.Web.Preview" Name="PreviewDragDrop.js"/>
            <asp:ScriptReference Path="~/ScriptLibrary/BookItem.js" />
            <asp:ScriptReference Path="~/ScriptLibrary/CartZone.js" />
            <asp:ScriptReference Path="~/ScriptLibrary/main.js" />
        </Scripts>
    </asp:ScriptManager>--%>
        <nav class="navbar navbar-inverse navbar-fixed-top formbuilder-navbar" role="navigation" style="display: block;"><div class="container-fluid" style="display: block;">
    <div class="navbar-header">
        <!--<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"-->
        <!--aria-expanded="false" aria-controls="navbar">-->
        <!--<span class="sr-only">Toggle navigation</span>-->
        <!--<span class="icon-bar"></span>-->
        <!--<span class="icon-bar"></span>-->
        <!--<span class="icon-bar"></span>-->
        <!--</button>-->

        <p class="navbar-brand navbar-text navbar-project-name">
            <img src="https://five.epicollect.net/api/internal/media/sdsad?type=photo&amp;name=logo.jpg&amp;format=project_mobile_logo" width="40" height="40">
            <span class="">sdsad</span>
        </p>
    </div>
    <div id="navbar" class="navbar-collapse">
        <ul class="nav navbar-nav navbar-left">
            <li class="navbar-back-button"><a href="#"> <i class="fa fa-chevron-left"></i>&nbsp;Back</a></li>
            <!--<li class="navbar-text">Project_name</li>-->
            <!--<li class="active" data-form-index="0"><a href="#">{Form name}</a></li>-->
            <!--<li class="standard-mode-control navbar-control navbar__add-form-btn" data-add-form="1"><a href="#">Add Form <i class="fa fa-plus"></i></a></li>-->
        </ul>

        <ul class="nav navbar-nav navbar-right">
            <!--<li class="navbar-text">-->
            <!--<i class="fa fa-user fa-fw"></i> Hi, Mirko-->
            <!--</li>-->
            <!--<li class="navbar__save-project-btn navbar-control">-->
            <!--<button type="button" class="btn btn-primary navbar-btn" disabled>-->
            <!--<i class="project-state fa fa-warning fa-fw"></i>Save project</button>-->
            <!--</li>-->
            <li class="navbar-control navbar-back-button navbar-exit-button">
                <a href="#"><i class="fa fa-power-off fa-fw"></i>Exit</a>
            </li>
        </ul>
    </div>
</div>
</nav>
        <div class="row">
            <section class="inputs-tools col-sm-3 col-md-2"><!-- inputs tools list loaded here dinamically-->
<div class="panel panel-default">
    <div class="panel-body">
        <ul id="inputs-tools-list" class="nav nav-sidebar connectedSortable">
            <li>
                <div class="input ui-draggable ui-draggable-handle" data-type="text">
                    <div class="input-inner">
                        <i class="fa fa-text-width fa-2x fa-fw"></i>
                        <span class="question-preview">Text</span>
                    </div>
                </div>
            </li>
            <li>
                <div class="input ui-draggable ui-draggable-handle" data-type="integer">
                    <div class="input-inner">
                        <i class="fa fa-hashtag fa-2x fa-fw"></i>
                        <span class="question-preview">Numeric</span>
                    </div>
                </div>
            </li>
            <li class="">
                <div class="input ui-draggable ui-draggable-handle" data-type="phone">
                    <div class="input-inner">
                        <i class="fa fa-phone fa-2x fa-fw"></i>
                        <span class="question-preview">Phone</span>
                    </div>
                </div>
            </li>
            <li>
                <div class="input ui-draggable ui-draggable-handle" data-type="date">
                    <div class="input-inner">
                        <i class="fa fa-calendar fa-2x fa-fw"></i>
                        <span class="question-preview">Date</span>
                    </div>
                </div>
            </li>
            <li>
                <div class="input ui-draggable ui-draggable-handle" data-type="time">
                    <div class="input-inner">
                        <i class="fa fa-clock-o fa-2x fa-fw"></i>
                        <span class="question-preview">Time</span>
                    </div>
                </div>
            </li>
            <li>
                <div class="input ui-draggable ui-draggable-handle" data-type="dropdown">
                    <div class="input-inner">
                        <i class="fa fa-caret-square-o-down fa-2x fa-fw"></i>
                        <span class="question-preview">Dropdown</span>
                    </div>
                </div>
            </li>
            <li>
                <div class="input ui-draggable ui-draggable-handle" data-type="radio">
                    <div class="input-inner">
                        <i class="fa fa-dot-circle-o fa-2x fa-fw"></i>
                        <span class="question-preview">Radio</span>
                    </div>
                </div>
            </li>
            <li>
                <div class="input ui-draggable ui-draggable-handle" data-type="checkbox">
                    <div class="input-inner">
                        <i class="fa fa-check-square-o fa-2x fa-fw"></i>
                        <span class="question-preview">Checkbox</span>
                    </div>
                </div>
            </li>
            <li>
                <div class="input input-search ui-draggable ui-draggable-handle" data-type="searchsingle">
                    <div class="input-inner">
                        <i class="fa fa-search fa-2x fa-fw"></i>
                        <span class="question-preview">Search</span>
                    </div>
                </div>
            </li>
            <li>
                <div class="input ui-draggable ui-draggable-handle" data-type="textarea">
                    <div class="input-inner">
                        <i class="fa fa-sticky-note-o fa-2x fa-fw"></i>
                        <span class="question-preview">Text Box</span>
                    </div>
                </div>
            </li>
            <li>
                <div class="input ui-draggable ui-draggable-handle" data-type="readme">
                    <div class="input-inner">
                        <i class="fa fa-file-text-o fa-2x fa-fw"></i>
                        <span class="question-preview">Readme</span>
                    </div>
                </div>
            </li>
            <li>
                <div class="input ui-draggable ui-draggable-handle" data-type="location">
                    <div class="input-inner">
                        <i class="fa fa-map-marker fa-2x fa-fw">

                        </i>
                        <span class="question-preview">Location</span>
                    </div>
                </div>
            </li>
            <li>
                <div class="input ui-draggable ui-draggable-handle" data-type="photo">
                    <div class="input-inner">
                        <i class="fa fa-camera-retro fa-2x fa-fw"></i>
                    <span class="question-preview">Photo</span>
                    </div>
                </div>
            </li>
            <li>
                <div class="input ui-draggable ui-draggable-handle" data-type="audio">
                    <div class="input-inner">
                        <i class="fa fa-microphone fa-2x fa-fw"></i>
                        <span class="question-preview">Audio</span>
                    </div>
                </div>
            </li>
            <li>
                <div class="input ui-draggable ui-draggable-handle" data-type="video">
                    <div class="input-inner">
                        <i class="fa fa-video-camera fa-2x fa-fw"></i>
                        <span class="question-preview">Video</span>
                    </div>
                </div>
            </li>
            <li>
                <div class="input ui-draggable ui-draggable-handle" data-type="barcode">
                    <div class="input-inner">
                        <i class="fa fa-barcode fa-2x fa-fw"></i>
                        <span class="question-preview">Barcode</span>
                    </div>
                </div>
            </li>
            <li>
                <div class="input input-branch ui-draggable ui-draggable-handle" data-type="branch">
                    <div class="input-inner">
                        <i class="fa fa-clone fa-2x fa-fw"></i>
                        <span class="question-preview">Branch</span>
                    </div>
                </div>
            </li>
            <li>
                <div class="input input-group ui-draggable ui-draggable-handle" data-type="group">
                    <div class="input-inner">
                        <i class="fa fa-align-justify fa-2x fa-fw"></i>
                        <span class="question-preview">Group</span>
                    </div>
                </div>
            </li>
        </ul>
    </div>
</div>
</section>
            <section class="main col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2">
                <div class="inputs-collection col-md-6">
                <div class="panel panel-default">
                    <div class="panel-body sortable ui-sortable">
                   <%-- <ul id="cartZone" class="sortable" style="height:300px; width:200px; background-color:azure;">
               
        </ul>--%>
                </div>
                </div>
                
            </div>
                <div class="inputs-collection col-md-6">
                <div class="panel panel-default">
                    <div class="panel-body input_properties__forms_wrapper">
                   <%-- <ul id="cartZone" class="sortable" style="height:300px; width:200px; background-color:azure;">
               
        </ul>--%>
                </div>
                </div>
                
            </div>
            </section>
            
        </div>
        
        
               
        
        
        
    <%--<script type="text/javascript">
        var abc = new Array();
        $(".sortable").sortable({
            axis: "y",
            placeholder: "ui-state-error",
            revert: true,
            cursor: 'move',
            revertDuration: 0,
            receive: function (event, ui) { // add this handler
                console.log("receive" + $(ui.helper).index());
                var itemOrder = $('.sortable').sortable("toArray");
                console.log(itemOrder);
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
                console.log('update');
                console.log(ui.item.index());
            },

            beforeStop: function (event, ui){
                
                if (ui.item.data('type') != undefined){
                    var element = document.createElement('li');
                    element.innerHTML = ui.item.data('type');
                    element.setAttribute('class', 'ui-state-default');
                    element.setAttribute('id', '3');
                    ui.helper.replaceWith(element);
                    var child = document.createElement('button');
                    child.innerText = "CANCEL";
                    child.onclick = function (event){
                        event.preventDefault;
                        element.remove();
                        child.remove();
                        //abc.map((element) => element != ui.item.data('type'));
                    };
                    element.appendChild(child);
                    
                    abc.push({ 'element': ui.item.data('type') + ui.item.index() });
                }
                console.log("beforeStop: ");
                abc.map((element)=>{
                    console.log(element);
                });
                
            },
            stop: function (event, ui) {
                index = $(ui.item).index();

                console.log('stop' + ui.helper.index());
            },
            start: function (event, ui) {
                console.log('start');
                var sourceIndex = $(ui.item).parent().children().index(ui.item);
                console.log(sourceIndex);
            },
            change: function (event, ui) {
                console.log('change');
                console.log(ui.item.index());
            }

        });

        $(".sortable").disableSelection();

        $(".draggable").draggable({
            connectToSortable: ".sortable",
            helper: 'clone',
            stop: function (event, ui){
                //ui.helper.remove();
            },
            create: function (event, ui) {
               
            }
        });

        //Sys.Application.add_init(pageInit);

        //function pageInit(){
        //    $create(Samples.BookItem, { bookId: '1-933988-14-2', bookName: 'some name' }, null, null, $get('imgBook'));
        //    //$create(Samples.BookItem, { bookId: '1-933988-14-1', bookName: 'some other book' }, null, null, $get('send'));
        //    $create(Samples.CartZone, null, null, null, $get('cartZone'));
        //}
    
    </script>--%>
    </form>
</body>
</html>
