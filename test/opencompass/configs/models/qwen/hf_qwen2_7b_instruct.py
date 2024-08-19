from opencompass.models import HuggingFacewithChatTemplate

models = [
    dict(
        type=HuggingFacewithChatTemplate,
        abbr='qwen2-7b-instruct-hf',
        path='/scratch/bcwg/Metabench/Model/Qwen/Qwen2-7B-Instruct',
        max_out_len=1024,
        batch_size=32,
        run_cfg=dict(num_gpus=4),
    )
]
