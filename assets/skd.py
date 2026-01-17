import os
from datetime import datetime

if __name__ == "__main__":
    _ = os.system(
        f"nvim /home/vanillin/.sk/{datetime.today().strftime('%Y-%m-%d')}.txt"
    )
