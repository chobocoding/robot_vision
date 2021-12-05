import sys
import numpy as np
import cv2


src = cv2.imread('hw3.jpg ', cv2.IMREAD_GRAYSCALE)

if src is None:
    print('Image load failed!')
    sys.exit()
    
# 원하는 알고리즘으로 객체를 생성.
orb = cv2.BRISK_create()

# Keypoint, Feature Descriptor 구하기 
keypoints = orb.detect(src)
keypoints, desc = orb.compute(src, keypoints)

print('len(keypoints):', len(keypoints))
print('desc.shape:', desc.shape)

# 특징점 그리기
dst = cv2.drawKeypoints(src, keypoints, None, (-1, -1, -1),
                       cv2.DrawMatchesFlags_DRAW_RICH_KEYPOINTS)

cv2.imshow('src', src)
cv2.imshow('dst', dst)

cv2.waitKey()
cv2.destroyAllWindows()