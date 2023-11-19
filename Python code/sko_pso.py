from multiprocessing import freeze_support,set_start_method
import multiprocessing
from optimize import runos
from sko.PSO import PSO
import os

if __name__ == '__main__':
    os.environ['KMP_DUPLICATE_LIB_OK']='TRUE'
    from datetime import datetime
    start = datetime.now()
    print(start.strftime("%m.%d.%H.%M"))
    multiprocessing.freeze_support()
    lower = [0.90, 0.90, 0.90, 0.90]
    upper = [1.10, 1.10, 1.10, 1.10]

    pso = PSO(func=runos, n_dim=4, pop=12, max_iter=40, w=0.8, c1=0.5, c2=0.5, lb=lower, ub=upper, verbose=True)
    pso.gbest_x, pso.gbest_y = pso.run(precision=2)
    end = datetime.now()
    f = open(r'..\optimize_cost.txt', 'a+')    # 记录耗时
    f.write(start.strftime("%m.%d.%H.%M\n"))
    f.write(end.strftime("%m.%d.%H.%M\n"))
    f.close()
    print('end', end.strftime("%m.%d.%H.%M_"))
    print('best_x', pso.gbest_x, '\n', 'best_y', pso.gbest_y)
    print('best', pso.best_x, pso.best_y)




