import os
from datetime import datetime, timedelta

if __name__ == "__main__":
    _ = os.system(
        f"nvim /home/vanillin/.sk/{(datetime.today() + timedelta(days=1)).strftime('%Y-%m-%d')}.txt"
    )
