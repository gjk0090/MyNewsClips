<%-- 
    Document   : article_editor
    Created on : Dec 1, 2013, 6:16:52 AM
    Author     : gjk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Article editor</title>
        
        <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-combined.no-icons.min.css" rel="stylesheet">
        <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-responsive.min.css" rel="stylesheet">
        <link href="http://netdna.bootstrapcdn.com/font-awesome/3.0.2/css/font-awesome.css" rel="stylesheet">
        
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
        <script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/js/bootstrap.min.js"></script>
        
        <script src="js/hotkeys.js"></script>
        <script src="js/prettify.js"></script>
        <link href="css/prettify.css" rel="stylesheet">

        <link href="css/article_editor.css" rel="stylesheet">
        <script src="js/article_editor.js"></script>
    </head>
    
    <body>
            <% 
                String atitle = request.getParameter("atitle");
                String content = request.getParameter("content");
                Integer aid = Integer.parseInt(request.getParameter("aid"));
                String link = request.getParameter("link");     
                String afid = request.getParameter("afid");
            %>

            <div id="alerts"></div>

            <!--buttons-->
            <div class="btn-toolbar" data-role="editor-toolbar" data-target="#editor">
              <div class="btn-group">
                <a class="btn dropdown-toggle" data-toggle="dropdown" title="Font"><i class="icon-font"></i><b class="caret"></b></a>
                  <ul class="dropdown-menu">
                  </ul>
                </div>
              <div class="btn-group">
                <a class="btn dropdown-toggle" data-toggle="dropdown" title="Font Size"><i class="icon-text-height"></i>&nbsp;<b class="caret"></b></a>
                  <ul class="dropdown-menu">
                  <li><a data-edit="fontSize 5"><font size="5">Huge</font></a></li>
                  <li><a data-edit="fontSize 3"><font size="3">Normal</font></a></li>
                  <li><a data-edit="fontSize 1"><font size="1">Small</font></a></li>
                  </ul>
              </div>
              <div class="btn-group">
                <a class="btn" data-edit="bold" title="Bold (Ctrl/Cmd+B)"><i class="icon-bold"></i></a>
                <a class="btn" data-edit="italic" title="Italic (Ctrl/Cmd+I)"><i class="icon-italic"></i></a>
                <a class="btn" data-edit="strikethrough" title="Strikethrough"><i class="icon-strikethrough"></i></a>
                <a class="btn" data-edit="underline" title="Underline (Ctrl/Cmd+U)"><i class="icon-underline"></i></a>
              </div>
              <div class="btn-group">
                <a class="btn" data-edit="insertunorderedlist" title="Bullet list"><i class="icon-list-ul"></i></a>
                <a class="btn" data-edit="insertorderedlist" title="Number list"><i class="icon-list-ol"></i></a>
                <a class="btn" data-edit="outdent" title="Reduce indent (Shift+Tab)"><i class="icon-indent-left"></i></a>
                <a class="btn" data-edit="indent" title="Indent (Tab)"><i class="icon-indent-right"></i></a>
              </div>
              <div class="btn-group">
                <a class="btn" data-edit="justifyleft" title="Align Left (Ctrl/Cmd+L)"><i class="icon-align-left"></i></a>
                <a class="btn" data-edit="justifycenter" title="Center (Ctrl/Cmd+E)"><i class="icon-align-center"></i></a>
                <a class="btn" data-edit="justifyright" title="Align Right (Ctrl/Cmd+R)"><i class="icon-align-right"></i></a>
                <a class="btn" data-edit="justifyfull" title="Justify (Ctrl/Cmd+J)"><i class="icon-align-justify"></i></a>
              </div>
              <div class="btn-group">
                          <a class="btn dropdown-toggle" data-toggle="dropdown" title="Hyperlink"><i class="icon-link"></i></a>
                            <div class="dropdown-menu input-append">
                                    <input class="span2" placeholder="URL" type="text" data-edit="createLink"/>
                                    <button class="btn" type="button">Add</button>
                </div>
                <a class="btn" data-edit="unlink" title="Remove Hyperlink"><i class="icon-cut"></i></a>

              </div>

              <div class="btn-group">
                <a class="btn" title="Insert picture (or just drag & drop)" id="pictureBtn"><i class="icon-picture"></i></a>
                <input type="file" data-role="magic-overlay" data-target="#pictureBtn" data-edit="insertImage" />
              </div>
              <div class="btn-group">
                <a class="btn" data-edit="undo" title="Undo (Ctrl/Cmd+Z)"><i class="icon-undo"></i></a>
                <a class="btn" data-edit="redo" title="Redo (Ctrl/Cmd+Y)"><i class="icon-repeat"></i></a>
              </div>
              <input type="text" data-edit="inserttext" id="voiceBtn" x-webkit-speech="">
            </div>
            <!--buttons and-->
            
            <h2 id="article_title" style="width: 800px;"><%=atitle%></h2>

            <div id="editor" style="width: 800px;" onkeyup="updateSubmitcontent()">
              <%=content%>
            </div>            
            
            <div id="article_link" style="width: 800px;">link : <a href="<%=link%>"><%=link%></a></div>
            
            <form class="form-save" method="post" action="/My_News_Clips/ArticleServlet">

                <input type="hidden" name="aid" value="<%=aid%>"/>
                <input type="hidden" name="atitle" value="<%=atitle%>"/>
                <input type="hidden" name="content" value="<%=content%>" id="submitContent"/>
                <input type="hidden" name="link" value="<%=link%>"/>
                <input type="hidden" name="afid" value="<%=afid%>"/>
                <input type="hidden" name="uid" value="<%=(String) session.getAttribute("uid")%>"/>
                
		<button name="actiontype" value="save"
			class="btn btn-large btn-primary" type="submit"
			style="float: left; margin-left: 40px;">
			save
		</button>
		<button name="actiontype" value="cancel"
                        class="btn btn-large btn-default"
			style="margin-left: 15px">
			Cancel
		</button>

            </form>            

        <script>
          $(function(){
            function initToolbarBootstrapBindings() {
                var fonts = ['Serif', 'Sans', 'Arial', 'Arial Black', 'Courier', 
                      'Courier New', 'Comic Sans MS', 'Helvetica', 'Impact', 'Lucida Grande', 'Lucida Sans', 'Tahoma', 'Times',
                      'Times New Roman', 'Verdana'],
                      fontTarget = $('[title=Font]').siblings('.dropdown-menu');
                $.each(fonts, function (idx, fontName) {
                    fontTarget.append($('<li><a data-edit="fontName ' + fontName +'" style="font-family:\''+ fontName +'\'">'+fontName + '</a></li>'));
                });
                $('a[title]').tooltip({container:'body'});
                      $('.dropdown-menu input').click(function() {return false;})
                              .change(function () {$(this).parent('.dropdown-menu').siblings('.dropdown-toggle').dropdown('toggle');})
                  .keydown('esc', function () {this.value='';$(this).change();});

                $('[data-role=magic-overlay]').each(function () { 
                  var overlay = $(this), target = $(overlay.data('target')); 
                  overlay.css('opacity', 0).css('position', 'absolute').offset(target.offset()).width(target.outerWidth()).height(target.outerHeight());
                });
                if ("onwebkitspeechchange"  in document.createElement("input")) {
                  var editorOffset = $('#editor').offset();
                  $('#voiceBtn').css('position','absolute').offset({top: editorOffset.top, left: editorOffset.left+$('#editor').innerWidth()-35});
                } else {
                  $('#voiceBtn').hide();
                }
              };
                
            function showErrorAlert (reason, detail) {
                        var msg='';
                        if (reason==='unsupported-file-type') { msg = "Unsupported format " +detail; }
                        else {
                                console.log("error uploading file", reason, detail);
                        }
                        $('<div class="alert"> <button type="button" class="close" data-dismiss="alert">&times;</button>'+ 
                         '<strong>File upload error</strong> '+msg+' </div>').prependTo('#alerts');
              };
              
            initToolbarBootstrapBindings();  
            $('#editor').wysiwyg({ fileUploadError: showErrorAlert} );
            window.prettyPrint && prettyPrint();
          });
        </script>
        
        <script>
            
            function updateSubmitcontent(){
                var str= document.getElementById('editor').innerHTML;
                document.getElementById('submitContent').value=str;
            }

        </script>
        
    </body>


</html>
