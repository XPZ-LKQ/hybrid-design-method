import os
import torch.nn as nn
import torch.optim as optim
import numpy as np
from PIL import Image
import torch
from torchvision import transforms, models
from torch.utils.data import DataLoader, Dataset
import time
from shutil import copy
import matplotlib.pyplot as plt

def runos(X):
    # 绘制配筋特征图
    def color(value):
        color_bar = (0.5, value, 1)
        return color_bar

    def gene_pic(A, file_dir):

        plt.rcParams['axes.facecolor'] = 'k'
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
        plt.plot(steel_y1[0], steel_y1[1], c=color(A[0]), linewidth=8)
        plt.plot(steel_y2[0], steel_y2[1], c=color(A[1]), linewidth=8)
        plt.plot(steel_x1[0], steel_x1[1], c=color(A[2]), linewidth=8)
        plt.plot(steel_x2[0], steel_x2[1], c=color(A[3]), linewidth=8)
        plt.xticks([])
        plt.yticks([])
        plt.pause(0.5)
        plt.savefig('%s' % 0 + '.png', dpi=8, pad_inches=0.0, bbox_inches='tight')
        plt.close()

    # 构建数据集
    class MyDataset(Dataset):
        def __init__(self, folder, transform):
            images = []
            for i in range(len(os.listdir(folder))):
                images.append(folder + '\\' + str(i) + '.png')
            self.folder = folder
            self.transforms = transform
            self.images = images

        def __len__(self):
            return len(self.images)

        def __getitem__(self, item):
            img_file = self.images[item]
            img = Image.open(img_file).convert('RGB')
            img = self.transforms(img)
            # print(img_label, img)
            return img

    # 用训练的预测模型预测结构响应
    def eval_epoch(model, validation_data):
        ''' Epoch operation in evaluation phase '''
        model.eval()

        with torch.no_grad():
            # for batch in tqdm(validation_data, mininterval=2, desc=desc, leave=False):
            for src_seq_v in validation_data:
                src_seq_v = src_seq_v.cuda().float()
                pred_seq_v = model(src_seq_v)
                pred_seq_v = pred_seq_v[0]
                pred = pred_seq_v[0]
        return pred

    def write_result(folder_series, tA4500, tA4501, tA4600, tA4601, ypred, collapse, Obj_fun):
        ypred = ypred.detach().cpu().squeeze(0).numpy()
        with open(folder_series, 'a') as f:
            f.write('{tA4500},{tA4501},{tA4600},{tA4601},{ypred},{collapse:.2f},{Obj_fun},\n'.format(
                tA4500=tA4500, tA4501=tA4501, tA4600=tA4600, tA4601=tA4601, ypred=ypred, collapse=collapse,
                Obj_fun=Obj_fun))
            f.write('\n')

    def main(A, file_dir):
        gene_pic(A, file_dir)
        device = torch.device("cuda:0" if torch.cuda.is_available() else "cpu")
        transform = transforms.Compose(
            [transforms.ToTensor(),
             transforms.Normalize((0.5, 0.5, 0.5), (0.5, 0.5, 0.5))])
        valid_folder = file_dir
        # valid_folder = r'D:\WSJ\youhua\03_13\13240'
        valid_data = MyDataset(folder=valid_folder, transform=transform)
        valid_loader = DataLoader(dataset=valid_data, batch_size=1)
        net = models.resnet18(num_classes=1)
        net = net.to(device)

        checkpoint = torch.load(r'..\best_resnet18.train')    # 预测模型路径
        net.load_state_dict(checkpoint['model'])

        pred_y = eval_epoch(net, valid_loader)
        print(pred_y)
        return pred_y

    os.environ['CUDA_VISIBLE_DEVICES'] = '0'
    # work_time = time.strftime("%m_%d", time.localtime())
    # pid = str(os.getpid())
    save_dir = r'./figure'   # 保存的路径
    try:
        if not os.path.exists(save_dir):
            os.makedirs(save_dir)
    except:
        print('direction is not exists')
    os.chdir(save_dir)
    tA4500 = 0.006 * X[0] - 0.0046
    tA4501 = 0.0045 * X[1] - 0.00295
    tA4600 = 0.005 * X[2] - 0.0035
    tA4601 = 0.0045 * X[3] - 0.00295
    # vn（钢筋体积 ） = x1（钢筋面积 ）*梁数（分上下部）*单根梁长度
    V4500 = tA4500 * 8 * 6
    V4501 = tA4501 * 8 * 6
    V4600 = tA4600 * 9 * 6
    V4601 = tA4601 * 9 * 6

    A1 = tA4500 * 500
    if A1 > 1:
        A1 = 1
    A2 = tA4501 * 500
    if A2 > 1:
        A2 = 1
    A3 = tA4600 * 500
    if A3 > 1:
        A3 = 1
    A4 = tA4601 * 500
    if A4 > 1:
        A4 = 1
    A = [A1, A2, A3, A4]
    ypred = main(A, r'./')
    # 判断倒塌，0为不倒，1为倒塌
    if ypred < 1200:
        collapse = 0
        obj_fun = V4500 + V4501 + V4600 + V4601
    else:
        collapse = 1
        obj_fun = 0.002 * 16 * 6  # 单位m^3
    write_result(r'..\train_value.txt', tA4500, tA4501, tA4600, tA4601, ypred, collapse, obj_fun)  # 记录优化数据
    time.sleep(1)
    print(obj_fun)
    orign_dir = r'../'
    os.chdir(orign_dir)
    return obj_fun