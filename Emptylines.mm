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
	fileMenu = [[[NSApp mainMenu] itemWithTitle:@"File"] submenu];
	if (!fileMenu)
		return;
	[fileMenu retain];

	int oldSaverIndex = [fileMenu indexOfItemWithTitle:@"Save"];
	oldSaver = [[fileMenu itemAtIndex:oldSaverIndex] retain];
	[fileMenu removeItemAtIndex:oldSaverIndex];

	NSMenuItem* newSaver = [[NSMenuItem alloc] initWithTitle:@"Save Without Spaces"	action:@selector(saveDocument:) keyEquivalent:@"s"];
	[newSaver setTarget:self];
	[newSaver setKeyEquivalentModifierMask:NSCommandKeyMask];

	[fileMenu insertItem:newSaver atIndex:oldSaverIndex];
}

- (void)saveDocument:(id)fp8
{
	NSLog(@"OH HAI SAVER OF DOCUMENTSES");

	unsigned int count;
	Method* foo = class_copyMethodList(NSClassFromString(@"OakDocumentController"), &count);
	NSLog(@"YAY GOT %d METHODS", count);
	for (; count; count--) {
		NSLog(@"YAY METHOD %s", sel_getName(method_getName(foo[count - 1])));
	}
}

@end
