
import cv2
import numpy
import camera
import threading

import time

cam = camera.Camera()
cam.start()
img = cam.getCam()	


time.sleep(1)

while True:
	t1=time.time()	
	frameId = cam.getFrame()	
	cv2.imshow("Video",cv2.resize(img[frameId],(400,300)))
	cv2.cv.WaitKey(1)
	#time.sleep(10);
	t2=time.time()
	fps = 1/(t2-t1)
	#print "fps:"+str(fps)
	

