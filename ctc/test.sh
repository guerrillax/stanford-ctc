#!/bin/bash

# verbose
set -x

base=/scail/group/deeplearning/speech/awni/kaldi-stanford/kaldi-trunk
timit=$base/egs/timit/s5
infile=/afs/cs.stanford.edu/u/awni/ctc/models/nesterov_step_1e-4_mom_.95_anneal.bin
data=dev
numfiles=2

echo $infile
python runNNet.py --dataDir $timit/exp/nn_$data/ --numFiles $numfiles --inFile $infile --test 

$base/src/bin/compute-wer --text --mode=present ark:$timit/data/$data/text ark:hyp.txt >& wer.txt
