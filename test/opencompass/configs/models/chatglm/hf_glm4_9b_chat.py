from opencompass.models import HuggingFacewithChatTemplate

models = [
    dict(
        type=HuggingFacewithChatTemplate,
        abbr='glm-4-9b-chat-hf',
        path='THUDM/glm-4-9b-chat',
        max_out_len=1024,
        batch_size=32,
        run_cfg=dict(num_gpus=4),
        stop_words=['<|endoftext|>', '<|user|>', '<|observation|>'],
    )
]
