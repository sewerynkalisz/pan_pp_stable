##PRETRAIN
#nohup python pretrain.py --dataset synth --arch resnet18 --img_size 640 --short_size 640 --epoch 1 > synth_640.out &
#nohup python pretrain.py --dataset synth --arch resnet18 --img_size 896 --short_size 896 --epoch 1 > synth_896.out &

## SCUT-CTW1500
#nohup python train_ctw.py --arch resnet18 --short_size 640 --img_size 640 > ctw1500_train.out &
#nohup python train_ctw.py --arch resnet18 --short_size 640 --img_size 640 --pretrain /workspaces/pan_pp_stable/checkpoints/synth_resnet18_640/checkpoint_0ep.pth.tar > scut_pretrain.out &


## Total-text
#nohup python train_tt.py --arch resnet18 --short_size 640 --img_size 640  > totalText_train.out &
nohup python train_tt.py --arch resnet18 --short_size 640 --img_size 640 --pretrain /workspaces/pan_pp_stable/checkpoints/synth_resnet18_640/checkpoint_0ep.pth.tar > tt_pretrain.out &


# ICDAR2015
#nohup python train_ic15.py --arch resnet18 --img_size 896 --short_size 896 > icdar2015_train.out &
#nohup python train_ic15.py --arch resnet18 --img_size 896 --short_size 896 --pretrain /workspaces/pan_pp_stable/checkpoints/synth_resnet18_896/checkpoint_0ep.pth.tar > ic15_pretrain.out &