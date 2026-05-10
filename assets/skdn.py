import subprocess
from datetime import datetime, timedelta

if __name__ == "__main__":
    identifier: str = f"{(datetime.today() + timedelta(days=1)).strftime('%Y-%m-%d')}"
    with open("/home/vanillin/.sk/latest.txt", "w") as f:
        _ = f.write(identifier)
    _ = subprocess.run(["nvim", f"/home/vanillin/.sk/{identifier}.txt"])
