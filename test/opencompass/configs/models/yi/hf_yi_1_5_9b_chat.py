from opencompass.models import HuggingFacewithChatTemplate

models = [
    dict(
        type=HuggingFacewithChatTemplate,
        abbr='yi-1.5-9b-chat-hf',
        path='/scratch/bcwg/Metabench/Model/01-ai/Yi-1.5-9B-Chat/',
        max_out_len=1024,
        batch_size=32,
        run_cfg=dict(num_gpus=4),
    )
]
