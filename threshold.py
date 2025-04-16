import numpy as np
import subprocess

dataset = 'tt'
short_size = 640

with open(f'/workspaces/pan_pp_stable/eval_{dataset}_scratch.txt', 'w') as f:
    for epoch in range(510,610,10):
        print(f"Start processing {epoch}")
        for threshold in np.arange(0.8, 0.91, 0.01):
            min_score = round(threshold,2)
            subprocess.call([f'python test_{dataset}.py --resume /workspaces/pan_pp_stable/checkpoints/{dataset}_resnet18_640/checkpoint_{epoch}ep.pth.tar --short_size={short_size} --min_score={min_score}'],
                            shell=True)
            output = subprocess.run(["sh", f"/workspaces/pan_pp_stable/eval/eval_{dataset}.sh"], capture_output=True)
            f.write(f"epoch: {epoch} threshold: {min_score} res: {output.stdout}\n")
            f.flush()
            dupa = 123