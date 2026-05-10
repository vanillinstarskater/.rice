import subprocess
import time

if __name__ == "__main__":
    identifier: str = f"{int(time.time())}"
    with open("/home/vanillin/.sk/latest.txt", "w") as f:
        _ = f.write(identifier)
    _ = subprocess.run(["nvim", f"/home/vanillin/.sk/{identifier}.txt"])
