export MODELSCOPE_CACHE=/mnt2/cache
export HF_DATASETS_CACHE=/mnt2/cache
nproc_per_node=4 \
MASTER_PORT=29508 \
CUDA_VISIBLE_DEVICES=0,1,2,3 \
NPROC_PER_NODE=$nproc_per_node \
swift sft \
    --model /mnt2/name/model/llama3_1_8b_instruct \
    --train_type full \
    --model_type llama3_1 \
    --dataset /mnt2/name_prune/data/winogrande_train_acl.json \
    --num_train_epochs 3 \
    --per_device_train_batch_size 2 \
    --learning_rate 1e-5 \
    --gradient_accumulation_steps 8 \
    --weight_decay 0.1 \
    --warmup_ratio 0.03 \
    --save_strategy epoch \
    --eval_strategy no \
    --model_author swift \
    --model_name swift-robot \
    --logging_steps 5 \
    --deepspeed zero2 \
    --torch_dtype bfloat16 \
    --save_total_limit 1 \
    --output_dir /mnt2/name_prune/saves/llama3-1-8b-instruct/full/winogrande_acl_swift_test \
    --gradient_checkpointing true \
    --max_length 2048
