import subprocess

if __name__ == "__main__":
    with open("/home/vanillin/.sk/latest.txt", "r") as f:
        identifier = f.read()
    _ = subprocess.run(["nvim", f"/home/vanillin/.sk/{identifier}.txt"])
