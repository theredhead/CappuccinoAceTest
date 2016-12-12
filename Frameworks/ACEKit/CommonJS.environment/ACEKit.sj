@STATIC;1.0;p;15;ACEEditorView.jt;16913;@STATIC;1.0;I;18;AppKit/CPWebView.jt;16870;objj_executeFile("AppKit/CPWebView.j", NO);{var the_class = objj_allocateClassPair(CPWebView, "ACEEditorView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("editor", "id"), new objj_ivar("actualWindow", "id"), new objj_ivar("actualDocument", "id"), new objj_ivar("themeName", "CPString"), new objj_ivar("modeName", "CPString"), new objj_ivar("contentText", "CPString")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("editor"), function(self, _cmd)
{
    return self.editor;
}
,["id"]), new objj_method(sel_getUid("setEditor:"), function(self, _cmd, newValue)
{
    self.editor = newValue;
}
,["void","id"]), new objj_method(sel_getUid("themeName"), function(self, _cmd)
{
    return self.themeName;
}
,["CPString"]), new objj_method(sel_getUid("setThemeName:"), function(self, _cmd, newValue)
{
    self.themeName = newValue;
}
,["void","CPString"]), new objj_method(sel_getUid("modeName"), function(self, _cmd)
{
    return self.modeName;
}
,["CPString"]), new objj_method(sel_getUid("setModeName:"), function(self, _cmd, newValue)
{
    self.modeName = newValue;
}
,["void","CPString"]), new objj_method(sel_getUid("contentText"), function(self, _cmd)
{
    return self.contentText;
}
,["CPString"]), new objj_method(sel_getUid("setContentText:"), function(self, _cmd, newValue)
{
    self.contentText = newValue;
}
,["void","CPString"]), new objj_method(sel_getUid("editorNamespace"), function(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "objectByEvaluatingJavaScriptFromString:", "ACENamespace()");
}
,["id"]), new objj_method(sel_getUid("editorSession"), function(self, _cmd)
{
    return self.isa.objj_msgSend0(self, "editor") && self.isa.objj_msgSend0(self, "editor").getSession() || nil;
}
,["id"]), new objj_method(sel_getUid("initWithFrame:"), function(self, _cmd, aFrame)
{
    self = objj_msgSendSuper1({ receiver:self, super_class:objj_getClass("ACEEditorView").super_class }, "initWithFrame:", aFrame);
    if (!self)
        return nil;
    (self == null ? null : self.isa.objj_msgSend0(self, "akInitialize"));
    return self;
}
,["id","CGRect"]), new objj_method(sel_getUid("initWithCoder:"), function(self, _cmd, aCoder)
{
    self = objj_msgSendSuper1({ receiver:self, super_class:objj_getClass("ACEEditorView").super_class }, "initWithCoder:", aCoder);
    if (!self)
        return nil;
    (self == null ? null : self.isa.objj_msgSend0(self, "akInitialize"));
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("akInitialize"), function(self, _cmd)
{
    self.isa.objj_msgSend1(self, "setDrawsBackground:", NO);
    self.isa.objj_msgSend1(self, "setBackgroundColor:", CPColor.isa.objj_msgSend0(CPColor, "whiteColor"));
    self.isa.objj_msgSend1(self, "setScrollMode:", CPWebViewScrollNative);
    self.isa.objj_msgSend1(self, "setFrameLoadDelegate:", self);
    self.isa.objj_msgSend1(self, "setMainFrameURL:", ((___r1 = CPBundle.isa.objj_msgSend1(CPBundle, "bundleForClass:", self.isa.objj_msgSend0(self, "class"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "pathForResource:", "ace.html")));
    self.isa.objj_msgSend1(self, "setThemeName:", "theme-dawn");
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("webView:didFinishLoadForFrame:"), function(self, _cmd, aWebView, aFrame)
{
    self.isa.objj_msgSend1(self, "setEditor:", self.isa.objj_msgSend1(self, "objectByEvaluatingJavaScriptFromString:", "ACCEditorViewInitialize()"));
    self.isa.objj_msgSend1(self, "setThemeName:", self.isa.objj_msgSend0(self, "themeName"));
    self.isa.objj_msgSend1(self, "setContentText:", self.isa.objj_msgSend0(self, "contentText"));
}
,["void","CPWebView","id"]), new objj_method(sel_getUid("acceptsFirstResponder"), function(self, _cmd)
{
    return !!self.isa.objj_msgSend0(self, "editor");
}
,["BOOL"]), new objj_method(sel_getUid("becomeFirstResponder"), function(self, _cmd)
{
    var answer = objj_msgSendSuper0({ receiver:self, super_class:objj_getClass("ACEEditorView").super_class }, "becomeFirstResponder");
    return answer;
}
,["BOOL"]), new objj_method(sel_getUid("resignFirstResponder"), function(self, _cmd)
{
    var answer = objj_msgSendSuper0({ receiver:self, super_class:objj_getClass("ACEEditorView").super_class }, "resignFirstResponder");
    if (answer)
    {
        self.actualWindow.blur();
        window.focus();
    }
    return answer;
}
,["BOOL"]), new objj_method(sel_getUid("setEditor:"), function(self, _cmd, newEditor)
{
    if (self.editor === newEditor)
        return;
    if (!self.isa.objj_msgSend0(self, "DOMWindow"))
        return;
    self.editor = newEditor;
    self._iframe.allowTransparency = true;
    self.actualWindow = self.isa.objj_msgSend0(self, "DOMWindow");
    self.actualDocument = self.actualWindow.document;
    var bind = function(target, eventName, eventHandler)
    {
        actualHandler = function(event)
        {
            if (eventHandler)
                eventHandler(event || window.event);
        };
        if (target.addEventListener)
        {
            target.addEventListener(eventName, actualHandler, true);
        }
        else if (target.attachEvent)
        {
            target.attachEvent(eventName, actualHandler);
        }
    };
    bind(self.actualDocument, "blur", function(event)
    {
        self.actualWindow.blur();
        window.focus();
        self.isa.objj_msgSend0(self, "resignFirstResponder");
    });
    bind(self.actualWindow, "blur", function(event)
    {
        window.focus();
    });
    bind(self.actualDocument, "focus", function(event)
    {
        if (!((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isKeyWindow")))
            ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "makeKeyAndOrderFront:", self));
        self.actualWindow.focus();
        self.isa.objj_msgSend0(self, "becomeFirstResponder");
        var ___r1;
    });
    bind(self.actualWindow, "focus", function(event)
    {
        if (!((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isKeyWindow")))
            ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "makeKeyAndOrderFront:", self));
        self.isa.objj_msgSend0(self, "becomeFirstResponder");
        self.actualWindow.focus();
        var ___r1;
    });
    bind(self.actualDocument, "mousedown", function(event)
    {
        self.actualWindow.focus();
    });
}
,["void","id"]), new objj_method(sel_getUid("contentText"), function(self, _cmd)
{
    if (!self.isa.objj_msgSend0(self, "editor"))
        return self.contentText;
    var retrievedValue = (self.isa.objj_msgSend0(self, "editor").getSession()).getValue();
    self.isa.objj_msgSend1(self, "setContentText:", retrievedValue);
    return self.contentText;
}
,["CPString"]), new objj_method(sel_getUid("setContentText:"), function(self, _cmd, newContentText)
{
    var propagateKVO = !((___r1 = self.contentText), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isEqual:", newContentText));
    if (propagateKVO)
        self.isa.objj_msgSend1(self, "willChangeValueForKey:", "themeName");
    self.contentText = newContentText;
    if (propagateKVO)
        self.isa.objj_msgSend1(self, "didChangeValueForKey:", "themeName");
    if (!self.isa.objj_msgSend0(self, "editorSession"))
        return;
    self.isa.objj_msgSend0(self, "editorSession").setValue(self.contentText);
    var ___r1;
}
,["void","CPString"])]);
}var kACEEditorViewThemeTitle = "kACEEditorViewThemeTitle";
var kACEEditorViewThemeFileLocation = "kACEEditorViewThemeFileLocation";
var kACEEditorViewThemeInternalName = "kACEEditorViewThemeInternalName";
var kACEEditorViewThemeFileLocationPrefix = "ace/build/src/";
var kACEEditorViewResource = function(aName)
{
    return ((___r1 = CPBundle.isa.objj_msgSend1(CPBundle, "bundleForClass:", ACEEditorView.isa.objj_msgSend0(ACEEditorView, "class"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "pathForResource:", aName));
    var ___r1;
};
var kACEEditorViewThemeResource = function(aName)
{
    return ((___r1 = CPBundle.isa.objj_msgSend1(CPBundle, "bundleForClass:", ACEEditorView.isa.objj_msgSend0(ACEEditorView, "class"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "pathForResource:", kACEEditorViewThemeFileLocationPrefix + "/" + aName + ".js"));
    var ___r1;
};
{
var the_class = objj_getClass("ACEEditorView")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"ACEEditorView\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("setThemeName:"), function(self, _cmd, newName)
{
    var propagateKVO = !((___r1 = self.themeName), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isEqual:", newName));
    if (propagateKVO)
        self.isa.objj_msgSend1(self, "willChangeValueForKey:", "themeName");
    self.themeName = newName;
    if (propagateKVO)
        self.isa.objj_msgSend1(self, "didChangeValueForKey:", "themeName");
    if (!self.isa.objj_msgSend0(self, "editorNamespace"))
        return;
    var themeData = ((___r1 = ((___r2 = self.isa.objj_msgSend0(self, "class")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "defaultThemes"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", self.themeName));
    if (!themeData)
    {
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInternalInconsistencyException, CPString.isa.objj_msgSend2(CPString, "stringWithFormat:", "Can’t find data for theme named %@.", self.themeName));
    }
    var internalThemeName = (themeData == null ? null : themeData.isa.objj_msgSend1(themeData, "objectForKey:", kACEEditorViewThemeInternalName));
    var themeLocation = (themeData == null ? null : themeData.isa.objj_msgSend1(themeData, "objectForKey:", kACEEditorViewThemeFileLocation));
    ACELoadScript(themeLocation, function()
    {
        if (self.isa.objj_msgSend0(self, "editor") && self.isa.objj_msgSend0(self, "editor").setTheme)
        {
            self.isa.objj_msgSend0(self, "editor").setTheme(internalThemeName);
        }
        else
        {
            CPLog("Warning: did not set the theme successfully");
        }
    }, self.isa.objj_msgSend0(self, "DOMWindow").document);
    var ___r1, ___r2;
}
,["void","CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultThemes"), function(self, _cmd)
{
    var transformedObject = {};
    var enqueue = function(shortName, name, internalName)
    {
        transformedObject[shortName] = {kACEEditorViewThemeTitle: name, kACEEditorViewThemeFileLocation: kACEEditorViewThemeResource(shortName), kACEEditorViewThemeInternalName: internalName};
    };
    enqueue("theme-clouds", "Clouds", "ace/theme/clouds");
    enqueue("theme-clouds_midnight", "Clouds (Midnight)", "ace/theme/clouds_midnight");
    enqueue("theme-cobalt", "Cobalt", "ace/theme/cobalt");
    enqueue("theme-dawn", "Dawn", "ace/theme/dawn");
    enqueue("theme-eclipse", "Eclipse", "ace/theme/eclipse");
    enqueue("theme-idle_fingers", "Idle Fingers", "ace/theme/idle_fingers");
    enqueue("theme-kr_theme", "KR Theme", "ace/theme/kr_theme");
    enqueue("theme-merbivore", "Merbivore", "ace/theme/merbivore");
    enqueue("theme-merbivore_soft", "Merbivore (Soft)", "ace/theme/merbivore_soft");
    enqueue("theme-mono_industrial", "Mono (Industrial)", "ace/theme/mono_industrial");
    enqueue("theme-pastel_on_dark", "Pastel On Dark", "ace/theme/pastel_on_dark");
    enqueue("theme-twilight", "Twilight", "ace/theme/twilight");
    enqueue("theme-vibrant_ink", "Vibrant Ink", "ace/theme/vibrant_ink");
    return CPDictionary.isa.objj_msgSend2(CPDictionary, "dictionaryWithJSObject:recursively:", transformedObject, YES);
}
,["CPDictionary"])]);
}var kACEEditorViewModeTitle = "kACEEditorViewModeTitle";
var kACEEditorViewModeFileLocation = "kACEEditorViewModeFileLocation";
var kACEEditorViewModeInternalName = "kACEEditorViewModeInternalName";
var kACEEditorViewModeFileLocationPrefix = "ace/build/src/";
var kACEEditorViewModeResource = function(aName)
{
    return ((___r1 = CPBundle.isa.objj_msgSend1(CPBundle, "bundleForClass:", ACEEditorView.isa.objj_msgSend0(ACEEditorView, "class"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "pathForResource:", kACEEditorViewThemeFileLocationPrefix + "/" + aName + ".js"));
    var ___r1;
};
{
var the_class = objj_getClass("ACEEditorView")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"ACEEditorView\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("setModeName:"), function(self, _cmd, newName)
{
    var propagateKVO = !((___r1 = self.themeName), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isEqual:", newName));
    if (propagateKVO)
        self.isa.objj_msgSend1(self, "willChangeValueForKey:", "modeName");
    self.modeName = newName;
    if (propagateKVO)
        self.isa.objj_msgSend1(self, "didChangeValueForKey:", "modeName");
    if (!self.isa.objj_msgSend0(self, "editorNamespace"))
        return;
    var modeData = ((___r1 = ((___r2 = self.isa.objj_msgSend0(self, "class")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "defaultModes"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", self.modeName));
    if (!modeData)
    {
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInternalInconsistencyException, CPString.isa.objj_msgSend2(CPString, "stringWithFormat:", "Can’t find data for mode named %@.", self.themeName));
    }
    var internalModeName = (modeData == null ? null : modeData.isa.objj_msgSend1(modeData, "objectForKey:", kACEEditorViewModeInternalName));
    var modeLocation = (modeData == null ? null : modeData.isa.objj_msgSend1(modeData, "objectForKey:", kACEEditorViewModeFileLocation));
    ACELoadScript(modeLocation, function()
    {
        self.isa.objj_msgSend0(self, "DOMWindow").ACEEditorSetModeName(internalModeName);
    }, self.isa.objj_msgSend0(self, "DOMWindow").document);
    var ___r1, ___r2;
}
,["void","CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultModes"), function(self, _cmd)
{
    var transformedObject = {};
    var enqueue = function(shortName, name, internalName)
    {
        transformedObject[shortName] = {kACEEditorViewModeTitle: name, kACEEditorViewModeFileLocation: kACEEditorViewModeResource(shortName), kACEEditorViewModeInternalName: internalName};
    };
    enqueue("mode-c_cpp", "C++", "ace/mode/c_cpp");
    enqueue("mode-coffee", "CoffeeScript", "ace/mode/coffee");
    enqueue("mode-csharp", "C#", "ace/mode/csharp");
    enqueue("mode-css", "CSS", "ace/mode/css");
    enqueue("mode-html", "HTML", "ace/mode/html");
    enqueue("mode-java", "Java", "ace/mode/java");
    enqueue("mode-javascript", "JavaScript", "ace/mode/javascript");
    enqueue("mode-perl", "Perl", "ace/mode/perl");
    enqueue("mode-php", "PHP", "ace/mode/php");
    enqueue("mode-python", "Python", "ace/mode/python");
    enqueue("mode-ruby", "Ruby", "ace/mode/ruby");
    enqueue("mode-svg", "SVG", "ace/mode/svg");
    enqueue("mode-xml", "XML", "ace/mode/xml");
    return CPDictionary.isa.objj_msgSend2(CPDictionary, "dictionaryWithJSObject:recursively:", transformedObject, YES);
}
,["CPDictionary"])]);
}{
var the_class = objj_getClass("ACEEditorView")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"ACEEditorView\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("undo:"), function(self, _cmd, sender)
{
    if (self.isa.objj_msgSend0(self, "editorObject"))
        self.isa.objj_msgSend0(self, "editorObject").undo();
}
,["void","id"]), new objj_method(sel_getUid("redo:"), function(self, _cmd, sender)
{
    if (self.isa.objj_msgSend0(self, "editorObject"))
        self.isa.objj_msgSend0(self, "editorObject").redo();
}
,["void","id"])]);
}var ACELoadScript = function(scriptURI, callbackBlock, aDocument)
{
    if (!aDocument)
        aDocument = document;
    var DOMScriptElement = aDocument.createElement("script");
    DOMScriptElement.src = scriptURI;
    DOMScriptElement.type = "text/javascript";
    if (DOMScriptElement.readyState)
    {
        DOMScriptElement.onreadystatechange = function()
        {
            if (script.readyState == "loaded" || script.readyState == "complete")
            {
                script.onreadystatechange = null;
                callbackBlock();
            }
        };
    }
    else
    {
        DOMScriptElement.onload = function()
        {
            callbackBlock();
        };
    }
    (aDocument.getElementsByTagName("head"))[0].appendChild(DOMScriptElement);
};
p;8;ACEKit.jt;78;@STATIC;1.0;i;15;ACEEditorView.jt;41;objj_executeFile("ACEEditorView.j", YES);e;