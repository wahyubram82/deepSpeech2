#!/bin/bash
# This script trains a deepspeech model in tensorflow with sorta-grad.

clear
cur_dir=$(cd "$(dirname $0)";pwd)
echo ${cur_dir}
export PYTHONPATH=${cur_path}:$PYTHONPATH
# echo $PYTHONPATH


# echo "Training on utterances in order sorted by length"
#export CUDA_VISIBLE_DEVICES=0,1
filename='../models/librispeech/train'
datadir='../data/LibriSpeech/processed/'
# python deepSpeech_train.py --batch_size 32 --no-shuffle --max_steps 280 --num_rnn_layers 7 --num_hidden 1760 --rnn_type 'bi-dir' --num_filters 32 --initial_lr 1e-4 --train_dir $filename --data_dir $datadir --use_fp32

clear
echo "-----------------------------------"
echo "Training now on shuffled utterances"
filename='../models/librispeech/train'
datadir='../data/LibriSpeech/processed/'
python deepSpeech_train.py --batch_size 32 --shuffle --max_steps 40000 --num_rnn_layers 7 --num_hidden 1760 --rnn_type 'bi-dir' --num_filters 32 --initial_lr 1e-4 --temporal_stride 4 --train_dir $filename --data_dir $datadir

# clear
# echo "-----------------------------------"
# echo "Training now on dummy data"
# filename='../models/dummy/train'
# python deepSpeech_train.py --batch_size 32 --max_steps 40000 --num_rnn_layers 7 --num_hidden 1760 --num_filters 32 --checkpoint ../models/dummy --train_dir $filename


