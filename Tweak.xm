@interface SBAwayView
- (void)showCameraButton;
@end

%hook SBAwayView

- (void)hideCameraButton { } 

- (void)toggleCameraButton {
	BOOL &camShowing = MSHookIvar<BOOL>(self, "_cameraButtonShowing");
	if(!camShowing) %orig;
}

- (id)initWithFrame:(struct CGRect)fp8 {
	self = %orig(fp8);
	[self showCameraButton];
	return self;
}

%end
