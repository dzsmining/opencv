//#include "stdafx.h"
#include <iostream>
//#include <conio.h>
#include "opencv2/highgui/highgui.hpp"
#include "opencv2/imgproc/imgproc.hpp"
#include <string>
#include <sstream>



double alpha = 2.0; /**< Simple contrast control */
int beta = 3;  /**< Simple brightness control */

int HighR = 255;
int LowR = 0;
int HighG = 255;
int LowG = 0;
int HighB = 255;
int LowB = 0;

double iLastX = -1;
double iLastY = -1;

using namespace cv;
using namespace std;


int main(int argc, char** argv)
{
	VideoCapture cap(0); //capture the video from webcam

	cap.set(CV_CAP_PROP_FRAME_WIDTH, 640);
    cap.set(CV_CAP_PROP_FRAME_HEIGHT, 480);

	if (!cap.isOpened())  // if not success, exit program
	{
		cout << "Cannot open the web cam" << endl;
		return -1;
	}
	namedWindow("Control", CV_WINDOW_AUTOSIZE); //create a window called "Control"
	//Create trackbars in "Control" window
	createTrackbar("LowR", "Control", &LowR, 255); //Hue (0 - 179)
	createTrackbar("HighR", "Control", &HighR, 255);
	createTrackbar("LowG", "Control", &LowG, 255); //Hue (0 - 179)
	createTrackbar("HighG", "Control", &HighG, 255);
	createTrackbar("LowB", "Control", &LowB, 255); //Hue (0 - 179)
	createTrackbar("HighB", "Control", &HighB, 255);
    createTrackbar("Beta", "Control",&beta, 200);


	//Capture a temporary image from the camera
	Mat imgTmp;
	cap.read(imgTmp);	//Create a black image with the size as the camera output
	Mat imgLines = Mat::zeros(imgTmp.size(), CV_8UC3);
	while (true)
	{
		Mat imgOriginal;
		bool bSuccess = cap.read(imgOriginal); // read a new frame from video
		if (!bSuccess) //if not success, break loop
		{
			cout << "Cannot read a frame from video stream" << endl;
			break;
		}
		
		
		for (int y = 0; y < imgOriginal.rows; y++){
			for (int x = 0; x < imgOriginal.cols; x++){
				for (int c = 0; c < 3; c++){
					imgOriginal.at<Vec3b>(y, x)[c] =
					saturate_cast<uchar>(alpha*(imgOriginal.at<Vec3b>(y, x)[c]) + beta);
				}
			}
		}
		
		Mat imgHSV = imgOriginal;
		GaussianBlur(imgOriginal, imgOriginal, Size(0, 0), 3);
		//cvtColor(imgOriginal, imgHSV, COLOR_BGR2HSV); //Convert the captured frame from BGR to HSV
		Mat imgThresholded;
		inRange(imgHSV, Scalar(LowB, LowG, LowR), Scalar(HighB, HighG, HighR), imgThresholded); //Threshold the image
		//morphological opening (removes small objects from the foreground)
		erode(imgThresholded, imgThresholded, getStructuringElement(MORPH_ELLIPSE, Size(5, 5)));
		dilate(imgThresholded, imgThresholded, getStructuringElement(MORPH_ELLIPSE, Size(5, 5)));
		//morphological closing (removes small holes from the foreground)
		dilate(imgThresholded, imgThresholded, getStructuringElement(MORPH_ELLIPSE, Size(5, 5)));
		erode(imgThresholded, imgThresholded, getStructuringElement(MORPH_ELLIPSE, Size(5, 5)));
		//Calculate the moments of the thresholded image
		Moments oMoments = moments(imgThresholded);
		int dM01 = oMoments.m01;
		int dM10 = oMoments.m10;
		double dArea = oMoments.m00; 
	 
  
		// if the area <= 20000, I consider that the there are no object in the image and it's because of the noise, the area is not zero
		if (dArea > 20000)
		{
			//calculate the position of the ball
			int posX = dM10 / dArea;
			int posY = dM01 / dArea;
			circle(imgOriginal, Point(posX, posY), 30, Scalar(0, 0, 255), 2);
			circle(imgOriginal, Point(posX, posY), 5, Scalar(0, 255, 0), 2);

			if (iLastX >= 0 && iLastY >= 0 && posX >= 0 && posY >= 0)
			{
				//Draw a red line from the previous point to the current point		B, G, R     Diamiter 
				//	line(imgLines, Point(posX, posY), Point(iLastX, iLastY), Scalar(0, 0, 255), 2);  here is the line
			}
			iLastX = posX;
			iLastY = posY;
			std::cout << posX << ", " << posY << std::endl;
			std::cout << std::endl;
			std::cout << "B: " << LowB << ", " << HighB << std::endl;
			std::cout << "G: " << LowG << ", " << HighG << std::endl;
			std::cout << "R: " << LowR << ", " << HighR << std::endl;
 			std::cout << "Beta: " << beta << std::endl;

		}
	
		imgOriginal = imgOriginal + imgLines;
		Mat outOriginal = imgOriginal;
		flip(outOriginal, outOriginal, 1);

		imshow("Control", imgThresholded); //show the thresholded image
		imshow("Original", outOriginal); 
		//show the original image
		//imshow("HSV", imgHSV);

		if (waitKey(30) == 27) //wait for 'esc' key press for 30ms. If 'esc' key is pressed, break loop
		{
			cout << "esc key is pressed by user" << endl;
			break;
		}
	}
	return 0;
}