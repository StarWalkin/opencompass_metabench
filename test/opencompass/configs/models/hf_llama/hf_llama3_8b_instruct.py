from opencompass.models import HuggingFacewithChatTemplate

models = [
    dict(
        type=HuggingFacewithChatTemplate,
        abbr='llama-3-8b-instruct-hf',
        path='/scratch/bcwg/Metabench/Model/meta-llama/Meta-Llama-3-8B-Instruct',
        max_out_len=1024,
        batch_size=32,
        run_cfg=dict(num_gpus=4),
        stop_words=['<|end_of_text|>', '<|eot_id|>'],
    )
]
