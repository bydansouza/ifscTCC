import numpy as np
from matplotlib import pyplot as plt
import time
import cv2

class Framefilter():
    def __init__(self):
        pass

    # ===========================================================
    #  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    @staticmethod
    def stereo_bm(frame_L_input, frame_R_input):
        stereo = cv2.StereoBM_create(numDisparities=16, blockSize=15)
        disparity = stereo.compute(frame_L_input, frame_R_input)
        return disparity

    # ===========================================================
    #  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    @staticmethod
    def color_drop(frame_input):
        frame_output = cv2.cvtColor(frame_input, cv2.COLOR_BGR2GRAY)
        return frame_output

    # ===========================================================
    #  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    @staticmethod
    def low_level_enhancements(frame_input):
        frame_output = frame_input
        return frame_output

    # ===========================================================
    #  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    @staticmethod
    def horizontal_edges_extraction(frame_input):
        frame_output = cv2.Sobel(frame_input, cv2.CV_32F, 0, 1, -1)
        frame_output = cv2.convertScaleAbs(frame_output)
        frame_output = cv2.GaussianBlur(frame_output, (3, 3), 0)
        ret, frame_output = cv2.threshold(frame_output, 120, 255, cv2.THRESH_BINARY)

        kernel = np.ones((1, 1), np.uint8)
        frame_output = cv2.erode(frame_output, kernel, iterations=1)
        frame_output = cv2.dilate(frame_output, kernel, iterations=2)
        frame_output = cv2.erode(frame_output, kernel, iterations=1)
        frame_output = cv2.dilate(frame_output, kernel, iterations=2)

        return frame_output

    # ===========================================================
    #  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    @staticmethod
    def blur(frame_input):
        frame_output = cv2.GaussianBlur(frame_input, (13, 13), 0)
        return frame_output

    # ===========================================================
    #  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    @staticmethod
    def blurSobel(frame_input):
        frame_output = cv2.Sobel(frame_input, cv2.CV_32F, 0, 1, -1)
        frame_output = cv2.convertScaleAbs(frame_output)
        frame_output = cv2.GaussianBlur(frame_output, (3, 3), 0)
        return frame_output

    # ===========================================================
    #  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    @staticmethod
    def binarize(frame_input):
        frame_output = cv2.Sobel(frame_input, cv2.CV_32F, 0, 1, -1)
        frame_output = cv2.convertScaleAbs(frame_output)
        frame_output = cv2.GaussianBlur(frame_output, (3, 3), 0)
        ret, frame_output = cv2.threshold(frame_output, 120, 255, cv2.THRESH_BINARY)

        kernel = np.ones((1, 1), np.uint8)
        frame_output = cv2.erode(frame_output, kernel, iterations=1)
        frame_output = cv2.dilate(frame_output, kernel, iterations=2)
        frame_output = cv2.erode(frame_output, kernel, iterations=1)
        frame_output = cv2.dilate(frame_output, kernel, iterations=2)

        return frame_output

    # ===========================================================
    #  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    @staticmethod
    def signature_histogram_generation(frame_input):
        # frame_output = np.zeros((frame_input.shape))
        histogram = np.zeros(frame_input.shape[0])

        for i, line in enumerate(frame_input[:,]):
            line_energy = np.sum(line)**2
            histogram[i] = int(line_energy/(4096**2))

        return histogram

    # ===========================================================
    #  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    @staticmethod
    def plot_line(line_input, frame_output_shape):
        frame_output = np.zeros(frame_output_shape)
        #print(frame_output_shape)
        for i, value in enumerate(line_input):
            value = int(value)
            if value >= frame_output_shape[1]:
                value = frame_output_shape[1]
            #print(int(value))
            frame_output[i,:int(value)] = np.ones(int(value))

        return frame_output

    # ===========================================================
    #  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    @staticmethod
    def shift_estimation(frame_input):
        frame_output = frame_input
        return frame_output

    # ===========================================================
    #  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    @staticmethod
    def downshift(frame_input, shift=(0, 0), margin=(32, 24)):
        frame_output = np.zeros((frame_input.shape[0]-margin[0], frame_input.shape[1]-margin[1]))

        frame_output = frame_input[margin[0]//2 + shift[0] : margin[0]//2 + shift[0] + frame_output.shape[0], 
                                   margin[1]//2 + shift[1] : margin[1]//2 + shift[1] + frame_output.shape[1]]
        return frame_output

    # ===========================================================
    #  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    @staticmethod
    def signature_reference_update(frame_input):
        frame_output = frame_input
        return frame_output	

    # ===========================================================
    #  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    @staticmethod
    def display_frame(frame_input):
        frame_output = frame_input
        cv2.imshow('frame',frame_input) 

    # ===========================================================
    #  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    @staticmethod
    def print_frame_mean(frame_input):
        value = np.mean(frame_input)
        print(value) 

    # ===========================================================
    #  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    @staticmethod
    def concat_frame(frame_input_a, frame_input_b, axis=1):
        frame_output = np.concatenate((frame_input_a, frame_input_b), axis=axis)
        return frame_output

    # ===========================================================
    #  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    @staticmethod
    def crosscorr_line(line_input_a, line_input_b):
        line_output = np.correlate(line_input_a, line_input_b)
        return line_output

    # $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
    #  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    @staticmethod
    def testbench(video_source=0):
        record = cv2.VideoCapture(video_source)
        # record.set(cv2.CAP_PROP_FPS, 10)
        record.set(cv2.CAP_PROP_FRAME_WIDTH, 320.0)
        record.set(cv2.CAP_PROP_FRAME_HEIGHT, 240.0)

        #  ++++++++++++++++++++++++++++++++++++++++++++++++++++++
        while(1):
            ret, frame_input = record.read()
            frame_input = cv2.resize(frame_input, (320, 240), interpolation = cv2.INTER_AREA)

            fps = record.get(cv2.CAP_PROP_FPS)

            frame_gray = Framefilter.color_drop(frame_input)
            frame_edge = Framefilter.horizontal_edges_extraction(frame_gray)
            histogram = Framefilter.signature_histogram_generation(frame_edge)
            frame_histogram = Framefilter.plot_line(histogram, frame_gray.shape) 
            frame_concat = Framefilter.concat_frame(frame_edge, frame_histogram, axis=1)
 
            font = cv2.FONT_HERSHEY_SIMPLEX 
            cv2.putText(frame_concat,
                        str(fps),
                        (10, 50), 
                        font, 
                        0.5,
                        (255, 255, 255),
                        2,
                        cv2.LINE_AA)

            Framefilter.display_frame(frame_concat)
            #Framefilter.print_frame_mean(frame_concat)

            k = cv2.waitKey(30) & 0xff
            if k == 27:
                break

        #  ++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
        record.release()
        cv2.destroyAllWindows()

    # $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
    #  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    @staticmethod
    def stereovision_testbench(video_source=2):
        record= cv2.VideoCapture(video_source)

        # record.set(cv2.CAP_PROP_FPS, 10)
        record.set(cv2.CAP_PROP_FRAME_WIDTH, 320.0/2)
        record.set(cv2.CAP_PROP_FRAME_HEIGHT, 240.0/2)

        print("start")
        #  ++++++++++++++++++++++++++++++++++++++++++++++++++++++
        while(1):
            #===============================================================================
            for i in range(30):
                print(i)
                ret_L, frame_L_input = record.read()

            frame_L_gray = Framefilter.color_drop(frame_L_input)
            frame_L_blur = Framefilter.blur(frame_L_gray)

            plt.imshow(frame_L_blur)
            plt.show()

            #===============================================================================
            for i in range(30):
                print(i)
                ret_R, frame_R_input = record.read()

            frame_R_gray = Framefilter.color_drop(frame_R_input)
            frame_R_blur = Framefilter.blur(frame_R_gray)

            frame_concat = Framefilter.concat_frame(frame_L_input, frame_R_input, axis=1)
            plt.imshow(frame_concat)
            plt.show()

            #===============================================================================
            frame_disparity = Framefilter.stereo_bm(frame_L_blur, frame_R_blur)

            fig = plt.figure(figsize=(11,22))
            #===============================================================================  
            ax1 = fig.add_subplot(2, 1, 1)
            ax1.imshow(frame_concat)
            ax1.grid(False)
            plt.xticks([])
            plt.yticks([])
            #===============================================================================  
            ax2 = fig.add_subplot(2, 1, 2)
            ax2.imshow(frame_disparity)
            ax2.grid(False)
            plt.xticks([])
            plt.yticks([])
            #===============================================================================  
            fig.subplots_adjust(wspace=0, hspace=0)

            plt.show()

            # ----------------------------------------------------------------------------------------------------------
            # Esc -> EXIT while
            # print("standby")
            # while 1:
            #   k = cv2.waitKey(1) & 0xff
            #   if k ==13 or k==27:
            #     break

            # if k == 27:
            #     break
            break
            # ----------------------------------------------------------------------------------------------------------

        #  ++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
        record.release()
        cv2.destroyAllWindows()
# $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
# $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
# $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
#Framefilter.testbench(video_source="./dataset/drone_1.mp4")
#Framefilter.testbench(video_source="./dataset/driver_3.mp4")
# Framefilter.testbench(video_source=2)
Framefilter.stereovision_testbench()