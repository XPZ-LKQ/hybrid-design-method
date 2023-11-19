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

        line1 = [[2, 11], [2, 2]]
        line2 = [[2, 2], [2, 11]]
        line3 = [[5, 11], [5, 5]]
        line4 = [[5, 5], [5, 11]]

        steel_x1 = [[3, 11], [3, 3]]
        steel_x2 = [[3, 11], [4, 4]]
        steel_y1 = [[3, 3], [3, 11]]
        steel_y2 = [[4, 4], [3, 11]]

        plt.plot(line1[0], line1[1], c='w', linewidth=3)
        plt.plot(line2[0], line2[1], c='w', linewidth=3)
        plt.plot(line3[0], line3[1], c='w', linewidth=3)
        plt.plot(line4[0], line4[1], c='w', linewidth=3)
        plt.plot(steel_x1[0], steel_x1[1], c=color(rcf_steel[i][0]), linewidth=8)
        plt.plot(steel_x2[0], steel_x2[1], c=color(rcf_steel[i][1]), linewidth=8)
        plt.plot(steel_y1[0], steel_y1[1], c=color(rcf_steel[i][2]), linewidth=8)
        plt.plot(steel_y2[0], steel_y2[1], c=color(rcf_steel[i][3]), linewidth=8)
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