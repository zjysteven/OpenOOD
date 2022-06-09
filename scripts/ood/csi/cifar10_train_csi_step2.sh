#!/bin/bash
# sh scripts/ood/csi/cifar10_train_csi_step2.sh

# GPU=1
# CPU=1
# node=73
# jobname=openood

PYTHONPATH='.':$PYTHONPATH \
# srun -p dsta --mpi=pmi2 --gres=gpu:${GPU} -n1 \
# --cpus-per-task=${CPU} --ntasks-per-node=${GPU} \
# --kill-on-bad-exit=1 --job-name=${jobname} \
# -w SG-IDC1-10-51-2-${node} \

python main.py \
--config configs/datasets/cifar10/cifar10.yml \
configs/networks/csi_net.yml \
configs/pipelines/train/train_csi.yml \
configs/preprocessors/base_preprocessor.yml \
--network.pretrained True \
--network.checkpoint 'results/cifar10_csi_net_csi_step1_e5_lr0.1/best.ckpt' \
--optimizer.num_epochs 100 \
--dataset.train.batch_size 128 \
--force_merge True \
--mode csi_step2