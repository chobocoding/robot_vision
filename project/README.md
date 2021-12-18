# **2021 로봇비전 기말 프로젝트**
## 차량 번호판 Detector

1. 스마트폰으로 차량 번호판이 존재하는 Video 취득
2. Gaussian Blur 처리 후 Canny edge 검출
3. Canny 엣지에서 contour 찾기
4. 문자가 있는 영역을 찾은 후 pytesseract로 문자 인식(OCR)
