import matplotlib.pyplot as plt
import numpy as np
import os


def color(value):
    color_bar = (0.5, value, 1)
    return color_bar


def gene_pic(data_dir, file_dir):
    rcf_steel = np.loadtxt(data_dir, usecols=(0, 1, 2, 3))
    rcf_steel = rcf_steel * 500

    plt.rcParams['axes.facecolor'] = 'k'
    for i in range(rcf_steel.shape[0]):
        plt.figure(figsize=(8, 8))

        line1 = [[4, 4], [0, 4]]
        line2 = [[7, 7], [0, 4]]
        line3 = [[0, 4], [4, 4]]
        line4 = [[0, 4], [7, 7]]
        line5 = [[4, 4], [7, 11]]
        line6 = [[7, 7], [7, 11]]
        line7 = [[7, 11], [4, 4]]
        line8 = [[7, 11], [7, 7]]

        steel_y1 = [[5, 5], [0, 11]]
        steel_y2 = [[6, 6], [0, 11]]
        steel_x1 = [[0, 11], [5, 5]]
        steel_x2 = [[0, 11], [6, 6]]

        plt.plot(line1[0], line2[1], c='w', linewidth=3)
        plt.plot(line2[0], line2[1], c='w', linewidth=3)
        plt.plot(line3[0], line3[1], c='w', linewidth=3)
        plt.plot(line4[0], line4[1], c='w', linewidth=3)
        plt.plot(line5[0], line5[1], c='w', linewidth=3)
        plt.plot(line6[0], line6[1], c='w', linewidth=3)
        plt.plot(line7[0], line7[1], c='w', linewidth=3)
        plt.plot(line8[0], line8[1], c='w', linewidth=3)
        plt.plot(steel_y1[0], steel_y1[1], c=color(rcf_steel[i][0]), linewidth=8)
        plt.plot(steel_y2[0], steel_y2[1], c=color(rcf_steel[i][1]), linewidth=8)
        plt.plot(steel_x1[0], steel_x1[1], c=color(rcf_steel[i][2]), linewidth=8)
        plt.plot(steel_x2[0], steel_x2[1], c=color(rcf_steel[i][3]), linewidth=8)
        plt.xticks([])
        plt.yticks([])
        plt.pause(0.5)
        plt.savefig('%s' % i + '.png', dpi=8, pad_inches=0.0, bbox_inches='tight')
        plt.close()


if __name__ == '__main__':
    save_dir = r'.\RCF_data'
    if os.path.exists(save_dir) is False:
        os.makedirs(save_dir)
    os.chdir(save_dir)
    gene_pic(r'..\x_input.txt',
             save_dir)     # 绘图数据路径和图片保存路径