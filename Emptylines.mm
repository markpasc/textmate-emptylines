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
	NSLog(@"OH HAI SAVER OF DOCUMENTSES");

	unsigned int count;
	Method* foo = class_copyMethodList(NSClassFromString(@"OakDocumentController"), &count);
	NSLog(@"YAY GOT %d METHODS", count);
	for (; count; count--) {
		NSLog(@"YAY METHOD %s", sel_getName(method_getName(foo[count - 1])));
	}

	// Call the swizzled original method.
	[self saveUnspacedDocument];
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
	MethodSwizzle(NSClassFromString("OakDocumentController"),
				  @selector(saveDocument:),
				  @selector(saveUnspacedDocument:));
}

@end
