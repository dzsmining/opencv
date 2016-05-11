//#include "stdafx.h"
#include <iostream>
//#include <conio.h>
#include "opencv2/highgui/highgui.hpp"
#include "opencv2/imgproc/imgproc.hpp"
#include <string>
#include <sstream>



double alpha = 2.0; /**< Simple contrast control */
int beta = 3;  /**< Simple brightness control */

int iLowH = 0;
int iHighH = 179;
int iLowS = 118;
int iHighS = 255;
int iLowV = 197;
int iHighV = 255;

double iLastX = -1;
double iLastY = -1;

using namespace cv;
using namespace std;


int main(int argc, char** argv)
{
	VideoCapture cap(0); //capture the video from webcam

	cap.set(CV_CAP_PROP_FRAME_WIDTH, 320);
	cap.set(CV_CAP_PROP_FRAME_HEIGHT, 240);

	if (!cap.isOpened())  // if not success, exit program
	{
		cout << "Cannot open the web cam" << endl;
		return -1;
	}
	namedWindow("Control", CV_WINDOW_AUTOSIZE); //create a window called "Control"
	//Create trackbars in "Control" window
	createTrackbar("LowH", "Control", &iLowH, 179); //Hue (0 - 179)
	createTrackbar("HighH", "Control", &iHighH, 179);
	createTrackbar("LowS", "Control", &iLowS, 255); //Saturation (0 - 255)
	createTrackbar("HighS", "Control", &iHighS, 255);
	createTrackbar("LowV", "Control", &iLowV, 255);//Value (0 - 255)
	createTrackbar("HighV", "Control", &iHighV, 255);
	createTrackbar("Beta", "Control", &beta, 100);
   


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
		
		Mat imgHSV;
		//	GaussianBlur(imgOriginal, imgOriginal, Size(0, 0), 3);
		cvtColor(imgOriginal, imgHSV, COLOR_BGR2HSV); //Convert the captured frame from BGR to HSV
		Mat imgThresholded;
		inRange(imgHSV, Scalar(iLowH, iLowS, iLowV), Scalar(iHighH, iHighS, iHighV), imgThresholded); //Threshold the image
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
		
	

		// if the area <= 10000, I consider that the there are no object in the image and it's because of the noise, the area is not zero
		if (dArea > 10000)
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
			std::cout << "H: " << iLowH << ", " << iHighH << std::endl;
			std::cout << "S: " << iLowS << ", " << iHighS << std::endl;
			std::cout << "V: " << iLowV << ", " << iHighV << std::endl;
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