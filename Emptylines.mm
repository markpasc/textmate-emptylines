//
//  Emptylines.mm
//  Emptylines
//
//  Created by mark on 3/25/09.
//  Copyright 2009 Six Apart, Ltd.. All rights reserved.
//

#import </usr/include/objc/runtime.h>

#import "Emptylines.h"
#import "MethodSwizzle.h"

@implementation OakDocumentController (Unspacer)

- (void)saveUnspacedDocument:(id)fp8
{
	// Call the swizzled original method.
	[self saveUnspacedDocument:fp8];

	// sed us some fileage.
	NSString* fn = [textDocument filename];
	NSTask* jerb = [NSTask launchedTaskWithLaunchPath:@"/usr/bin/sed" arguments:
				   [NSArray arrayWithObjects:@"-i",@"",@"-e",@"s/[ \\t]*$//g",fn,nil]];
	[jerb waitUntilExit];  // meh

	NSLog(@"YAY SED ENDED VIA %d", [jerb terminationStatus]);
	if ([jerb terminationStatus] == 0) {
		NSLog(@"YAY I SHOULD RELOAD NOW");
	}
}

@end

@implementation Emptylines

- (id)initWithPlugInController:(id <TMPlugInController>)aController
{
	self = [self init];
	NSApp = [NSApplication sharedApplication];

	if (self)
		[self installSaver];

	return self;
}

- (void)installSaver
{
	MethodSwizzle(NSClassFromString(@"OakDocumentController"),
				  @selector(saveDocument:),
				  @selector(saveUnspacedDocument:));
}

@end
