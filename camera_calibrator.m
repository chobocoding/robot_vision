% Auto-generated by cameraCalibrator app on 07-Dec-2021
%-------------------------------------------------------


% Define images to process
imageFileNames = {'C:\Users\hyeon\Desktop\cg\2.jpg',...
    'C:\Users\hyeon\Desktop\cg\3.jpg',...
    'C:\Users\hyeon\Desktop\cg\4.jpg',...
    'C:\Users\hyeon\Desktop\cg\5.jpg',...
    'C:\Users\hyeon\Desktop\cg\6.jpg',...
    'C:\Users\hyeon\Desktop\cg\7.jpg',...
    'C:\Users\hyeon\Desktop\cg\8.jpg',...
    'C:\Users\hyeon\Desktop\cg\9.jpg',...
    'C:\Users\hyeon\Desktop\cg\10.jpg',...
    'C:\Users\hyeon\Desktop\cg\13.jpg',...
    };
% Detect checkerboards in images
[imagePoints, boardSize, imagesUsed] = detectCheckerboardPoints(imageFileNames);
imageFileNames = imageFileNames(imagesUsed);

% Read the first image to obtain image size
originalImage = imread(imageFileNames{1});
[mrows, ncols, ~] = size(originalImage);

% Generate world coordinates of the corners of the squares
squareSize = 25;  % in units of 'millimeters'
worldPoints = generateCheckerboardPoints(boardSize, squareSize);

% Calibrate the camera
[cameraParams, imagesUsed, estimationErrors] = estimateCameraParameters(imagePoints, worldPoints, ...
    'EstimateSkew', false, 'EstimateTangentialDistortion', false, ...
    'NumRadialDistortionCoefficients', 2, 'WorldUnits', 'millimeters', ...
    'InitialIntrinsicMatrix', [], 'InitialRadialDistortion', [], ...
    'ImageSize', [mrows, ncols]);

% View reprojection errors
h1=figure; showReprojectionErrors(cameraParams);

% Visualize pattern locations
h2=figure; showExtrinsics(cameraParams, 'CameraCentric');

% Display parameter estimation errors
displayErrors(estimationErrors, cameraParams);

% For example, you can use the calibration data to remove effects of lens distortion.
undistortedImage = undistortImage(originalImage, cameraParams);

% See additional examples of how to use the calibration data.  At the prompt type:
% showdemo('MeasuringPlanarObjectsExample')
% showdemo('StructureFromMotionExample')