/*
 * AppController.j
 * xslt
 *
 * Created by You on December 9, 2016.
 * Copyright 2016, Your Company All rights reserved.
 */

@import <Foundation/Foundation.j>
@import <AppKit/AppKit.j>
@import <ACEKit/ACEKit.j>

@implementation ConnectionDelegate : CPObject
{
	id _callback;
}
	
- (id)init
{
	if ([super init])
	{
		
	}
	return self;	
}
- (id)initWithCallback:(Function)callback
{
	if ([self init])
	{
		_callback = callback;
	}
	return self;
}

- (void)connection:(CPURLConnection)connection didReceiveData:(CPString)data
{
	_callback(data);
}

@end

@implementation AppController : CPObject
{
    @outlet CPWindow    theWindow;
	
	@outlet ACEEditorView xmlEditor;
	@outlet ACEEditorView xslEditor;
	@outlet ACEEditorView resultViewEditor;
	@outlet id resultViewEditorMode;
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    // This is called when the application is done loading.
}

- (void)requestFile:(CPString)path andThen:(id)callback
{
	var request = [CPURLRequest requestWithURL: [CPURL URLWithString:path]];
	var delegate = [[ConnectionDelegate alloc] initWithCallback: callback];
	var connection = [[CPURLConnection alloc] initWithRequest:request delegate:delegate startImmediately:YES];
}

- (void)awakeFromCib
{
    // This is called when the cib is done loading.
    // You can implement this method on any object instantiated from a Cib.
    // It's a useful hook for setting up current UI values, and other things.

    // In this case, we want the window from Cib to become our full browser window
    [theWindow setFullPlatformWindow:YES];
	
	[self requestFile: @"./entities.xml" andThen: function(content) { console.log(content); [xmlEditor setContentText: content]; }];
	[self requestFile: @"./transform.xsl" andThen: function(content) { console.log(content); [xslEditor setContentText: content]; }];
}

- (@action)transform:(id)sender
{
    var _parser = new DOMParser();
    var _processor = new XSLTProcessor();

	var xml = _parser.parseFromString([xmlEditor getContentText], 'text/xml');
	var xsl = _parser.parseFromString([xslEditor getContentText], 'text/xml');

    _processor.importStylesheet(xsl);

    var output = _processor.transformToFragment(xml, document.implementation.createDocument());

    if (output != null)
	{
        var _serializer = new XMLSerializer();
        [resultViewEditor setContentText: _serializer.serializeToString(output)];
    }
}

@end
